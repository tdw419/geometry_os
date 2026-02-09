"""
Tests for CLI Authentication Module (cli_auth.py)

Tests the AuthContext class, user management, JWT token handling,
and the @require_auth decorator.
"""

import pytest
import tempfile
import shutil
import json
from pathlib import Path
from datetime import datetime, timedelta, timezone
from unittest.mock import patch, MagicMock

from auth.cli_auth import AuthContext, get_auth_context, require_auth


class TestAuthContext:
    """Test AuthContext class initialization and basic operations."""

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
        """Create an AuthContext instance for testing."""
        return AuthContext(config_dir=temp_config_dir, encryption_key=encryption_key)

    def test_init_creates_config_directory(self, temp_config_dir, encryption_key):
        """Test that AuthContext creates the config directory if it doesn't exist."""
        non_existent_dir = Path(temp_config_dir) / "new_config"
        ctx = AuthContext(config_dir=str(non_existent_dir), encryption_key=encryption_key)
        assert non_existent_dir.exists()
        assert non_existent_dir.is_dir()

    def test_init_loads_existing_users(self, temp_config_dir, encryption_key):
        """Test that AuthContext loads existing users from storage."""
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

        ctx = AuthContext(config_dir=temp_config_dir, encryption_key=encryption_key)
        assert "testuser" in ctx.users
        assert ctx.users["testuser"]["email"] == "test@example.com"

    def test_create_user_success(self, auth_context):
        """Test successful user creation."""
        result = auth_context.create_user(
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

    def test_create_duplicate_user_fails(self, auth_context):
        """Test that creating a duplicate user fails."""
        auth_context.create_user("user1", "user1@example.com", "pass123", ["operator"])

        result = auth_context.create_user(
            username="user1",
            email="different@example.com",
            password="pass456",
            roles=["admin"]
        )

        assert result is False

    def test_create_user_with_multiple_roles(self, auth_context):
        """Test creating a user with multiple roles."""
        auth_context.create_user(
            username="adminuser",
            email="admin@example.com",
            password="AdminPass123!",
            roles=["admin", "operator", "auditor"]
        )

        assert set(auth_context.users["adminuser"]["roles"]) == {"admin", "operator", "auditor"}

    def test_authenticate_success(self, auth_context):
        """Test successful authentication."""
        auth_context.create_user("authuser", "auth@example.com", "AuthPass123!", ["operator"])

        user = auth_context.authenticate("authuser", "AuthPass123!")
        assert user is not None
        assert user["username"] == "authuser"
        assert user["email"] == "auth@example.com"

    def test_authenticate_wrong_password(self, auth_context):
        """Test authentication with wrong password fails."""
        auth_context.create_user("authuser", "auth@example.com", "AuthPass123!", ["operator"])

        user = auth_context.authenticate("authuser", "WrongPassword!")
        assert user is None

    def test_authenticate_nonexistent_user(self, auth_context):
        """Test authentication with non-existent user fails."""
        user = auth_context.authenticate("nonexistent", "anypassword")
        assert user is None

    def test_login_returns_token(self, auth_context):
        """Test that login returns a JWT token."""
        auth_context.create_user("loginuser", "login@example.com", "LoginPass123!", ["operator"])

        token = auth_context.login("loginuser", "LoginPass123!")
        assert token is not None
        assert isinstance(token, str)
        assert len(token) > 0  # JWT tokens should be substantial strings

    def test_login_fails_with_invalid_credentials(self, auth_context):
        """Test that login fails with invalid credentials."""
        auth_context.create_user("loginuser", "login@example.com", "LoginPass123!", ["operator"])

        token = auth_context.login("loginuser", "WrongPassword")
        assert token is None

    def test_get_current_user_from_valid_token(self, auth_context):
        """Test getting current user from a valid JWT token."""
        auth_context.create_user("tokenuser", "token@example.com", "TokenPass123!", ["operator"])
        token = auth_context.login("tokenuser", "TokenPass123!")

        user = auth_context.get_current_user(token)
        assert user is not None
        assert user["username"] == "tokenuser"
        assert user["email"] == "token@example.com"

    def test_get_current_user_from_invalid_token(self, auth_context):
        """Test getting current user from an invalid token returns None."""
        user = auth_context.get_current_user("invalid.token.here")
        assert user is None

    def test_get_current_user_from_expired_token(self, auth_context):
        """Test getting current user from an expired token returns None."""
        auth_context.create_user("expireuser", "expire@example.com", "ExpirePass123!", ["operator"])

        # Create a token that's already expired
        import jwt
        expired_token = jwt.encode(
            {
                "sub": "expireuser",
                "exp": datetime.now(timezone.utc) - timedelta(hours=1)
            },
            auth_context.secret_key,
            algorithm="HS256"
        )

        user = auth_context.get_current_user(expired_token)
        assert user is None


class TestRequireAuthDecorator:
    """Test the @require_auth decorator."""

    @pytest.fixture
    def temp_config_dir(self):
        """Create a temporary config directory for testing."""
        temp_dir = tempfile.mkdtemp()
        yield temp_dir
        shutil.rmtree(temp_dir)

    @pytest.fixture
    def auth_context(self, temp_config_dir):
        """Create an AuthContext instance for testing."""
        encryption_key = b'test_key_32_bytes_long_for_test!'
        return AuthContext(config_dir=temp_config_dir, encryption_key=encryption_key)

    def test_require_auth_with_valid_token(self, auth_context):
        """Test that @require_auth allows access with valid token."""
        auth_context.create_user("decoratoruser", "decorator@example.com", "DecoratorPass123!", ["operator"])
        token = auth_context.login("decoratoruser", "DecoratorPass123!")

        @require_auth
        def protected_function(user):
            return f"Hello, {user['username']}"

        with patch('auth.cli_auth.get_auth_context', return_value=auth_context):
            with patch('auth.cli_auth._load_token_from_file', return_value=token):
                result = protected_function()
                assert result == "Hello, decoratoruser"

    def test_require_auth_with_invalid_token(self, auth_context):
        """Test that @require_auth denies access with invalid token."""
        @require_auth
        def protected_function(user):
            return "Should not reach here"

        with patch('auth.cli_auth.get_auth_context', return_value=auth_context):
            with patch('auth.cli_auth._load_token_from_file', return_value="invalid"):
                with pytest.raises(PermissionError):
                    protected_function()

    def test_require_auth_with_no_token(self, auth_context):
        """Test that @require_auth denies access with no token."""
        @require_auth
        def protected_function(user):
            return "Should not reach here"

        with patch('auth.cli_auth.get_auth_context', return_value=auth_context):
            with patch('auth.cli_auth._load_token_from_file', return_value=None):
                with pytest.raises(PermissionError):
                    protected_function()


class TestGlobalAuthContext:
    """Test the global auth context singleton."""

    def test_get_auth_context_returns_singleton(self):
        """Test that get_auth_context returns the same instance."""
        with patch('auth.cli_auth._GLOBAL_AUTH_CONTEXT', None):
            ctx1 = get_auth_context()
            ctx2 = get_auth_context()
            assert ctx1 is ctx2

    def test_get_auth_context_uses_default_config(self):
        """Test that get_auth_context uses default config directory."""
        with patch('auth.cli_auth._GLOBAL_AUTH_CONTEXT', None):
            ctx = get_auth_context()
            # Should use ~/.pixelrts/ as default
            assert str(ctx.config_dir).endswith('.pixelrts')


class TestTokenFileHandling:
    """Test token file storage and retrieval."""

    @pytest.fixture
    def temp_config_dir(self):
        """Create a temporary config directory for testing."""
        temp_dir = tempfile.mkdtemp()
        yield temp_dir
        shutil.rmtree(temp_dir)

    def test_save_token_to_file(self, temp_config_dir):
        """Test saving a token to a file."""
        token_file = Path(temp_config_dir) / "token"
        test_token = "test.jwt.token"

        from auth.cli_auth import _save_token_to_file
        _save_token_to_file(test_token, config_dir=temp_config_dir)

        assert token_file.exists()
        # Check file permissions (0o600 = read/write for owner only)
        import stat
        file_stat = token_file.stat()
        assert stat.S_IMODE(file_stat.st_mode) == 0o600

        with open(token_file, 'r') as f:
            content = f.read()
        assert content == test_token

    def test_load_token_from_file(self, temp_config_dir):
        """Test loading a token from a file."""
        token_file = Path(temp_config_dir) / "token"
        test_token = "test.jwt.token"

        with open(token_file, 'w') as f:
            f.write(test_token)
        token_file.chmod(0o600)

        from auth.cli_auth import _load_token_from_file
        token = _load_token_from_file(config_dir=temp_config_dir)

        assert token == test_token

    def test_load_token_from_nonexistent_file(self, temp_config_dir):
        """Test loading a token from a non-existent file returns None."""
        from auth.cli_auth import _load_token_from_file
        token = _load_token_from_file(config_dir=temp_config_dir)
        assert token is None

    def test_remove_token_file(self, temp_config_dir):
        """Test removing a token file."""
        token_file = Path(temp_config_dir) / "token"
        test_token = "test.jwt.token"

        with open(token_file, 'w') as f:
            f.write(test_token)

        from auth.cli_auth import _remove_token_file
        _remove_token_file(config_dir=temp_config_dir)

        assert not token_file.exists()
