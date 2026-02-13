#!/usr/bin/env python3
"""
Infinite Map Security Infrastructure.

Provides comprehensive security features including encryption,
access control, and audit logging for enterprise deployment.

Key Components:
- EncryptionManager: AES-256 encryption at rest
- AccessControlList: POSIX-like ACL implementation
- AuditLogger: Comprehensive operation logging
- SecurityManager: Unified security interface
- RateLimiter: Request rate limiting

Usage:
    from infinite_map_security import SecurityManager

    # Initialize security
    security = SecurityManager(encryption_key="secret")

    # Encrypt data
    encrypted = security.encrypt(b"sensitive data")

    # Check access
    if security.check_access("/file", "user1", "read"):
        data = security.decrypt(encrypted)

    # Audit log
    security.audit_log("read", "/file", "user1", success=True)
"""

import os
import json
import hashlib
import secrets
import threading
import time
from pathlib import Path
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any, Set, Tuple, Union
from datetime import datetime, timedelta
from enum import Enum, auto
from collections import defaultdict
import base64
import logging

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


# ============================================================================
# Encryption Support
# ============================================================================

class EncryptionAlgorithm(Enum):
    """Supported encryption algorithms."""
    AES_256_GCM = "aes-256-gcm"
    AES_256_CBC = "aes-256-cbc"
    CHACHA20_POLY1305 = "chacha20-poly1305"


@dataclass
class EncryptedData:
    """Container for encrypted data with metadata."""
    ciphertext: bytes
    nonce: bytes
    tag: Optional[bytes] = None
    algorithm: EncryptionAlgorithm = EncryptionAlgorithm.AES_256_GCM
    version: int = 1

    def to_bytes(self) -> bytes:
        """Serialize to bytes for storage."""
        # Format: version(1) + algo(1) + nonce_len(2) + nonce + tag_len(2) + tag + ciphertext
        result = bytearray()
        result.append(self.version)
        result.append(list(EncryptionAlgorithm).index(self.algorithm))
        result.extend(len(self.nonce).to_bytes(2, 'big'))
        result.extend(self.nonce)
        if self.tag:
            result.extend(len(self.tag).to_bytes(2, 'big'))
            result.extend(self.tag)
        else:
            result.extend((0).to_bytes(2, 'big'))
        result.extend(self.ciphertext)
        return bytes(result)

    @classmethod
    def from_bytes(cls, data: bytes) -> 'EncryptedData':
        """Deserialize from bytes."""
        if len(data) < 6:
            raise ValueError("Data too short for encrypted format")

        offset = 0
        version = data[offset]
        offset += 1

        algo_index = data[offset]
        offset += 1
        algorithm = list(EncryptionAlgorithm)[algo_index]

        nonce_len = int.from_bytes(data[offset:offset+2], 'big')
        offset += 2
        nonce = data[offset:offset+nonce_len]
        offset += nonce_len

        tag_len = int.from_bytes(data[offset:offset+2], 'big')
        offset += 2
        tag = data[offset:offset+tag_len] if tag_len > 0 else None
        offset += tag_len

        ciphertext = data[offset:]

        return cls(
            ciphertext=ciphertext,
            nonce=nonce,
            tag=tag,
            algorithm=algorithm,
            version=version,
        )


class EncryptionManager:
    """
    Manages encryption and decryption of data.

    Uses AES-256-GCM by default with proper nonce handling.
    Falls back to mock mode if cryptography library unavailable.
    """

    def __init__(
        self,
        key: Optional[bytes] = None,
        algorithm: EncryptionAlgorithm = EncryptionAlgorithm.AES_256_GCM
    ):
        self.algorithm = algorithm
        self._crypto_available = self._check_crypto()
        self._key = key or self._generate_key()

    def _check_crypto(self) -> bool:
        """Check if cryptography library is available."""
        try:
            from cryptography.hazmat.primitives.ciphers.aead import AESGCM
            return True
        except ImportError:
            logger.warning("cryptography library not available, using mock encryption")
            return False

    def _generate_key(self) -> bytes:
        """Generate a new encryption key."""
        return secrets.token_bytes(32)  # 256 bits

    @property
    def key(self) -> bytes:
        """Get the encryption key (for secure storage)."""
        return self._key

    def set_key(self, key: bytes) -> None:
        """Set the encryption key."""
        if len(key) != 32:
            raise ValueError("Key must be 32 bytes for AES-256")
        self._key = key

    def encrypt(self, plaintext: bytes) -> EncryptedData:
        """Encrypt data."""
        if self._crypto_available:
            return self._encrypt_real(plaintext)
        else:
            return self._encrypt_mock(plaintext)

    def _encrypt_real(self, plaintext: bytes) -> EncryptedData:
        """Encrypt using real cryptography."""
        from cryptography.hazmat.primitives.ciphers.aead import AESGCM

        nonce = secrets.token_bytes(12)  # 96 bits for GCM
        aesgcm = AESGCM(self._key)
        ciphertext_with_tag = aesgcm.encrypt(nonce, plaintext, None)

        # Split ciphertext and tag (tag is last 16 bytes)
        ciphertext = ciphertext_with_tag[:-16]
        tag = ciphertext_with_tag[-16:]

        return EncryptedData(
            ciphertext=ciphertext,
            nonce=nonce,
            tag=tag,
            algorithm=self.algorithm,
        )

    def _encrypt_mock(self, plaintext: bytes) -> EncryptedData:
        """Mock encryption for testing without cryptography library."""
        nonce = secrets.token_bytes(12)
        # Simple XOR with key (NOT SECURE - for testing only)
        key_expanded = (self._key * ((len(plaintext) // 32) + 1))[:len(plaintext)]
        ciphertext = bytes(a ^ b for a, b in zip(plaintext, key_expanded))

        return EncryptedData(
            ciphertext=ciphertext,
            nonce=nonce,
            tag=secrets.token_bytes(16),
            algorithm=self.algorithm,
        )

    def decrypt(self, encrypted: EncryptedData) -> bytes:
        """Decrypt data."""
        if self._crypto_available:
            return self._decrypt_real(encrypted)
        else:
            return self._decrypt_mock(encrypted)

    def _decrypt_real(self, encrypted: EncryptedData) -> bytes:
        """Decrypt using real cryptography."""
        from cryptography.hazmat.primitives.ciphers.aead import AESGCM

        aesgcm = AESGCM(self._key)
        # Reconstruct ciphertext with tag
        ciphertext_with_tag = encrypted.ciphertext + (encrypted.tag or b'')
        plaintext = aesgcm.decrypt(encrypted.nonce, ciphertext_with_tag, None)
        return plaintext

    def _decrypt_mock(self, encrypted: EncryptedData) -> bytes:
        """Mock decryption for testing."""
        ciphertext = encrypted.ciphertext
        key_expanded = (self._key * ((len(ciphertext) // 32) + 1))[:len(ciphertext)]
        plaintext = bytes(a ^ b for a, b in zip(ciphertext, key_expanded))
        return plaintext

    def encrypt_string(self, plaintext: str) -> str:
        """Encrypt a string and return base64 encoded result."""
        encrypted = self.encrypt(plaintext.encode('utf-8'))
        return base64.b64encode(encrypted.to_bytes()).decode('ascii')

    def decrypt_string(self, encrypted_b64: str) -> str:
        """Decrypt a base64 encoded string."""
        encrypted_bytes = base64.b64decode(encrypted_b64)
        encrypted = EncryptedData.from_bytes(encrypted_bytes)
        return self.decrypt(encrypted).decode('utf-8')


# ============================================================================
# Access Control
# ============================================================================

class Permission(Enum):
    """File permissions."""
    READ = 'r'
    WRITE = 'w'
    EXECUTE = 'x'
    ADMIN = 'a'  # Full control


@dataclass
class ACE:
    """Access Control Entry."""
    principal: str  # User or group name
    permissions: Set[Permission]
    is_group: bool = False
    is_deny: bool = False  # Deny ACE takes precedence

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "principal": self.principal,
            "permissions": [p.value for p in self.permissions],
            "is_group": self.is_group,
            "is_deny": self.is_deny,
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> 'ACE':
        """Create from dictionary."""
        return cls(
            principal=data["principal"],
            permissions={Permission(p) for p in data["permissions"]},
            is_group=data.get("is_group", False),
            is_deny=data.get("is_deny", False),
        )


class AccessControlList:
    """
    POSIX-like Access Control List.

    Supports user and group entries with allow/deny semantics.
    Deny entries take precedence over allow entries.
    """

    def __init__(self, owner: str = "root", group: str = "root"):
        self.owner = owner
        self.group = group
        self.entries: List[ACE] = []
        self.default_entries: List[ACE] = []  # For new files in directory
        self.lock = threading.RLock()

    def add_entry(
        self,
        principal: str,
        permissions: Union[Set[Permission], str],
        is_group: bool = False,
        is_deny: bool = False
    ) -> None:
        """Add an ACE to the list."""
        with self.lock:
            if isinstance(permissions, str):
                perms = set()
                if 'r' in permissions:
                    perms.add(Permission.READ)
                if 'w' in permissions:
                    perms.add(Permission.WRITE)
                if 'x' in permissions:
                    perms.add(Permission.EXECUTE)
                if 'a' in permissions:
                    perms.add(Permission.ADMIN)
            else:
                perms = permissions

            ace = ACE(
                principal=principal,
                permissions=perms,
                is_group=is_group,
                is_deny=is_deny,
            )
            self.entries.append(ace)

    def remove_entry(self, principal: str, is_group: bool = False) -> bool:
        """Remove an ACE."""
        with self.lock:
            for i, ace in enumerate(self.entries):
                if ace.principal == principal and ace.is_group == is_group:
                    del self.entries[i]
                    return True
            return False

    def check_access(
        self,
        user: str,
        groups: Set[str],
        permission: Permission
    ) -> bool:
        """
        Check if user has permission.

        Evaluation order:
        1. Explicit deny entries
        2. Owner permissions (if user is owner)
        3. Group permissions (if user in group)
        4. Other permissions
        5. Explicit allow entries
        """
        with self.lock:
            # Check explicit deny entries first
            for ace in self.entries:
                if ace.is_deny:
                    if not ace.is_group and ace.principal == user:
                        if permission in ace.permissions or Permission.ADMIN in ace.permissions:
                            return False
                    if ace.is_group and ace.principal in groups:
                        if permission in ace.permissions or Permission.ADMIN in ace.permissions:
                            return False

            # Owner has all permissions
            if user == self.owner:
                return True

            # Check group permissions
            for ace in self.entries:
                if not ace.is_deny and ace.is_group:
                    if ace.principal in groups:
                        if permission in ace.permissions or Permission.ADMIN in ace.permissions:
                            return True

            # Check user-specific allow entries
            for ace in self.entries:
                if not ace.is_deny and not ace.is_group:
                    if ace.principal == user:
                        if permission in ace.permissions or Permission.ADMIN in ace.permissions:
                            return True

            # Check "other" entry (principal = "*")
            for ace in self.entries:
                if not ace.is_deny and ace.principal == "*":
                    if permission in ace.permissions or Permission.ADMIN in ace.permissions:
                        return True

            return False

    def get_permissions_string(self) -> str:
        """Get permissions as rwx string."""
        # Simplified - just show owner/group/other
        owner_perms = ""
        group_perms = ""
        other_perms = ""

        for ace in self.entries:
            if ace.is_deny:
                continue

            perms = ""
            if Permission.READ in ace.permissions:
                perms += "r"
            else:
                perms += "-"
            if Permission.WRITE in ace.permissions:
                perms += "w"
            else:
                perms += "-"
            if Permission.EXECUTE in ace.permissions:
                perms += "x"
            else:
                perms += "-"

            if ace.principal == self.owner and not ace.is_group:
                owner_perms = perms
            elif ace.principal == self.group and ace.is_group:
                group_perms = perms
            elif ace.principal == "*":
                other_perms = perms

        return f"{owner_perms or '---'}{group_perms or '---'}{other_perms or '---'}"

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "owner": self.owner,
            "group": self.group,
            "entries": [e.to_dict() for e in self.entries],
            "default_entries": [e.to_dict() for e in self.default_entries],
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> 'AccessControlList':
        """Create from dictionary."""
        acl = cls(owner=data.get("owner", "root"), group=data.get("group", "root"))
        acl.entries = [ACE.from_dict(e) for e in data.get("entries", [])]
        acl.default_entries = [ACE.from_dict(e) for e in data.get("default_entries", [])]
        return acl


# ============================================================================
# Audit Logging
# ============================================================================

class AuditEventType(Enum):
    """Types of audit events."""
    READ = "read"
    WRITE = "write"
    DELETE = "delete"
    CREATE = "create"
    RENAME = "rename"
    PERMISSION_CHANGE = "permission_change"
    ACCESS_DENIED = "access_denied"
    LOGIN = "login"
    LOGOUT = "logout"
    ENCRYPT = "encrypt"
    DECRYPT = "decrypt"
    SNAPSHOT = "snapshot"
    RESTORE = "restore"


@dataclass
class AuditEvent:
    """A single audit event."""
    timestamp: datetime
    event_type: AuditEventType
    user: str
    resource: str
    success: bool
    details: Dict[str, Any] = field(default_factory=dict)
    ip_address: Optional[str] = None
    session_id: Optional[str] = None

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "timestamp": self.timestamp.isoformat(),
            "event_type": self.event_type.value,
            "user": self.user,
            "resource": self.resource,
            "success": self.success,
            "details": self.details,
            "ip_address": self.ip_address,
            "session_id": self.session_id,
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> 'AuditEvent':
        """Create from dictionary."""
        return cls(
            timestamp=datetime.fromisoformat(data["timestamp"]),
            event_type=AuditEventType(data["event_type"]),
            user=data["user"],
            resource=data["resource"],
            success=data["success"],
            details=data.get("details", {}),
            ip_address=data.get("ip_address"),
            session_id=data.get("session_id"),
        )


class AuditLogger:
    """
    Comprehensive audit logging system.

    Logs all security-relevant events with configurable retention
    and output formats.
    """

    def __init__(
        self,
        log_path: Optional[str] = None,
        max_events: int = 100000,
        retention_days: int = 90
    ):
        self.log_path = Path(log_path) if log_path else None
        self.max_events = max_events
        self.retention_days = retention_days
        self.events: List[AuditEvent] = []
        self.lock = threading.RLock()
        self._event_counter = 0

    def log(
        self,
        event_type: AuditEventType,
        user: str,
        resource: str,
        success: bool,
        details: Optional[Dict[str, Any]] = None,
        ip_address: Optional[str] = None,
        session_id: Optional[str] = None
    ) -> AuditEvent:
        """Log an audit event."""
        event = AuditEvent(
            timestamp=datetime.now(),
            event_type=event_type,
            user=user,
            resource=resource,
            success=success,
            details=details or {},
            ip_address=ip_address,
            session_id=session_id,
        )

        with self.lock:
            self.events.append(event)
            self._trim_events()

        # Also write to file if configured
        if self.log_path:
            self._write_to_file(event)

        return event

    def _trim_events(self):
        """Trim events to max count and retention."""
        # Trim by count
        if len(self.events) > self.max_events:
            self.events = self.events[-self.max_events:]

        # Trim by retention
        cutoff = datetime.now() - timedelta(days=self.retention_days)
        self.events = [e for e in self.events if e.timestamp >= cutoff]

    def _write_to_file(self, event: AuditEvent):
        """Write event to log file."""
        try:
            with open(self.log_path, 'a') as f:
                f.write(json.dumps(event.to_dict()) + '\n')
        except Exception as e:
            logger.error(f"Failed to write audit log: {e}")

    def get_events(
        self,
        event_type: Optional[AuditEventType] = None,
        user: Optional[str] = None,
        resource: Optional[str] = None,
        success: Optional[bool] = None,
        start_time: Optional[datetime] = None,
        end_time: Optional[datetime] = None,
        limit: int = 100
    ) -> List[AuditEvent]:
        """Get events with optional filtering."""
        with self.lock:
            events = list(self.events)

        # Apply filters
        if event_type:
            events = [e for e in events if e.event_type == event_type]
        if user:
            events = [e for e in events if e.user == user]
        if resource:
            events = [e for e in events if e.resource == resource]
        if success is not None:
            events = [e for e in events if e.success == success]
        if start_time:
            events = [e for e in events if e.timestamp >= start_time]
        if end_time:
            events = [e for e in events if e.timestamp <= end_time]

        return events[-limit:]

    def get_stats(self) -> Dict[str, Any]:
        """Get audit statistics."""
        with self.lock:
            total = len(self.events)
            if total == 0:
                return {"total_events": 0}

            by_type = defaultdict(int)
            by_user = defaultdict(int)
            success_count = 0

            for event in self.events:
                by_type[event.event_type.value] += 1
                by_user[event.user] += 1
                if event.success:
                    success_count += 1

            return {
                "total_events": total,
                "success_rate": success_count / total,
                "by_type": dict(by_type),
                "by_user": dict(by_user),
                "oldest_event": self.events[0].timestamp.isoformat(),
                "newest_event": self.events[-1].timestamp.isoformat(),
            }

    def export(self, path: str, format: str = "json") -> None:
        """Export audit log to file."""
        with self.lock:
            events = [e.to_dict() for e in self.events]

        if format == "json":
            with open(path, 'w') as f:
                json.dump(events, f, indent=2)
        elif format == "jsonl":
            with open(path, 'w') as f:
                for event in events:
                    f.write(json.dumps(event) + '\n')
        else:
            raise ValueError(f"Unsupported format: {format}")


# ============================================================================
# Rate Limiting
# ============================================================================

@dataclass
class RateLimitConfig:
    """Configuration for rate limiting."""
    max_requests: int = 100
    window_seconds: int = 60
    burst_size: int = 10


class RateLimiter:
    """
    Token bucket rate limiter.

    Limits requests per user/client within a time window.
    """

    def __init__(self, config: Optional[RateLimitConfig] = None):
        self.config = config or RateLimitConfig()
        self._buckets: Dict[str, List[float]] = {}
        self.lock = threading.RLock()

    def check(self, client_id: str) -> Tuple[bool, Dict[str, Any]]:
        """
        Check if request is allowed.

        Returns:
            Tuple of (allowed, info_dict)
        """
        with self.lock:
            now = time.time()
            window_start = now - self.config.window_seconds

            # Get or create bucket
            if client_id not in self._buckets:
                self._buckets[client_id] = []

            # Clean old entries
            self._buckets[client_id] = [
                t for t in self._buckets[client_id] if t > window_start
            ]

            bucket = self._buckets[client_id]
            current_count = len(bucket)

            allowed = current_count < self.config.max_requests

            if allowed:
                bucket.append(now)

            # Calculate reset time
            if bucket:
                oldest = min(bucket)
                reset_time = oldest + self.config.window_seconds
            else:
                reset_time = now + self.config.window_seconds

            return allowed, {
                "allowed": allowed,
                "current_count": current_count + (1 if allowed else 0),
                "max_requests": self.config.max_requests,
                "reset_seconds": reset_time - now,
                "remaining": max(0, self.config.max_requests - current_count - (1 if allowed else 0)),
            }

    def reset(self, client_id: str) -> None:
        """Reset rate limit for a client."""
        with self.lock:
            self._buckets.pop(client_id, None)

    def cleanup(self) -> int:
        """Clean up expired buckets."""
        with self.lock:
            now = time.time()
            window_start = now - self.config.window_seconds

            to_remove = []
            for client_id, bucket in self._buckets.items():
                # Remove old entries
                self._buckets[client_id] = [
                    t for t in bucket if t > window_start
                ]
                # Mark empty buckets for removal
                if not self._buckets[client_id]:
                    to_remove.append(client_id)

            for client_id in to_remove:
                del self._buckets[client_id]

            return len(to_remove)


# ============================================================================
# Unified Security Manager
# ============================================================================

class SecurityManager:
    """
    Unified security management interface.

    Combines encryption, access control, audit logging, and rate limiting.
    """

    def __init__(
        self,
        encryption_key: Optional[bytes] = None,
        audit_log_path: Optional[str] = None,
        rate_limit_config: Optional[RateLimitConfig] = None
    ):
        self.encryption = EncryptionManager(key=encryption_key)
        self.audit = AuditLogger(log_path=audit_log_path)
        self.rate_limiter = RateLimiter(config=rate_limit_config)
        self.acls: Dict[str, AccessControlList] = {}
        self.user_groups: Dict[str, Set[str]] = {}
        self.lock = threading.RLock()

    # === Encryption ===

    def encrypt(self, data: bytes) -> EncryptedData:
        """Encrypt data."""
        return self.encryption.encrypt(data)

    def decrypt(self, encrypted: EncryptedData) -> bytes:
        """Decrypt data."""
        return self.encryption.decrypt(encrypted)

    def get_encryption_key(self) -> bytes:
        """Get the encryption key for secure storage."""
        return self.encryption.key

    def set_encryption_key(self, key: bytes) -> None:
        """Set the encryption key."""
        self.encryption.set_key(key)

    # === Access Control ===

    def create_acl(
        self,
        path: str,
        owner: str = "root",
        group: str = "root"
    ) -> AccessControlList:
        """Create ACL for a path."""
        with self.lock:
            acl = AccessControlList(owner=owner, group=group)
            self.acls[path] = acl
            return acl

    def get_acl(self, path: str) -> Optional[AccessControlList]:
        """Get ACL for a path."""
        return self.acls.get(path)

    def delete_acl(self, path: str) -> bool:
        """Delete ACL for a path."""
        with self.lock:
            if path in self.acls:
                del self.acls[path]
                return True
            return False

    def check_access(
        self,
        path: str,
        user: str,
        permission: Union[Permission, str]
    ) -> bool:
        """Check if user has permission on path."""
        if isinstance(permission, str):
            permission = Permission(permission)

        acl = self.acls.get(path)
        if not acl:
            # No ACL means owner-only access
            return user == "root"

        groups = self.user_groups.get(user, set())
        return acl.check_access(user, groups, permission)

    def grant_access(
        self,
        path: str,
        principal: str,
        permissions: Union[Set[Permission], str],
        is_group: bool = False
    ) -> bool:
        """Grant access to a principal."""
        acl = self.acls.get(path)
        if not acl:
            return False

        acl.add_entry(principal, permissions, is_group=is_group, is_deny=False)
        return True

    def deny_access(
        self,
        path: str,
        principal: str,
        permissions: Union[Set[Permission], str],
        is_group: bool = False
    ) -> bool:
        """Deny access to a principal."""
        acl = self.acls.get(path)
        if not acl:
            return False

        acl.add_entry(principal, permissions, is_group=is_group, is_deny=True)
        return True

    # === User/Group Management ===

    def add_user_to_group(self, user: str, group: str) -> None:
        """Add user to a group."""
        with self.lock:
            if user not in self.user_groups:
                self.user_groups[user] = set()
            self.user_groups[user].add(group)

    def remove_user_from_group(self, user: str, group: str) -> bool:
        """Remove user from a group."""
        with self.lock:
            if user in self.user_groups and group in self.user_groups[user]:
                self.user_groups[user].discard(group)
                return True
            return False

    def get_user_groups(self, user: str) -> Set[str]:
        """Get groups for a user."""
        return self.user_groups.get(user, set()).copy()

    # === Audit ===

    def audit_log(
        self,
        event_type: Union[AuditEventType, str],
        resource: str,
        user: str,
        success: bool,
        details: Optional[Dict[str, Any]] = None
    ) -> AuditEvent:
        """Log an audit event."""
        if isinstance(event_type, str):
            event_type = AuditEventType(event_type)

        return self.audit.log(
            event_type=event_type,
            user=user,
            resource=resource,
            success=success,
            details=details,
        )

    def get_audit_events(self, **kwargs) -> List[AuditEvent]:
        """Get audit events with filtering."""
        return self.audit.get_events(**kwargs)

    def get_audit_stats(self) -> Dict[str, Any]:
        """Get audit statistics."""
        return self.audit.get_stats()

    # === Rate Limiting ===

    def check_rate_limit(self, client_id: str) -> Tuple[bool, Dict[str, Any]]:
        """Check rate limit for a client."""
        return self.rate_limiter.check(client_id)

    # === Serialization ===

    def export_state(self) -> Dict[str, Any]:
        """Export security state for persistence."""
        with self.lock:
            return {
                "acls": {path: acl.to_dict() for path, acl in self.acls.items()},
                "user_groups": {user: list(groups) for user, groups in self.user_groups.items()},
            }

    def import_state(self, state: Dict[str, Any]) -> None:
        """Import security state from persistence."""
        with self.lock:
            self.acls = {
                path: AccessControlList.from_dict(acl_data)
                for path, acl_data in state.get("acls", {}).items()
            }
            self.user_groups = {
                user: set(groups) for user, groups in state.get("user_groups", {}).items()
            }


# Convenience function
def create_security_manager(
    encryption_key: Optional[str] = None,
    audit_path: Optional[str] = None
) -> SecurityManager:
    """Create a security manager with optional configuration."""
    key = encryption_key.encode('utf-8') if encryption_key else None
    return SecurityManager(encryption_key=key, audit_log_path=audit_path)


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Infinite Map Security")
    parser.add_argument("--key", help="Encryption key")
    parser.add_argument("--audit-log", help="Audit log path")
    parser.add_argument("--test", action="store_true", help="Run test")

    args = parser.parse_args()

    if args.test:
        # Run basic tests
        print("Testing security manager...")

        sm = create_security_manager(
            encryption_key=args.key or "test_key_12345678901234567890",
            audit_path=args.audit_log
        )

        # Test encryption
        data = b"Hello, secure world!"
        encrypted = sm.encrypt(data)
        decrypted = sm.decrypt(encrypted)
        assert decrypted == data, "Encryption/decryption failed"
        print("✓ Encryption works")

        # Test ACL
        sm.create_acl("/test", owner="user1", group="group1")
        sm.add_user_to_group("user2", "group1")
        sm.grant_access("/test", "group1", "r", is_group=True)

        assert sm.check_access("/test", "user1", Permission.READ)
        assert sm.check_access("/test", "user2", Permission.READ)
        assert not sm.check_access("/test", "user2", Permission.WRITE)
        print("✓ Access control works")

        # Test audit
        sm.audit_log("read", "/test", "user1", True)
        events = sm.get_audit_events(user="user1")
        assert len(events) == 1
        print("✓ Audit logging works")

        # Test rate limiting
        for i in range(105):
            allowed, info = sm.check_rate_limit("client1")
            if i < 100:
                assert allowed, f"Request {i} should be allowed"
            else:
                assert not allowed, f"Request {i} should be denied"
        print("✓ Rate limiting works")

        print("\nAll tests passed!")
    else:
        print("Use --test to run tests")
