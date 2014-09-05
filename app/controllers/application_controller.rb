class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  serialization_scope :view_context

  private

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Variables for navbar
  def header
    @has_navbar = true
    @user_login = User.new
    @is_login = true
    if current_user
      @categories = current_user.categories.all
    end
  end

  # Default for Active Model Serializers
  def default_serializer_options  
    { root: false }  
  end
  
end
