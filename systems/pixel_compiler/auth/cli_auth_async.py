"""
Async CLI Authentication Module for PixelRTS Phase 4 Security

This module provides asynchronous authentication and authorization for CLI commands,
including user management, JWT token handling, and the @async_require_auth decorator.

Migration from sync to async for improved responsiveness under load.
"""

import asyncio
import functools
import getpass
import hashlib
import json
import os
from collections.abc import Callable, Coroutine
from datetime import UTC, datetime, timedelta
from functools import wraps
from pathlib import Path
from typing import Any, Optional, ParamSpec, TypeVar

import aiofiles
import jwt

# Helper to run sync file operations in thread pool
async def _async_chmod(path: str, mode: int) -> None:
    """Async chmod using thread pool."""
    loop = asyncio.get_running_loop()
    await loop.run_in_executor(None, functools.partial(os.chmod, path, mode))


async def _async_makedirs(path: str, exist_ok: bool = True) -> None:
    """Async makedirs using thread pool."""
    loop = asyncio.get_running_loop()
    await loop.run_in_executor(None, functools.partial(os.makedirs, path, exist_ok=exist_ok))


async def _async_path_exists(path: str) -> bool:
    """Async path.exists using thread pool."""
    loop = asyncio.get_running_loop()
    return await loop.run_in_executor(None, os.path.exists, path)


async def _async_remove(path: str) -> None:
    """Async os.remove using thread pool."""
    loop = asyncio.get_running_loop()
    await loop.run_in_executor(None, os.remove, path)


async def _async_replace(src: str, dst: str) -> None:
    """Atomic file replace using thread pool."""
    loop = asyncio.get_running_loop()
    await loop.run_in_executor(None, functools.partial(os.replace, src, dst))

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

# Type variables for decorator typing
P = ParamSpec("P")
R = TypeVar("R")

# Global auth context singleton
_GLOBAL_AUTH_CONTEXT: Optional['AsyncAuthContext'] = None


class AsyncAuthContext:
    """
    Manages all security components for CLI authentication (async version).

    This class handles user management, password hashing, JWT token generation,
    and authentication for CLI commands with async file I/O for better scalability.
    """

    def __init__(self, config_dir: str = None, encryption_key: bytes = None):
        """
        Initialize the AsyncAuthContext.

        Args:
            config_dir: Directory for storing configuration and user data.
                       Defaults to ~/.pixelrts/
            encryption_key: Key for encrypting sensitive data (future use).
        """
        self.config_dir = Path(config_dir) if config_dir else DEFAULT_CONFIG_DIR
        self._config_dir_ensured = False

        # Initialize secret key for JWT tokens
        self.secret_key = os.getenv(SECRET_KEY_ENV)
        if not self.secret_key:
            # Generate a default secret key (not recommended for production)
            self.secret_key = hashlib.sha256(b"pixelrts-default-secret-key").hexdigest()

        # Initialize users storage
        self.users: dict[str, dict[str, Any]] = {}
        self._users_loaded = False
        self._users_lock = asyncio.Lock()

    async def _ensure_config_dir(self) -> None:
        """Ensure config directory exists (async)."""
        if not self._config_dir_ensured:
            await _async_makedirs(str(self.config_dir), exist_ok=True)
            self._config_dir_ensured = True

    async def _load_users(self) -> None:
        """Load users from secure storage (async)."""
        async with self._users_lock:
            if self._users_loaded:
                return

            await self._ensure_config_dir()
            users_file = self.config_dir / USERS_FILENAME

            if await _async_path_exists(str(users_file)):
                try:
                    async with aiofiles.open(users_file, mode='r') as f:
                        content = await f.read()
                        self.users = json.loads(content)
                except (OSError, json.JSONDecodeError):
                    # If file is corrupted, start with empty users
                    self.users = {}

            self._users_loaded = True

    async def _save_users(self) -> None:
        """Save users to secure storage (async)."""
        async with self._users_lock:
            await self._ensure_config_dir()
            users_file = self.config_dir / USERS_FILENAME

            # Create file with restrictive permissions
            await _async_makedirs(str(users_file.parent), exist_ok=True)

            # Write atomically using temp file
            temp_file = users_file.with_suffix('.tmp')
            async with aiofiles.open(temp_file, mode='w') as f:
                await f.write(json.dumps(self.users, indent=2))

            # Set permissions and rename atomically
            await _async_chmod(str(temp_file), 0o600)
            await _async_replace(str(temp_file), str(users_file))

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

    async def create_user(
        self,
        username: str,
        email: str,
        password: str,
        roles: list[str]
    ) -> bool:
        """
        Create a new user (async).

        Args:
            username: Unique username
            email: User email address
            password: Plain text password (will be hashed)
            roles: List of role names (e.g., ['user', 'admin'])

        Returns:
            True if user was created, False if username already exists
        """
        await self._load_users()

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
            "created_at": datetime.now(UTC).isoformat()
        }

        await self._save_users()
        return True

    async def authenticate(self, username: str, password: str) -> dict[str, Any] | None:
        """
        Authenticate a user with username and password (async).

        Args:
            username: Username to authenticate
            password: Plain text password

        Returns:
            User dict if authentication successful, None otherwise
        """
        await self._load_users()

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

    async def login(self, username: str, password: str) -> str | None:
        """
        Login a user and return a JWT access token (async).

        Args:
            username: Username to login
            password: Plain text password

        Returns:
            JWT access token string if successful, None otherwise
        """
        user = await self.authenticate(username, password)
        if not user:
            return None

        # Create JWT token
        expiration = datetime.now(UTC) + timedelta(hours=DEFAULT_TOKEN_EXPIRATION_HOURS)
        token_payload = {
            "sub": username,
            "email": user["email"],
            "roles": user["roles"],
            "exp": expiration,
            "iat": datetime.now(UTC)
        }

        token = jwt.encode(token_payload, self.secret_key, algorithm="HS256")
        return token

    async def get_current_user(self, token: str) -> dict[str, Any] | None:
        """
        Get user from JWT token (async).

        Args:
            token: JWT access token

        Returns:
            User dict if token valid, None otherwise
        """
        await self._load_users()

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

    async def refresh_token(self, token: str) -> str | None:
        """
        Refresh an existing valid token (async).

        Args:
            token: Current valid JWT token

        Returns:
            New JWT token if refresh successful, None otherwise
        """
        user = await self.get_current_user(token)
        if not user:
            return None

        # Create new token
        expiration = datetime.now(UTC) + timedelta(hours=DEFAULT_TOKEN_EXPIRATION_HOURS)
        token_payload = {
            "sub": user["username"],
            "email": user["email"],
            "roles": user["roles"],
            "exp": expiration,
            "iat": datetime.now(UTC)
        }

        return jwt.encode(token_payload, self.secret_key, algorithm="HS256")


def get_auth_context() -> AsyncAuthContext:
    """
    Get the global auth context singleton.

    Returns:
        AsyncAuthContext instance
    """
    global _GLOBAL_AUTH_CONTEXT

    if _GLOBAL_AUTH_CONTEXT is None:
        # Use default config directory
        _GLOBAL_AUTH_CONTEXT = AsyncAuthContext()

    return _GLOBAL_AUTH_CONTEXT


def reset_auth_context() -> None:
    """
    Reset the global auth context (useful for testing).
    """
    global _GLOBAL_AUTH_CONTEXT
    _GLOBAL_AUTH_CONTEXT = None


async def _save_token_to_file(token: str, config_dir: str = None) -> None:
    """
    Save a token to the token file with secure permissions (async).

    Args:
        token: JWT token string
        config_dir: Configuration directory (defaults to ~/.pixelrts/)
    """
    config_path = Path(config_dir) if config_dir else DEFAULT_CONFIG_DIR
    await _async_makedirs(str(config_path), exist_ok=True)

    token_file = config_path / TOKEN_FILENAME

    # Write token with restrictive permissions
    async with aiofiles.open(token_file, mode='w') as f:
        await f.write(token)

    # Set permissions to read/write for owner only
    await _async_chmod(str(token_file), 0o600)


async def _load_token_from_file(config_dir: str = None) -> str | None:
    """
    Load a token from the token file (async).

    Args:
        config_dir: Configuration directory (defaults to ~/.pixelrts/)

    Returns:
        Token string if file exists, None otherwise
    """
    config_path = Path(config_dir) if config_dir else DEFAULT_CONFIG_DIR
    token_file = config_path / TOKEN_FILENAME

    if not await _async_path_exists(str(token_file)):
        return None

    async with aiofiles.open(token_file, mode='r') as f:
        content = await f.read()
        return content.strip()


async def _remove_token_file(config_dir: str = None) -> None:
    """
    Remove the token file (logout) (async).

    Args:
        config_dir: Configuration directory (defaults to ~/.pixelrts/)
    """
    config_path = Path(config_dir) if config_dir else DEFAULT_CONFIG_DIR
    token_file = config_path / TOKEN_FILENAME

    if await _async_path_exists(str(token_file)):
        await _async_remove(str(token_file))


def async_require_auth(func: Callable[P, Coroutine[Any, Any, R]]) -> Callable[P, Coroutine[Any, Any, R]]:
    """
    Decorator to require authentication for an async CLI command.

    This decorator checks for a valid token in the token file and
    passes the authenticated user to the decorated async function.

    Args:
        func: Async function to decorate

    Returns:
        Decorated async function that requires authentication

    Raises:
        PermissionError: If authentication fails

    Example:
        @async_require_auth
        async def protected_command(user):
            print(f"Hello, {user['username']}")
    """
    @wraps(func)
    async def wrapper(*args: P.args, **kwargs: P.kwargs) -> R:
        ctx = get_auth_context()
        token = await _load_token_from_file()

        if not token:
            raise PermissionError(
                "Authentication required. Please login with 'pixelrts-v3 auth login'"
            )

        user = await ctx.get_current_user(token)

        if not user:
            raise PermissionError(
                "Invalid or expired token. Please login again with 'pixelrts-v3 auth login'"
            )

        # Pass user as first argument after self (if method) or as first argument
        return await func(user, *args, **kwargs)

    return wrapper


def require_auth_async(func: Callable[P, Coroutine[Any, Any, R]]) -> Callable[P, Coroutine[Any, Any, R]]:
    """
    Alias for async_require_auth for backward compatibility.
    """
    return async_require_auth(func)


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


# Sync wrapper functions for backward compatibility
def _run_async(coro):
    """Run async function in sync context."""
    try:
        loop = asyncio.get_running_loop()
    except RuntimeError:
        loop = None

    if loop and loop.is_running():
        # We're in an async context, create a task
        import concurrent.futures
        with concurrent.futures.ThreadPoolExecutor() as pool:
            future = pool.submit(asyncio.run, coro)
            return future.result()
    else:
        # We can create a new event loop
        return asyncio.run(coro)


class SyncAuthContextWrapper:
    """
    Synchronous wrapper for AsyncAuthContext for backward compatibility.

    Provides sync methods that internally call async methods.
    """

    def __init__(self, async_context: AsyncAuthContext = None):
        self._async_context = async_context or get_auth_context()

    def create_user(self, username: str, email: str, password: str, roles: list[str]) -> bool:
        """Sync wrapper for create_user."""
        return _run_async(self._async_context.create_user(username, email, password, roles))

    def authenticate(self, username: str, password: str) -> dict[str, Any] | None:
        """Sync wrapper for authenticate."""
        return _run_async(self._async_context.authenticate(username, password))

    def login(self, username: str, password: str) -> str | None:
        """Sync wrapper for login."""
        return _run_async(self._async_context.login(username, password))

    def get_current_user(self, token: str) -> dict[str, Any] | None:
        """Sync wrapper for get_current_user."""
        return _run_async(self._async_context.get_current_user(token))

    @property
    def users(self) -> dict[str, dict[str, Any]]:
        """Access users dict (loads synchronously)."""
        _run_async(self._async_context._load_users())
        return self._async_context.users

    @property
    def secret_key(self) -> str:
        """Access secret key."""
        return self._async_context.secret_key

    @property
    def config_dir(self) -> Path:
        """Access config directory."""
        return self._async_context.config_dir


# Export public API
__all__ = [
    'AsyncAuthContext',
    'get_auth_context',
    'reset_auth_context',
    'async_require_auth',
    'require_auth_async',
    '_save_token_to_file',
    '_load_token_from_file',
    '_remove_token_file',
    'prompt_for_password',
    'prompt_for_username',
    'SyncAuthContextWrapper',
]
