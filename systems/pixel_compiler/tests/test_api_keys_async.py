"""
Tests for Async API Key Management Module (api_keys_async.py)
"""

import asyncio
from datetime import datetime, timedelta

import pytest

from systems.pixel_compiler.auth.api_keys_async import (
    AsyncAPIKeyManager,
    APIKey,
    ResourceType,
    Action,
    SyncAPIKeyManagerWrapper,
)


class TestAsyncAPIKeyManager:
    """Test AsyncAPIKeyManager class."""

    @pytest.fixture
    def manager(self):
        """Create an AsyncAPIKeyManager instance."""
        return AsyncAPIKeyManager()

    @pytest.mark.asyncio
    async def test_generate_key(self, manager):
        """Test key generation."""
        key = manager.generate_key()
        assert key.startswith("prts_")
        assert len(key) > 10

    @pytest.mark.asyncio
    async def test_create_key(self, manager):
        """Test API key creation."""
        key_id, actual_key = await manager.create_key(
            name="Test Key",
            user_id="user123",
            rate_limit=100
        )

        assert key_id is not None
        assert actual_key.startswith("prts_")

    @pytest.mark.asyncio
    async def test_validate_key(self, manager):
        """Test API key validation."""
        key_id, actual_key = await manager.create_key(
            name="Test Key",
            user_id="user123"
        )

        # Validate the key
        api_key = await manager.validate_key(actual_key)
        assert api_key is not None
        assert api_key.key_id == key_id
        assert api_key.name == "Test Key"

    @pytest.mark.asyncio
    async def test_validate_invalid_key(self, manager):
        """Test validation of invalid key."""
        api_key = await manager.validate_key("prts_invalidkey123")
        assert api_key is None

    @pytest.mark.asyncio
    async def test_revoke_key(self, manager):
        """Test key revocation."""
        key_id, actual_key = await manager.create_key(
            name="Test Key",
            user_id="user123"
        )

        # Revoke the key
        result = await manager.revoke_key(key_id)
        assert result is True

        # Key should no longer validate
        api_key = await manager.validate_key(actual_key)
        assert api_key is None

    @pytest.mark.asyncio
    async def test_delete_key(self, manager):
        """Test permanent key deletion."""
        key_id, actual_key = await manager.create_key(
            name="Test Key",
            user_id="user123"
        )

        # Delete the key
        result = await manager.delete_key(key_id)
        assert result is True

        # Key should no longer exist
        api_key = await manager.get_key_by_id(key_id)
        assert api_key is None

    @pytest.mark.asyncio
    async def test_get_user_keys(self, manager):
        """Test retrieving all keys for a user."""
        # Create multiple keys for same user
        await manager.create_key("Key 1", "user123")
        await manager.create_key("Key 2", "user123")
        await manager.create_key("Key 3", "user456")

        keys = await manager.get_user_keys("user123")
        assert len(keys) == 2

    @pytest.mark.asyncio
    async def test_key_expiration(self, manager):
        """Test that expired keys don't validate."""
        # Create key that expires in 0 days (already expired)
        key_id, actual_key = await manager.create_key(
            name="Expiring Key",
            user_id="user123",
            expires_days=-1  # Already expired
        )

        # Key should not validate due to expiration
        api_key = await manager.validate_key(actual_key)
        assert api_key is None

    @pytest.mark.asyncio
    async def test_check_permission_with_key_permissions(self, manager):
        """Test permission checking with explicit key permissions."""
        permissions = {
            ResourceType.RTS: {Action.READ, Action.WRITE},
            ResourceType.SYSTEM: {Action.READ}
        }

        key_id, actual_key = await manager.create_key(
            name="Permitted Key",
            user_id="user123",
            permissions=permissions
        )

        # Should have permission
        assert await manager.check_permission(actual_key, ResourceType.RTS, Action.READ) is True
        assert await manager.check_permission(actual_key, ResourceType.RTS, Action.WRITE) is True

        # Should not have permission
        assert await manager.check_permission(actual_key, ResourceType.RTS, Action.DELETE) is False
        assert await manager.check_permission(actual_key, ResourceType.BRICK, Action.READ) is False

    @pytest.mark.asyncio
    async def test_check_permission_with_user_permissions(self, manager):
        """Test permission checking with user-level permissions fallback."""
        # Set user permissions
        await manager.set_user_permissions("user123", {
            ResourceType.RTS: {Action.READ}
        })

        # Create key without explicit permissions
        key_id, actual_key = await manager.create_key(
            name="User Key",
            user_id="user123"
        )

        # Should inherit user permissions
        assert await manager.check_permission(actual_key, ResourceType.RTS, Action.READ) is True
        assert await manager.check_permission(actual_key, ResourceType.RTS, Action.WRITE) is False

    @pytest.mark.asyncio
    async def test_cleanup_expired_keys(self, manager):
        """Test cleanup of expired keys."""
        # Create an expired key
        await manager.create_key("Expired", "user123", expires_days=-1)
        await manager.create_key("Valid", "user123", expires_days=30)

        # Cleanup
        removed = await manager.cleanup_expired_keys()
        assert removed == 1

    @pytest.mark.asyncio
    async def test_concurrent_key_operations(self, manager):
        """Test concurrent key operations are thread-safe."""
        # Create keys concurrently
        tasks = [
            manager.create_key(f"Key {i}", f"user{i}")
            for i in range(10)
        ]
        results = await asyncio.gather(*tasks)

        # All should succeed
        assert all(r[0] is not None for r in results)

        # Validate all keys concurrently
        validate_tasks = [
            manager.validate_key(actual_key)
            for key_id, actual_key in results
        ]
        validated = await asyncio.gather(*validate_tasks)
        assert all(v is not None for v in validated)


class TestSyncAPIKeyManagerWrapper:
    """Test synchronous wrapper for backward compatibility."""

    def test_sync_create_key(self):
        """Test synchronous key creation."""
        manager = AsyncAPIKeyManager()
        wrapper = SyncAPIKeyManagerWrapper(manager)

        key_id, actual_key = wrapper.create_key("Test Key", "user123")
        assert key_id is not None
        assert actual_key.startswith("prts_")

    def test_sync_validate_key(self):
        """Test synchronous key validation."""
        manager = AsyncAPIKeyManager()
        wrapper = SyncAPIKeyManagerWrapper(manager)

        key_id, actual_key = wrapper.create_key("Test Key", "user123")
        api_key = wrapper.validate_key(actual_key)
        assert api_key is not None
        assert api_key.key_id == key_id

    def test_sync_revoke_key(self):
        """Test synchronous key revocation."""
        manager = AsyncAPIKeyManager()
        wrapper = SyncAPIKeyManagerWrapper(manager)

        key_id, actual_key = wrapper.create_key("Test Key", "user123")
        result = wrapper.revoke_key(key_id)
        assert result is True

        api_key = wrapper.validate_key(actual_key)
        assert api_key is None
