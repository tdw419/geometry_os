"""
CLI Authentication Module for PixelRTS Phase 4 Security

This module provides authentication and authorization for CLI commands,
including user management, JWT token handling, and the @require_auth decorator.
"""

import os
import json
import hashlib
import jwt
import getpass
from pathlib import Path
from datetime import datetime, timedelta, timezone
from functools import wraps
from typing import Optional, Dict, List, Any, Callable

# Default configuration directory
DEFAULT_CONFIG_DIR = Path.home() / ".pixelrts"
# Token file name
TOKEN_FILENAME = "token"
# Users file name
USERS_FILENAME = "users.enc"
# JWT secret key environment variable
SECRET_KEY_ENV = "PIXELRTS_SECRET_KEY"
# Default JWT expiration time (hours)
DEFAULT_TOKEN_EXPIRATION_HOURS = 24


# Global auth context singleton
_GLOBAL_AUTH_CONTEXT: Optional['AuthContext'] = None


class AuthContext:
    """
    Manages all security components for CLI authentication.

    This class handles user management, password hashing, JWT token generation,
    and authentication for CLI commands.
    """

    def __init__(self, config_dir: str = None, encryption_key: bytes = None):
        """
        Initialize the AuthContext.

        Args:
            config_dir: Directory for storing configuration and user data.
                       Defaults to ~/.pixelrts/
            encryption_key: Key for encrypting sensitive data (future use).
        """
        self.config_dir = Path(config_dir) if config_dir else DEFAULT_CONFIG_DIR
        self.config_dir.mkdir(parents=True, exist_ok=True)

        # Initialize secret key for JWT tokens
        self.secret_key = os.getenv(SECRET_KEY_ENV)
        if not self.secret_key:
            # Generate a default secret key (not recommended for production)
            self.secret_key = hashlib.sha256(b"pixelrts-default-secret-key").hexdigest()

        # Initialize users storage
        self.users: Dict[str, Dict[str, Any]] = {}
        self._load_users()

    def _load_users(self):
        """Load users from secure storage."""
        users_file = self.config_dir / USERS_FILENAME

        if users_file.exists():
            try:
                with open(users_file, 'r') as f:
                    self.users = json.load(f)
            except (json.JSONDecodeError, IOError) as e:
                # If file is corrupted, start with empty users
                self.users = {}

    def _save_users(self):
        """Save users to secure storage."""
        users_file = self.config_dir / USERS_FILENAME

        # Set restrictive permissions before writing
        users_file.touch(mode=0o600)

        with open(users_file, 'w') as f:
            json.dump(self.users, f, indent=2)

        # Ensure permissions are set correctly
        users_file.chmod(0o600)

    def _hash_password(self, password: str) -> str:
        """
        Hash a password using SHA-256 with salt.

        Args:
            password: Plain text password

        Returns:
            Hashed password string
        """
        # Use a simple salted hash (in production, use bcrypt or argon2)
        salt = "pixelrts_salt"
        salted = password + salt
        return hashlib.sha256(salted.encode()).hexdigest()

    def create_user(
        self,
        username: str,
        email: str,
        password: str,
        roles: List[str]
    ) -> bool:
        """
        Create a new user.

        Args:
            username: Unique username
            email: User email address
            password: Plain text password (will be hashed)
            roles: List of role names (e.g., ['user', 'admin'])

        Returns:
            True if user was created, False if username already exists
        """
        if username in self.users:
            return False

        # Validate roles against existing ROLE_DEFINITIONS
        try:
            from .permissions import ROLE_DEFINITIONS
            valid_roles = set(ROLE_DEFINITIONS.keys())
        except ImportError:
            # Fallback if permissions module has different structure
            valid_roles = {"viewer", "operator", "admin", "auditor"}

        for role in roles:
            if role not in valid_roles:
                raise ValueError(f"Invalid role: {role}. Valid roles: {valid_roles}")

        self.users[username] = {
            "username": username,
            "email": email,
            "password_hash": self._hash_password(password),
            "roles": roles,
            "created_at": datetime.now(timezone.utc).isoformat()
        }

        self._save_users()
        return True

    def authenticate(self, username: str, password: str) -> Optional[Dict[str, Any]]:
        """
        Authenticate a user with username and password.

        Args:
            username: Username to authenticate
            password: Plain text password

        Returns:
            User dict if authentication successful, None otherwise
        """
        user = self.users.get(username)
        if not user:
            return None

        password_hash = self._hash_password(password)
        if user["password_hash"] != password_hash:
            return None

        # Return user dict without password hash
        return {
            "username": user["username"],
            "email": user["email"],
            "roles": user["roles"],
            "created_at": user["created_at"]
        }

    def login(self, username: str, password: str) -> Optional[str]:
        """
        Login a user and return a JWT access token.

        Args:
            username: Username to login
            password: Plain text password

        Returns:
            JWT access token string if successful, None otherwise
        """
        user = self.authenticate(username, password)
        if not user:
            return None

        # Create JWT token
        expiration = datetime.now(timezone.utc) + timedelta(hours=DEFAULT_TOKEN_EXPIRATION_HOURS)
        token_payload = {
            "sub": username,
            "email": user["email"],
            "roles": user["roles"],
            "exp": expiration,
            "iat": datetime.now(timezone.utc)
        }

        token = jwt.encode(token_payload, self.secret_key, algorithm="HS256")
        return token

    def get_current_user(self, token: str) -> Optional[Dict[str, Any]]:
        """
        Get user from JWT token.

        Args:
            token: JWT access token

        Returns:
            User dict if token valid, None otherwise
        """
        try:
            payload = jwt.decode(token, self.secret_key, algorithms=["HS256"])
            username = payload.get("sub")

            if username not in self.users:
                return None

            user = self.users[username]
            return {
                "username": user["username"],
                "email": user["email"],
                "roles": user["roles"],
                "created_at": user["created_at"]
            }

        except jwt.ExpiredSignatureError:
            # Token has expired
            return None
        except jwt.InvalidTokenError:
            # Invalid token
            return None


def get_auth_context() -> AuthContext:
    """
    Get the global auth context singleton.

    Returns:
        AuthContext instance
    """
    global _GLOBAL_AUTH_CONTEXT

    if _GLOBAL_AUTH_CONTEXT is None:
        # Use default config directory
        _GLOBAL_AUTH_CONTEXT = AuthContext()

    return _GLOBAL_AUTH_CONTEXT


def _save_token_to_file(token: str, config_dir: str = None):
    """
    Save a token to the token file with secure permissions.

    Args:
        token: JWT token string
        config_dir: Configuration directory (defaults to ~/.pixelrts/)
    """
    config_path = Path(config_dir) if config_dir else DEFAULT_CONFIG_DIR
    config_path.mkdir(parents=True, exist_ok=True)

    token_file = config_path / TOKEN_FILENAME

    # Write token with restrictive permissions
    with open(token_file, 'w') as f:
        f.write(token)

    # Set permissions to read/write for owner only
    token_file.chmod(0o600)


def _load_token_from_file(config_dir: str = None) -> Optional[str]:
    """
    Load a token from the token file.

    Args:
        config_dir: Configuration directory (defaults to ~/.pixelrts/)

    Returns:
        Token string if file exists, None otherwise
    """
    config_path = Path(config_dir) if config_dir else DEFAULT_CONFIG_DIR
    token_file = config_path / TOKEN_FILENAME

    if not token_file.exists():
        return None

    with open(token_file, 'r') as f:
        return f.read().strip()


def _remove_token_file(config_dir: str = None):
    """
    Remove the token file (logout).

    Args:
        config_dir: Configuration directory (defaults to ~/.pixelrts/)
    """
    config_path = Path(config_dir) if config_dir else DEFAULT_CONFIG_DIR
    token_file = config_path / TOKEN_FILENAME

    if token_file.exists():
        token_file.unlink()


def require_auth(func: Callable) -> Callable:
    """
    Decorator to require authentication for a CLI command.

    This decorator checks for a valid token in the token file and
    passes the authenticated user to the decorated function.

    Args:
        func: Function to decorate

    Returns:
        Decorated function that requires authentication

    Raises:
        PermissionError: If authentication fails

    Example:
        @require_auth
        def protected_command(user):
            print(f"Hello, {user['username']}")
    """
    @wraps(func)
    def wrapper(*args, **kwargs):
        ctx = get_auth_context()
        token = _load_token_from_file()

        if not token:
            raise PermissionError(
                "Authentication required. Please login with 'pixelrts-v3 auth login'"
            )

        user = ctx.get_current_user(token)

        if not user:
            raise PermissionError(
                "Invalid or expired token. Please login again with 'pixelrts-v3 auth login'"
            )

        # Pass user as first argument after self (if method) or as first argument
        return func(user, *args, **kwargs)

    return wrapper


def prompt_for_password(prompt: str = "Password: ") -> str:
    """
    Prompt for password without echoing.

    Args:
        prompt: Prompt string to display

    Returns:
        Password string
    """
    return getpass.getpass(prompt)


def prompt_for_username(default: str = None) -> str:
    """
    Prompt for username with optional default.

    Args:
        default: Default username if user just presses Enter

    Returns:
        Username string
    """
    if default:
        username = input(f"Username [{default}]: ").strip()
        return username if username else default
    else:
        return input("Username: ").strip()


# Export public API
__all__ = [
    'AuthContext',
    'get_auth_context',
    'require_auth',
    '_save_token_to_file',
    '_load_token_from_file',
    '_remove_token_file',
    'prompt_for_password',
    'prompt_for_username',
]
