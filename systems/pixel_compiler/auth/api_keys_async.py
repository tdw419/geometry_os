"""
Async API Key Management Module for PixelRTS.

Provides secure async API key generation, validation, and management
with support for rate limiting and permission checking.

Migration from sync to async for improved responsiveness under load.
"""

import asyncio
import hashlib
import secrets
from dataclasses import dataclass, field
from datetime import datetime, timedelta
from enum import Enum
from typing import Optional

# Constants
KEY_PREFIX = "prts_"
HASH_PREFIX = "sha256:"
KEY_LENGTH = 32  # bytes
DEFAULT_RATE_LIMIT = 100  # Default requests per minute


class ResourceType(Enum):
    """Resource types that can be accessed via API keys."""
    RTS = "rts"              # PixelRTS containers
    BRICK = "brick"          # Brick format files
    WASM = "wasm"            # WASM modules
    SYSTEM = "system"        # System operations
    USER = "user"            # User management
    AUDIT = "audit"          # Audit logs


class Action(Enum):
    """Actions that can be performed on resources."""
    READ = "read"
    WRITE = "write"
    DELETE = "delete"
    EXECUTE = "execute"
    ADMIN = "admin"


@dataclass
class APIKey:
    """
    Represents an API key.

    Attributes:
        key_id: Unique identifier for the key
        key_hash: SHA256 hash of the key (with prefix)
        name: Human-readable name for the key
        user_id: ID of the user who owns the key
        permissions: Explicit permissions granted to this key
        rate_limit: Maximum requests per time window
        expires_at: Optional expiration datetime
        last_used: Last time the key was used
        created_at: When the key was created
        is_active: Whether the key is active (not revoked)
    """
    key_id: str
    key_hash: str
    name: str
    user_id: str
    permissions: dict[ResourceType, set[Action]] | None = None
    rate_limit: int | None = None
    expires_at: datetime | None = None
    last_used: datetime | None = None
    created_at: datetime = field(default_factory=datetime.utcnow)
    is_active: bool = True

    @property
    def expired(self) -> bool:
        """Check if the key has expired."""
        if self.expires_at is None:
            return False
        return datetime.utcnow() > self.expires_at


class AsyncAPIKeyManager:
    """
    Async API key manager with thread-safe operations.

    Manages API key creation, validation, and revocation.
    Keys are stored hashed using SHA256. The actual key is only
    returned to the user during creation.
    """

    # Class-level constants for test access
    HASH_PREFIX = HASH_PREFIX
    KEY_PREFIX = KEY_PREFIX

    def __init__(self):
        """Initialize the async API key manager."""
        self._keys: dict[str, APIKey] = {}
        self._user_permissions: dict[str, dict[ResourceType, set[Action]]] = {}
        self._lock = asyncio.Lock()

    def generate_key(self) -> str:
        """
        Generate a secure random API key.

        Returns:
            A new API key string (prefix + random bytes)
        """
        random_bytes = secrets.token_urlsafe(KEY_LENGTH)
        return f"{KEY_PREFIX}{random_bytes}"

    def _hash_key(self, key: str) -> str:
        """
        Hash an API key using SHA256.

        Args:
            key: The plaintext API key

        Returns:
            The hashed key with prefix
        """
        hash_bytes = hashlib.sha256(key.encode()).digest()
        hash_hex = hash_bytes.hex()
        return f"{HASH_PREFIX}{hash_hex}"

    async def create_key(
        self,
        name: str,
        user_id: str,
        permissions: dict[ResourceType, set[Action]] | None = None,
        rate_limit: int | None = None,
        expires_days: int | None = None
    ) -> tuple[str, str]:
        """
        Create a new API key (async).

        Args:
            name: Human-readable name for the key
            user_id: ID of the user creating the key
            permissions: Explicit permissions (falls back to user's if None)
            rate_limit: Max requests per time window
            expires_days: Days until expiration (None = never expires)

        Returns:
            Tuple of (key_id, actual_key) - store key_id, return actual_key
        """
        async with self._lock:
            # Generate the actual key
            actual_key = self.generate_key()
            key_hash = self._hash_key(actual_key)

            # Generate a unique key ID
            key_id = secrets.token_hex(16)

            # Calculate expiration
            expires_at = None
            if expires_days is not None:
                expires_at = datetime.utcnow() + timedelta(days=expires_days)

            # Create the API key object
            api_key = APIKey(
                key_id=key_id,
                key_hash=key_hash,
                name=name,
                user_id=user_id,
                permissions=permissions,
                rate_limit=rate_limit,
                expires_at=expires_at
            )

            # Store the key (hashed only)
            self._keys[key_id] = api_key

            return key_id, actual_key

    async def validate_key(self, key: str) -> APIKey | None:
        """
        Validate an API key and return the associated APIKey object (async).

        Args:
            key: The API key to validate

        Returns:
            APIKey object if valid, None otherwise
        """
        # Hash the provided key
        key_hash = self._hash_key(key)

        async with self._lock:
            # Find matching key
            for api_key in self._keys.values():
                if api_key.key_hash == key_hash:
                    # Check if key is active and not expired
                    if not api_key.is_active:
                        return None
                    if api_key.expired:
                        return None

                    # Update last used time
                    api_key.last_used = datetime.utcnow()
                    return api_key

        return None

    async def revoke_key(self, key_id: str) -> bool:
        """
        Revoke an API key (soft delete) (async).

        Args:
            key_id: The ID of the key to revoke

        Returns:
            True if key was found and revoked
        """
        async with self._lock:
            if key_id in self._keys:
                self._keys[key_id].is_active = False
                return True
        return False

    async def delete_key(self, key_id: str) -> bool:
        """
        Permanently delete an API key (async).

        Args:
            key_id: The ID of the key to delete

        Returns:
            True if key was found and deleted
        """
        async with self._lock:
            if key_id in self._keys:
                del self._keys[key_id]
                return True
        return False

    async def get_user_keys(self, user_id: str) -> list[APIKey]:
        """
        Get all API keys for a user (async).

        Args:
            user_id: The user ID to query

        Returns:
            List of APIKey objects belonging to the user
        """
        async with self._lock:
            return [
                key for key in self._keys.values()
                if key.user_id == user_id
            ]

    async def check_permission(
        self,
        key: str,
        resource: ResourceType,
        action: Action
    ) -> bool:
        """
        Check if an API key has permission for an action on a resource (async).

        Args:
            key: The API key to check
            resource: The resource type
            action: The action to perform

        Returns:
            True if permitted, False otherwise
        """
        api_key = await self.validate_key(key)
        if api_key is None:
            return False

        # Check explicit key permissions
        if api_key.permissions is not None:
            if resource in api_key.permissions:
                return action in api_key.permissions[resource]
            return False

        # Fall back to user permissions
        async with self._lock:
            user_perms = self._user_permissions.get(api_key.user_id, {})
            if resource in user_perms:
                return action in user_perms[resource]

        return False

    async def set_user_permissions(
        self,
        user_id: str,
        permissions: dict[ResourceType, set[Action]]
    ) -> None:
        """
        Set default permissions for a user (async).

        Args:
            user_id: The user ID
            permissions: Default permissions for the user
        """
        async with self._lock:
            self._user_permissions[user_id] = permissions

    async def get_key_by_id(self, key_id: str) -> Optional[APIKey]:
        """
        Get an API key by its ID (async).

        Args:
            key_id: The key ID to look up

        Returns:
            APIKey if found, None otherwise
        """
        async with self._lock:
            return self._keys.get(key_id)

    async def cleanup_expired_keys(self) -> int:
        """
        Remove expired keys from storage (async).

        Returns:
            Number of keys removed
        """
        async with self._lock:
            expired_ids = [
                key_id for key_id, key in self._keys.items()
                if key.expired or not key.is_active
            ]
            for key_id in expired_ids:
                del self._keys[key_id]
            return len(expired_ids)


# Type alias for backward compatibility
Permission = dict[ResourceType, set[Action]]


# Sync wrapper for backward compatibility
class SyncAPIKeyManagerWrapper:
    """
    Synchronous wrapper for AsyncAPIKeyManager for backward compatibility.
    """

    def __init__(self, async_manager: AsyncAPIKeyManager = None):
        self._async_manager = async_manager or AsyncAPIKeyManager()

    def _run_async(self, coro):
        """Run async function in sync context."""
        import asyncio
        try:
            loop = asyncio.get_running_loop()
        except RuntimeError:
            loop = None

        if loop and loop.is_running():
            import concurrent.futures
            with concurrent.futures.ThreadPoolExecutor() as pool:
                future = pool.submit(asyncio.run, coro)
                return future.result()
        else:
            return asyncio.run(coro)

    def create_key(self, *args, **kwargs) -> tuple[str, str]:
        return self._run_async(self._async_manager.create_key(*args, **kwargs))

    def validate_key(self, key: str) -> APIKey | None:
        return self._run_async(self._async_manager.validate_key(key))

    def revoke_key(self, key_id: str) -> bool:
        return self._run_async(self._async_manager.revoke_key(key_id))

    def delete_key(self, key_id: str) -> bool:
        return self._run_async(self._async_manager.delete_key(key_id))

    def get_user_keys(self, user_id: str) -> list[APIKey]:
        return self._run_async(self._async_manager.get_user_keys(user_id))

    def check_permission(self, key: str, resource: ResourceType, action: Action) -> bool:
        return self._run_async(self._async_manager.check_permission(key, resource, action))


__all__ = [
    'AsyncAPIKeyManager',
    'APIKey',
    'ResourceType',
    'Action',
    'Permission',
    'KEY_PREFIX',
    'HASH_PREFIX',
    'SyncAPIKeyManagerWrapper',
]
