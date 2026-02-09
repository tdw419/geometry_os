"""
API Key Management Module for PixelRTS.

Provides secure API key generation, validation, and management
with support for rate limiting and permission checking.
"""

import secrets
import hashlib
from dataclasses import dataclass, field
from datetime import datetime, timedelta
from typing import Dict, List, Set, Optional, Tuple
from enum import Enum


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
    permissions: Optional[Dict[ResourceType, Set[Action]]] = None
    rate_limit: Optional[int] = None
    expires_at: Optional[datetime] = None
    last_used: Optional[datetime] = None
    created_at: datetime = field(default_factory=datetime.utcnow)
    is_active: bool = True

    @property
    def expired(self) -> bool:
        """Check if the key has expired."""
        if self.expires_at is None:
            return False
        return datetime.utcnow() > self.expires_at


class APIKeyManager:
    """
    Manages API key creation, validation, and revocation.

    Keys are stored hashed using SHA256. The actual key is only
    returned to the user during creation.
    """

    # Class-level constants for test access
    HASH_PREFIX = HASH_PREFIX
    KEY_PREFIX = KEY_PREFIX

    def __init__(self):
        """Initialize the API key manager."""
        self._keys: Dict[str, APIKey] = {}
        self._user_permissions: Dict[str, Dict[ResourceType, Set[Action]]] = {}

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

    def create_key(
        self,
        name: str,
        user_id: str,
        permissions: Optional[Dict[ResourceType, Set[Action]]] = None,
        rate_limit: Optional[int] = None,
        expires_days: Optional[int] = None
    ) -> Tuple[str, str]:
        """
        Create a new API key.

        Args:
            name: Human-readable name for the key
            user_id: ID of the user creating the key
            permissions: Explicit permissions (falls back to user's if None)
            rate_limit: Max requests per time window
            expires_days: Days until expiration (None = never expires)

        Returns:
            Tuple of (key_id, actual_key) - store key_id, return actual_key
        """
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

    def validate_key(self, key: str) -> Optional[APIKey]:
        """
        Validate an API key and return the associated APIKey object.

        Args:
            key: The API key to validate

        Returns:
            APIKey object if valid, None otherwise
        """
        # Hash the provided key
        key_hash = self._hash_key(key)

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

    def revoke_key(self, key_id: str) -> bool:
        """
        Revoke an API key (soft delete).

        Args:
            key_id: The ID of the key to revoke

        Returns:
            True if key was found and revoked
        """
        if key_id in self._keys:
            self._keys[key_id].is_active = False
            return True
        return False

    def delete_key(self, key_id: str) -> bool:
        """
        Permanently delete an API key.

        Args:
            key_id: The ID of the key to delete

        Returns:
            True if key was found and deleted
        """
        if key_id in self._keys:
            del self._keys[key_id]
            return True
        return False

    def get_user_keys(self, user_id: str) -> List[APIKey]:
        """
        Get all API keys for a user.

        Args:
            user_id: The user ID to query

        Returns:
            List of APIKey objects belonging to the user
        """
        return [
            key for key in self._keys.values()
            if key.user_id == user_id
        ]

    def check_permission(
        self,
        key: str,
        resource: ResourceType,
        action: Action
    ) -> bool:
        """
        Check if an API key has permission for an action on a resource.

        Args:
            key: The API key to check
            resource: The resource type
            action: The action to perform

        Returns:
            True if permitted, False otherwise
        """
        api_key = self.validate_key(key)
        if api_key is None:
            return False

        # Check explicit key permissions
        if api_key.permissions is not None:
            if resource in api_key.permissions:
                return action in api_key.permissions[resource]
            return False

        # Fall back to user permissions
        user_perms = self._user_permissions.get(api_key.user_id, {})
        if resource in user_perms:
            return action in user_perms[resource]

        return False

    def set_user_permissions(
        self,
        user_id: str,
        permissions: Dict[ResourceType, Set[Action]]
    ) -> None:
        """
        Set default permissions for a user.

        Args:
            user_id: The user ID
            permissions: Default permissions for the user
        """
        self._user_permissions[user_id] = permissions


# Type alias for backward compatibility
Permission = Dict[ResourceType, Set[Action]]
