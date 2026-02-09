"""
Tests for API key management and rate limiting system.

Tests API key generation, validation, revocation, permission checking,
and rate limiting with sliding window algorithm.
"""

import time
import pytest
from datetime import datetime, timedelta
from unittest.mock import Mock, patch

from systems.pixel_compiler.auth.api_keys import (
    APIKey,
    APIKeyManager,
    KEY_PREFIX,
    Permission,
    ResourceType,
    Action
)
from systems.pixel_compiler.auth.rate_limiter import (
    RateLimiter,
    RateLimitStatus,
    RateLimitExceeded
)


class TestAPIKey:
    """Tests for APIKey dataclass."""

    def test_api_key_creation(self):
        """Test creating an APIKey object."""
        key = APIKey(
            key_id="test-id",
            key_hash="hash",
            name="Test Key",
            user_id="user-123",
            permissions={ResourceType.RTS: {Action.READ}},
            rate_limit=100,
            expires_at=None,
            created_at=datetime.utcnow()
        )
        assert key.key_id == "test-id"
        assert key.name == "Test Key"
        assert key.user_id == "user-123"
        assert key.is_active is True

    def test_api_key_expired(self):
        """Test APIKey.expired property."""
        past = datetime.utcnow() - timedelta(days=1)
        key = APIKey(
            key_id="test-id",
            key_hash="hash",
            name="Expired Key",
            user_id="user-123",
            permissions={},
            expires_at=past
        )
        assert key.expired is True

    def test_api_key_not_expired(self):
        """Test APIKey.expired property with future expiration."""
        future = datetime.utcnow() + timedelta(days=1)
        key = APIKey(
            key_id="test-id",
            key_hash="hash",
            name="Valid Key",
            user_id="user-123",
            permissions={},
            expires_at=future
        )
        assert key.expired is False

    def test_api_key_never_expires(self):
        """Test APIKey.expired property with no expiration."""
        key = APIKey(
            key_id="test-id",
            key_hash="hash",
            name="Permanent Key",
            user_id="user-123",
            permissions={},
            expires_at=None
        )
        assert key.expired is False


class TestAPIKeyManager:
    """Tests for APIKeyManager class."""

    def test_key_generation_format(self):
        """Test that generated keys have correct format."""
        manager = APIKeyManager()
        key = manager.generate_key()
        assert key.startswith(KEY_PREFIX)
        assert len(key) == len(KEY_PREFIX) + 43  # 32 bytes -> ~43 chars in base64url

    def test_key_generation_uniqueness(self):
        """Test that generated keys are unique."""
        manager = APIKeyManager()
        keys = [manager.generate_key() for _ in range(100)]
        assert len(set(keys)) == 100  # All unique

    def test_create_key_returns_id_and_key(self):
        """Test creating a key returns both ID and actual key."""
        manager = APIKeyManager()
        key_id, key = manager.create_key(
            name="Test Key",
            user_id="user-123",
            permissions={ResourceType.RTS: {Action.READ}},
            rate_limit=100
        )
        assert isinstance(key_id, str)
        assert isinstance(key, str)
        assert key.startswith(KEY_PREFIX)
        assert len(key_id) > 0

    def test_create_key_stores_hash_only(self):
        """Test that stored key is hashed, not plaintext."""
        manager = APIKeyManager()
        key_id, key = manager.create_key(
            name="Test Key",
            user_id="user-123"
        )
        stored_key = manager._keys[key_id]
        assert stored_key.key_hash != key
        assert stored_key.key_hash.startswith(manager.HASH_PREFIX)

    def test_validate_valid_key(self):
        """Test validating a valid key returns APIKey object."""
        manager = APIKeyManager()
        key_id, key = manager.create_key(
            name="Test Key",
            user_id="user-123"
        )
        api_key = manager.validate_key(key)
        assert api_key is not None
        assert api_key.key_id == key_id
        assert api_key.name == "Test Key"
        assert api_key.last_used is not None

    def test_validate_invalid_key(self):
        """Test validating an invalid key returns None."""
        manager = APIKeyManager()
        api_key = manager.validate_key("invalid_key")
        assert api_key is None

    def test_validate_revoked_key(self):
        """Test validating a revoked key returns None."""
        manager = APIKeyManager()
        key_id, key = manager.create_key(
            name="Test Key",
            user_id="user-123"
        )
        manager.revoke_key(key_id)
        api_key = manager.validate_key(key)
        assert api_key is None

    def test_validate_expired_key(self):
        """Test validating an expired key returns None."""
        manager = APIKeyManager()
        key_id, key = manager.create_key(
            name="Test Key",
            user_id="user-123",
            expires_days=-1  # Already expired
        )
        api_key = manager.validate_key(key)
        assert api_key is None

    def test_revoke_key_soft_delete(self):
        """Test that revoking a key soft deletes it."""
        manager = APIKeyManager()
        key_id, key = manager.create_key(
            name="Test Key",
            user_id="user-123"
        )
        manager.revoke_key(key_id)
        assert key_id in manager._keys
        assert manager._keys[key_id].is_active is False

    def test_delete_key_permanent(self):
        """Test that deleting a key removes it permanently."""
        manager = APIKeyManager()
        key_id, key = manager.create_key(
            name="Test Key",
            user_id="user-123"
        )
        manager.delete_key(key_id)
        assert key_id not in manager._keys

    def test_get_user_keys(self):
        """Test getting all keys for a user."""
        manager = APIKeyManager()
        user_id = "user-123"
        manager.create_key("Key 1", user_id)
        manager.create_key("Key 2", user_id)
        manager.create_key("Other Key", "other-user")

        keys = manager.get_user_keys(user_id)
        assert len(keys) == 2
        assert all(k.user_id == user_id for k in keys)

    def test_check_permission_granted(self):
        """Test checking a granted permission returns True."""
        manager = APIKeyManager()
        key_id, key = manager.create_key(
            name="Test Key",
            user_id="user-123",
            permissions={ResourceType.RTS: {Action.READ, Action.WRITE}}
        )
        assert manager.check_permission(key, ResourceType.RTS, Action.READ) is True
        assert manager.check_permission(key, ResourceType.RTS, Action.WRITE) is True

    def test_check_permission_denied(self):
        """Test checking a denied permission returns False."""
        manager = APIKeyManager()
        key_id, key = manager.create_key(
            name="Test Key",
            user_id="user-123",
            permissions={ResourceType.RTS: {Action.READ}}
        )
        assert manager.check_permission(key, ResourceType.RTS, Action.DELETE) is False

    def test_check_permission_no_explicit_permissions(self):
        """Test that keys without explicit permissions check user permissions."""
        manager = APIKeyManager()
        manager._user_permissions = {"user-123": {ResourceType.RTS: {Action.READ}}}
        key_id, key = manager.create_key(
            name="Test Key",
            user_id="user-123",
            permissions=None  # Fall back to user permissions
        )
        assert manager.check_permission(key, ResourceType.RTS, Action.READ) is True

    def test_create_key_with_expiration(self):
        """Test creating a key with expiration date."""
        manager = APIKeyManager()
        key_id, key = manager.create_key(
            name="Test Key",
            user_id="user-123",
            expires_days=30
        )
        stored_key = manager._keys[key_id]
        assert stored_key.expires_at is not None
        expires_in = (stored_key.expires_at - datetime.utcnow()).days
        assert 29 <= expires_in <= 30  # Allow 1 day variance


class TestRateLimiter:
    """Tests for RateLimiter class."""

    def test_check_rate_limit_within_limit(self):
        """Test rate limit check when within limit."""
        limiter = RateLimiter()
        allowed, info = limiter.check_rate_limit("client-1", max_requests=10)
        assert allowed is True
        assert info["remaining"] == 9
        assert info["limit"] == 10

    def test_check_rate_limit_exceeded(self):
        """Test rate limit check when limit exceeded."""
        limiter = RateLimiter()
        client_id = "client-2"

        # Make 10 requests
        for _ in range(10):
            limiter.check_rate_limit(client_id, max_requests=10)

        # 11th request should be denied
        allowed, info = limiter.check_rate_limit(client_id, max_requests=10)
        assert allowed is False
        assert info["remaining"] == 0

    def test_sliding_window_cleanup(self):
        """Test that old requests are cleaned up in sliding window."""
        limiter = RateLimiter(window_size=1)  # 1 second window
        client_id = "client-3"

        # Make 5 requests
        for _ in range(5):
            limiter.check_rate_limit(client_id, max_requests=10)

        # Wait for window to pass
        time.sleep(1.1)

        # Should be able to make 10 more requests
        for _ in range(10):
            allowed, _ = limiter.check_rate_limit(client_id, max_requests=10)
            assert allowed is True

    def test_get_status(self):
        """Test getting rate limit status."""
        limiter = RateLimiter()
        client_id = "client-4"

        # Make 3 requests
        for _ in range(3):
            limiter.check_rate_limit(client_id, max_requests=10)

        status = limiter.get_status(client_id, max_requests=10)
        assert status["limit"] == 10
        assert status["remaining"] == 7
        assert "reset" in status
        assert isinstance(status["reset"], (int, float))

    def test_multiple_clients_independent(self):
        """Test that rate limits are independent per client."""
        limiter = RateLimiter()

        # Client 1 makes 10 requests
        for _ in range(10):
            limiter.check_rate_limit("client-5", max_requests=10)

        # Client 2 should still be able to make requests
        allowed, _ = limiter.check_rate_limit("client-6", max_requests=10)
        assert allowed is True

    def test_custom_window_size(self):
        """Test rate limiter with custom window size."""
        limiter = RateLimiter(window_size=2)
        client_id = "client-7"

        # Make 10 requests
        for _ in range(10):
            limiter.check_rate_limit(client_id, max_requests=10)

        # Wait 1 second - still within window
        time.sleep(1)
        allowed, _ = limiter.check_rate_limit(client_id, max_requests=10)
        assert allowed is False

        # Wait another 1.1 seconds - window should have passed
        time.sleep(1.1)
        allowed, _ = limiter.check_rate_limit(client_id, max_requests=10)
        assert allowed is True

    def test_rate_limit_status_dataclass(self):
        """Test RateLimitStatus dataclass."""
        status = RateLimitStatus(
            limit=100,
            remaining=50,
            reset=1234567890.0
        )
        assert status.limit == 100
        assert status.remaining == 50
        assert status.reset == 1234567890.0

    def test_rate_limit_exceeded_exception(self):
        """Test RateLimitExceeded exception."""
        error = RateLimitExceeded(
            limit=100,
            remaining=0,
            reset=1234567890.0
        )
        assert str(error)  # Should have a string representation
        assert error.limit == 100
