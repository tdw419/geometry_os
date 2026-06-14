"""
Tests for Async CLI Authentication Module (cli_auth_async.py)

Tests the AsyncAuthContext class, user management, JWT token handling,
and the @async_require_auth decorator.
"""

import asyncio
import json
import shutil
import tempfile
from datetime import UTC, datetime, timedelta
from pathlib import Path
from unittest.mock import AsyncMock, patch

import pytest

from systems.pixel_compiler.auth.cli_auth_async import (
    AsyncAuthContext,
    get_auth_context,
    reset_auth_context,
    async_require_auth,
    _save_token_to_file,
    _load_token_from_file,
    _remove_token_file,
    prompt_for_password,
    prompt_for_username,
    SyncAuthContextWrapper,
)


class TestAsyncAuthContext:
    """Test AsyncAuthContext class initialization and basic operations."""

    @pytest.fixture
    def temp_config_dir(self):
        """Create a temporary config directory for testing."""
        temp_dir = tempfile.mkdtemp()
        yield temp_dir
        shutil.rmtree(temp_dir)

    @pytest.fixture
    def encryption_key(self):
        """Provide a test encryption key."""
        return b'test_key_32_bytes_long_for_test!'

    @pytest.fixture
    def auth_context(self, temp_config_dir, encryption_key):
        """Create an AsyncAuthContext instance for testing."""
        return AsyncAuthContext(config_dir=temp_config_dir, encryption_key=encryption_key)

    @pytest.mark.asyncio
    async def test_init_creates_config_directory(self, temp_config_dir, encryption_key):
        """Test that AsyncAuthContext creates the config directory if it doesn't exist."""
        non_existent_dir = Path(temp_config_dir) / "new_config"
        ctx = AsyncAuthContext(config_dir=str(non_existent_dir), encryption_key=encryption_key)
        await ctx._ensure_config_dir()
        assert non_existent_dir.exists()
        assert non_existent_dir.is_dir()

    @pytest.mark.asyncio
    async def test_init_loads_existing_users(self, temp_config_dir, encryption_key):
        """Test that AsyncAuthContext loads existing users from storage."""
        # Create a users file first
        users_file = Path(temp_config_dir) / "users.enc"
        users_file.parent.mkdir(parents=True, exist_ok=True)

        test_users = {
            "testuser": {
                "username": "testuser",
                "email": "test@example.com",
                "password_hash": "hash123",
                "roles": ["user"],
                "created_at": "2024-01-01T00:00:00"
            }
        }

        # Simple write for test (in real scenario this would be encrypted)
        with open(users_file, 'w') as f:
            json.dump(test_users, f)

        ctx = AsyncAuthContext(config_dir=temp_config_dir, encryption_key=encryption_key)
        await ctx._load_users()
        assert "testuser" in ctx.users
        assert ctx.users["testuser"]["email"] == "test@example.com"

    @pytest.mark.asyncio
    async def test_create_user_success(self, auth_context):
        """Test successful user creation."""
        result = await auth_context.create_user(
            username="newuser",
            email="newuser@example.com",
            password="SecurePass123!",
            roles=["operator"]  # Use valid role from ROLE_DEFINITIONS
        )

        assert result is True
        assert "newuser" in auth_context.users
        assert auth_context.users["newuser"]["email"] == "newuser@example.com"
        assert auth_context.users["newuser"]["roles"] == ["operator"]
        assert "password_hash" in auth_context.users["newuser"]
        assert auth_context.users["newuser"]["password_hash"] != "SecurePass123!"  # Should be hashed

    @pytest.mark.asyncio
    async def test_create_duplicate_user_fails(self, auth_context):
        """Test that creating a duplicate user fails."""
        await auth_context.create_user("user1", "user1@example.com", "pass123", ["operator"])

        result = await auth_context.create_user(
            username="user1",
            email="different@example.com",
            password="pass456",
            roles=["admin"]
        )

        assert result is False

    @pytest.mark.asyncio
    async def test_create_user_with_multiple_roles(self, auth_context):
        """Test creating a user with multiple roles."""
        await auth_context.create_user(
            username="adminuser",
            email="admin@example.com",
            password="AdminPass123!",
            roles=["admin", "operator", "auditor"]
        )

        assert set(auth_context.users["adminuser"]["roles"]) == {"admin", "operator", "auditor"}

    @pytest.mark.asyncio
    async def test_authenticate_success(self, auth_context):
        """Test successful authentication."""
        await auth_context.create_user("authuser", "auth@example.com", "AuthPass123!", ["operator"])

        user = await auth_context.authenticate("authuser", "AuthPass123!")
        assert user is not None
        assert user["username"] == "authuser"
        assert user["email"] == "auth@example.com"

    @pytest.mark.asyncio
    async def test_authenticate_wrong_password(self, auth_context):
        """Test authentication with wrong password fails."""
        await auth_context.create_user("authuser", "auth@example.com", "AuthPass123!", ["operator"])

        user = await auth_context.authenticate("authuser", "WrongPassword!")
        assert user is None

    @pytest.mark.asyncio
    async def test_authenticate_nonexistent_user(self, auth_context):
        """Test authentication with non-existent user fails."""
        user = await auth_context.authenticate("nonexistent", "anypassword")
        assert user is None

    @pytest.mark.asyncio
    async def test_login_returns_token(self, auth_context):
        """Test that login returns a JWT token."""
        await auth_context.create_user("loginuser", "login@example.com", "LoginPass123!", ["operator"])

        token = await auth_context.login("loginuser", "LoginPass123!")
        assert token is not None
        assert isinstance(token, str)
        assert len(token) > 0  # JWT tokens should be substantial strings

    @pytest.mark.asyncio
    async def test_login_fails_with_invalid_credentials(self, auth_context):
        """Test that login fails with invalid credentials."""
        await auth_context.create_user("loginuser", "login@example.com", "LoginPass123!", ["operator"])

        token = await auth_context.login("loginuser", "WrongPassword")
        assert token is None

    @pytest.mark.asyncio
    async def test_get_current_user_from_valid_token(self, auth_context):
        """Test getting current user from a valid JWT token."""
        await auth_context.create_user("tokenuser", "token@example.com", "TokenPass123!", ["operator"])
        token = await auth_context.login("tokenuser", "TokenPass123!")

        user = await auth_context.get_current_user(token)
        assert user is not None
        assert user["username"] == "tokenuser"
        assert user["email"] == "token@example.com"

    @pytest.mark.asyncio
    async def test_get_current_user_from_invalid_token(self, auth_context):
        """Test getting current user from an invalid token returns None."""
        user = await auth_context.get_current_user("invalid.token.here")
        assert user is None

    @pytest.mark.asyncio
    async def test_get_current_user_from_expired_token(self, auth_context):
        """Test getting current user from an expired token returns None."""
        await auth_context.create_user("expireuser", "expire@example.com", "ExpirePass123!", ["operator"])

        # Create a token that's already expired
        import jwt
        expired_token = jwt.encode(
            {
                "sub": "expireuser",
                "exp": datetime.now(UTC) - timedelta(hours=1)
            },
            auth_context.secret_key,
            algorithm="HS256"
        )

        user = await auth_context.get_current_user(expired_token)
        assert user is None

    @pytest.mark.asyncio
    async def test_refresh_token(self, auth_context):
        """Test refreshing a valid token."""
        await auth_context.create_user("refreshuser", "refresh@example.com", "RefreshPass123!", ["operator"])
        token = await auth_context.login("refreshuser", "RefreshPass123!")

        new_token = await auth_context.refresh_token(token)
        assert new_token is not None
        assert new_token != token

    @pytest.mark.asyncio
    async def test_concurrent_auth_operations(self, auth_context):
        """Test that concurrent auth operations are thread-safe."""
        # Create multiple users concurrently
        tasks = [
            auth_context.create_user(f"user{i}", f"user{i}@example.com", f"pass{i}!", ["operator"])
            for i in range(10)
        ]
        results = await asyncio.gather(*tasks)

        assert all(results)
        assert len(auth_context.users) == 10


class TestAsyncRequireAuthDecorator:
    """Test the @async_require_auth decorator."""

    @pytest.fixture
    def temp_config_dir(self):
        """Create a temporary config directory for testing."""
        temp_dir = tempfile.mkdtemp()
        yield temp_dir
        shutil.rmtree(temp_dir)

    @pytest.fixture
    def auth_context(self, temp_config_dir):
        """Create an AsyncAuthContext instance for testing."""
        encryption_key = b'test_key_32_bytes_long_for_test!'
        return AsyncAuthContext(config_dir=temp_config_dir, encryption_key=encryption_key)

    @pytest.mark.asyncio
    async def test_require_auth_with_valid_token(self, auth_context, temp_config_dir):
        """Test that @async_require_auth allows access with valid token."""
        await auth_context.create_user("decoratoruser", "decorator@example.com", "DecoratorPass123!", ["operator"])
        token = await auth_context.login("decoratoruser", "DecoratorPass123!")
        await _save_token_to_file(token, config_dir=temp_config_dir)

        @async_require_auth
        async def protected_function(user):
            return f"Hello, {user['username']}"

        with patch('systems.pixel_compiler.auth.cli_auth_async.get_auth_context', return_value=auth_context):
            with patch('systems.pixel_compiler.auth.cli_auth_async._load_token_from_file',
                       new_callable=AsyncMock) as mock_load:
                mock_load.return_value = token
                result = await protected_function()
                assert result == "Hello, decoratoruser"

    @pytest.mark.asyncio
    async def test_require_auth_with_invalid_token(self, auth_context, temp_config_dir):
        """Test that @async_require_auth denies access with invalid token."""
        @async_require_auth
        async def protected_function(user):
            return "Should not reach here"

        with patch('systems.pixel_compiler.auth.cli_auth_async.get_auth_context', return_value=auth_context):
            with patch('systems.pixel_compiler.auth.cli_auth_async._load_token_from_file',
                       new_callable=AsyncMock) as mock_load:
                mock_load.return_value = "invalid"
                with pytest.raises(PermissionError):
                    await protected_function()

    @pytest.mark.asyncio
    async def test_require_auth_with_no_token(self, auth_context, temp_config_dir):
        """Test that @async_require_auth denies access with no token."""
        @async_require_auth
        async def protected_function(user):
            return "Should not reach here"

        with patch('systems.pixel_compiler.auth.cli_auth_async.get_auth_context', return_value=auth_context):
            with patch('systems.pixel_compiler.auth.cli_auth_async._load_token_from_file',
                       new_callable=AsyncMock) as mock_load:
                mock_load.return_value = None
                with pytest.raises(PermissionError):
                    await protected_function()


class TestGlobalAuthContext:
    """Test the global auth context singleton."""

    def test_get_auth_context_returns_singleton(self):
        """Test that get_auth_context returns the same instance."""
        reset_auth_context()
        ctx1 = get_auth_context()
        ctx2 = get_auth_context()
        assert ctx1 is ctx2
        reset_auth_context()

    def test_reset_auth_context(self):
        """Test that reset_auth_context clears the singleton."""
        ctx1 = get_auth_context()
        reset_auth_context()
        ctx2 = get_auth_context()
        assert ctx1 is not ctx2
        reset_auth_context()


class TestTokenFileHandling:
    """Test async token file storage and retrieval."""

    @pytest.fixture
    def temp_config_dir(self):
        """Create a temporary config directory for testing."""
        temp_dir = tempfile.mkdtemp()
        yield temp_dir
        shutil.rmtree(temp_dir)

    @pytest.mark.asyncio
    async def test_save_token_to_file(self, temp_config_dir):
        """Test saving a token to a file."""
        token_file = Path(temp_config_dir) / "token"
        test_token = "test.jwt.token"

        await _save_token_to_file(test_token, config_dir=temp_config_dir)

        assert await _load_token_from_file(config_dir=temp_config_dir) == test_token

    @pytest.mark.asyncio
    async def test_load_token_from_file(self, temp_config_dir):
        """Test loading a token from a file."""
        token_file = Path(temp_config_dir) / "token"
        test_token = "test.jwt.token"

        # Write directly for this test
        import aiofiles
        async with aiofiles.open(token_file, 'w') as f:
            await f.write(test_token)

        token = await _load_token_from_file(config_dir=temp_config_dir)
        assert token == test_token

    @pytest.mark.asyncio
    async def test_load_token_from_nonexistent_file(self, temp_config_dir):
        """Test loading a token from a non-existent file returns None."""
        token = await _load_token_from_file(config_dir=temp_config_dir)
        assert token is None

    @pytest.mark.asyncio
    async def test_remove_token_file(self, temp_config_dir):
        """Test removing a token file."""
        test_token = "test.jwt.token"

        await _save_token_to_file(test_token, config_dir=temp_config_dir)
        assert await _load_token_from_file(config_dir=temp_config_dir) is not None

        await _remove_token_file(config_dir=temp_config_dir)
        assert await _load_token_from_file(config_dir=temp_config_dir) is None


class TestSyncAuthContextWrapper:
    """Test the synchronous wrapper for backward compatibility."""

    @pytest.fixture
    def temp_config_dir(self):
        """Create a temporary config directory for testing."""
        temp_dir = tempfile.mkdtemp()
        yield temp_dir
        shutil.rmtree(temp_dir)

    def test_sync_create_user(self, temp_config_dir):
        """Test synchronous user creation through wrapper."""
        async_ctx = AsyncAuthContext(config_dir=temp_config_dir)
        wrapper = SyncAuthContextWrapper(async_ctx)

        result = wrapper.create_user("syncuser", "sync@example.com", "SyncPass123!", ["operator"])
        assert result is True
        assert "syncuser" in wrapper.users

    def test_sync_login(self, temp_config_dir):
        """Test synchronous login through wrapper."""
        async_ctx = AsyncAuthContext(config_dir=temp_config_dir)
        wrapper = SyncAuthContextWrapper(async_ctx)

        wrapper.create_user("syncuser", "sync@example.com", "SyncPass123!", ["operator"])
        token = wrapper.login("syncuser", "SyncPass123!")
        assert token is not None

    def test_sync_authenticate(self, temp_config_dir):
        """Test synchronous authentication through wrapper."""
        async_ctx = AsyncAuthContext(config_dir=temp_config_dir)
        wrapper = SyncAuthContextWrapper(async_ctx)

        wrapper.create_user("syncuser", "sync@example.com", "SyncPass123!", ["operator"])
        user = wrapper.authenticate("syncuser", "SyncPass123!")
        assert user is not None
        assert user["username"] == "syncuser"
