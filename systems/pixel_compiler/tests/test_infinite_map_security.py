#!/usr/bin/env python3
"""
Tests for Infinite Map Security Infrastructure.

Comprehensive test coverage for:
- EncryptionManager (AES-256, serialization)
- AccessControlList (ACE, permissions, POSIX-like ACLs)
- AuditLogger (events, filtering, stats)
- RateLimiter (token bucket, cleanup)
- SecurityManager (unified interface)

Run with:
    PYTHONPATH=. pytest systems/pixel_compiler/tests/test_infinite_map_security.py -v
"""

import os
import sys
import json
import tempfile
import time
import threading
from pathlib import Path
from datetime import datetime, timedelta
from unittest.mock import Mock, patch

import pytest

# Add parent to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.pixel_compiler.infinite_map_security import (
    EncryptionAlgorithm,
    EncryptedData,
    EncryptionManager,
    Permission,
    ACE,
    AccessControlList,
    AuditEventType,
    AuditEvent,
    AuditLogger,
    RateLimitConfig,
    RateLimiter,
    SecurityManager,
    create_security_manager,
)


# ============================================================================
# Encryption Tests
# ============================================================================

class TestEncryptionAlgorithm:
    """Tests for EncryptionAlgorithm enum."""

    def test_algorithms(self):
        """Test all algorithms exist."""
        assert EncryptionAlgorithm.AES_256_GCM.value == "aes-256-gcm"
        assert EncryptionAlgorithm.AES_256_CBC.value == "aes-256-cbc"
        assert EncryptionAlgorithm.CHACHA20_POLY1305.value == "chacha20-poly1305"


class TestEncryptedData:
    """Tests for EncryptedData class."""

    def test_create_encrypted_data(self):
        """Test creating encrypted data."""
        data = EncryptedData(
            ciphertext=b"encrypted",
            nonce=b"nonce1234567",
            tag=b"tag123456789012",
            algorithm=EncryptionAlgorithm.AES_256_GCM,
        )
        assert data.ciphertext == b"encrypted"
        assert data.nonce == b"nonce1234567"

    def test_serialize_deserialize(self):
        """Test serialization and deserialization."""
        original = EncryptedData(
            ciphertext=b"test ciphertext data",
            nonce=b"nonce12345678",
            tag=b"tag456789012345",
            algorithm=EncryptionAlgorithm.AES_256_GCM,
            version=1,
        )

        serialized = original.to_bytes()
        restored = EncryptedData.from_bytes(serialized)

        assert restored.ciphertext == original.ciphertext
        assert restored.nonce == original.nonce
        assert restored.tag == original.tag
        assert restored.algorithm == original.algorithm

    def test_serialize_no_tag(self):
        """Test serialization without tag."""
        data = EncryptedData(
            ciphertext=b"data",
            nonce=b"nonce1234567",
            tag=None,
            algorithm=EncryptionAlgorithm.AES_256_GCM,
        )

        serialized = data.to_bytes()
        restored = EncryptedData.from_bytes(serialized)

        assert restored.tag is None


class TestEncryptionManager:
    """Tests for EncryptionManager class."""

    def test_create_manager(self):
        """Test creating encryption manager."""
        manager = EncryptionManager()
        assert manager.algorithm == EncryptionAlgorithm.AES_256_GCM
        assert len(manager.key) == 32

    def test_create_with_key(self):
        """Test creating with custom key."""
        key = os.urandom(32)
        manager = EncryptionManager(key=key)
        assert manager.key == key

    def test_set_key(self):
        """Test setting key."""
        manager = EncryptionManager()
        new_key = os.urandom(32)
        manager.set_key(new_key)
        assert manager.key == new_key

    def test_set_invalid_key(self):
        """Test setting invalid key."""
        manager = EncryptionManager()
        with pytest.raises(ValueError):
            manager.set_key(b"too short")

    def test_encrypt_decrypt(self):
        """Test encryption and decryption."""
        manager = EncryptionManager()
        plaintext = b"Hello, World!"

        encrypted = manager.encrypt(plaintext)
        assert encrypted.ciphertext != plaintext

        decrypted = manager.decrypt(encrypted)
        assert decrypted == plaintext

    def test_encrypt_decrypt_string(self):
        """Test string encryption/decryption."""
        manager = EncryptionManager()
        plaintext = "Hello, Unicode! 你好"

        encrypted_b64 = manager.encrypt_string(plaintext)
        assert isinstance(encrypted_b64, str)

        decrypted = manager.decrypt_string(encrypted_b64)
        assert decrypted == plaintext

    def test_encrypt_different_nonces(self):
        """Test that encryption uses different nonces."""
        manager = EncryptionManager()
        data = b"same data"

        enc1 = manager.encrypt(data)
        enc2 = manager.encrypt(data)

        # Same data should produce different ciphertexts
        assert enc1.nonce != enc2.nonce
        assert enc1.ciphertext != enc2.ciphertext

    def test_empty_data(self):
        """Test encrypting empty data."""
        manager = EncryptionManager()
        encrypted = manager.encrypt(b"")
        decrypted = manager.decrypt(encrypted)
        assert decrypted == b""

    def test_large_data(self):
        """Test encrypting large data."""
        manager = EncryptionManager()
        data = os.urandom(1024 * 1024)  # 1MB

        encrypted = manager.encrypt(data)
        decrypted = manager.decrypt(encrypted)
        assert decrypted == data


# ============================================================================
# Access Control Tests
# ============================================================================

class TestPermission:
    """Tests for Permission enum."""

    def test_permissions(self):
        """Test all permissions exist."""
        assert Permission.READ.value == 'r'
        assert Permission.WRITE.value == 'w'
        assert Permission.EXECUTE.value == 'x'
        assert Permission.ADMIN.value == 'a'


class TestACE:
    """Tests for ACE class."""

    def test_create_ace(self):
        """Test creating an ACE."""
        ace = ACE(
            principal="user1",
            permissions={Permission.READ, Permission.WRITE},
        )
        assert ace.principal == "user1"
        assert Permission.READ in ace.permissions
        assert Permission.WRITE in ace.permissions
        assert ace.is_group is False
        assert ace.is_deny is False

    def test_ace_serialization(self):
        """Test ACE serialization."""
        ace = ACE(
            principal="group1",
            permissions={Permission.READ},
            is_group=True,
            is_deny=True,
        )
        data = ace.to_dict()

        assert data["principal"] == "group1"
        assert data["is_group"] is True
        assert data["is_deny"] is True
        assert "r" in data["permissions"]

    def test_ace_deserialization(self):
        """Test ACE deserialization."""
        data = {
            "principal": "user1",
            "permissions": ["r", "w"],
            "is_group": False,
            "is_deny": False,
        }
        ace = ACE.from_dict(data)

        assert ace.principal == "user1"
        assert Permission.READ in ace.permissions
        assert Permission.WRITE in ace.permissions


class TestAccessControlList:
    """Tests for AccessControlList class."""

    def test_create_acl(self):
        """Test creating an ACL."""
        acl = AccessControlList(owner="user1", group="group1")
        assert acl.owner == "user1"
        assert acl.group == "group1"
        assert len(acl.entries) == 0

    def test_add_entry(self):
        """Test adding an entry."""
        acl = AccessControlList()
        acl.add_entry("user1", {Permission.READ, Permission.WRITE})

        assert len(acl.entries) == 1
        assert acl.entries[0].principal == "user1"

    def test_add_entry_string_permissions(self):
        """Test adding entry with string permissions."""
        acl = AccessControlList()
        acl.add_entry("user1", "rwx")

        assert Permission.READ in acl.entries[0].permissions
        assert Permission.WRITE in acl.entries[0].permissions
        assert Permission.EXECUTE in acl.entries[0].permissions

    def test_remove_entry(self):
        """Test removing an entry."""
        acl = AccessControlList()
        acl.add_entry("user1", "rw")
        acl.add_entry("user2", "r")

        result = acl.remove_entry("user1")
        assert result is True
        assert len(acl.entries) == 1

    def test_remove_nonexistent_entry(self):
        """Test removing nonexistent entry."""
        acl = AccessControlList()
        result = acl.remove_entry("nonexistent")
        assert result is False

    def test_check_access_owner(self):
        """Test that owner has all access."""
        acl = AccessControlList(owner="user1")

        assert acl.check_access("user1", set(), Permission.READ)
        assert acl.check_access("user1", set(), Permission.WRITE)
        assert acl.check_access("user1", set(), Permission.EXECUTE)

    def test_check_access_group(self):
        """Test group access."""
        acl = AccessControlList(group="group1")
        acl.add_entry("group1", "r", is_group=True)

        assert acl.check_access("user1", {"group1"}, Permission.READ)
        assert not acl.check_access("user1", {"group1"}, Permission.WRITE)

    def test_check_access_deny(self):
        """Test that deny entries take precedence."""
        acl = AccessControlList()
        acl.add_entry("user1", "rwx")
        acl.add_entry("user1", "r", is_deny=True)

        # Deny should take precedence
        assert not acl.check_access("user1", set(), Permission.READ)

    def test_check_access_other(self):
        """Test 'other' entry (principal = '*')."""
        acl = AccessControlList()
        acl.add_entry("*", "r")

        assert acl.check_access("anyone", set(), Permission.READ)
        assert not acl.check_access("anyone", set(), Permission.WRITE)

    def test_get_permissions_string(self):
        """Test getting permissions string."""
        acl = AccessControlList(owner="user1", group="group1")
        acl.add_entry("user1", "rwx")
        acl.add_entry("group1", "r-x", is_group=True)
        acl.add_entry("*", "r--")

        perms = acl.get_permissions_string()
        assert len(perms) == 9  # 3 groups of 3 chars

    def test_acl_serialization(self):
        """Test ACL serialization."""
        acl = AccessControlList(owner="user1", group="group1")
        acl.add_entry("user1", "rw")
        acl.add_entry("group1", "r", is_group=True)

        data = acl.to_dict()

        assert data["owner"] == "user1"
        assert data["group"] == "group1"
        assert len(data["entries"]) == 2

    def test_acl_deserialization(self):
        """Test ACL deserialization."""
        data = {
            "owner": "user1",
            "group": "group1",
            "entries": [
                {
                    "principal": "user1",
                    "permissions": ["r", "w"],
                    "is_group": False,
                    "is_deny": False,
                }
            ],
            "default_entries": [],
        }
        acl = AccessControlList.from_dict(data)

        assert acl.owner == "user1"
        assert len(acl.entries) == 1


# ============================================================================
# Audit Tests
# ============================================================================

class TestAuditEventType:
    """Tests for AuditEventType enum."""

    def test_event_types(self):
        """Test all event types exist."""
        assert AuditEventType.READ.value == "read"
        assert AuditEventType.WRITE.value == "write"
        assert AuditEventType.DELETE.value == "delete"
        assert AuditEventType.ACCESS_DENIED.value == "access_denied"


class TestAuditEvent:
    """Tests for AuditEvent class."""

    def test_create_event(self):
        """Test creating an audit event."""
        event = AuditEvent(
            timestamp=datetime.now(),
            event_type=AuditEventType.READ,
            user="user1",
            resource="/file",
            success=True,
        )
        assert event.user == "user1"
        assert event.success is True

    def test_event_serialization(self):
        """Test event serialization."""
        event = AuditEvent(
            timestamp=datetime(2026, 2, 12, 12, 0, 0),
            event_type=AuditEventType.READ,
            user="user1",
            resource="/test/file",
            success=True,
            details={"bytes_read": 1024},
            ip_address="192.168.1.1",
        )
        data = event.to_dict()

        assert data["user"] == "user1"
        assert data["event_type"] == "read"
        assert data["ip_address"] == "192.168.1.1"

    def test_event_deserialization(self):
        """Test event deserialization."""
        data = {
            "timestamp": "2026-02-12T12:00:00",
            "event_type": "write",
            "user": "user1",
            "resource": "/file",
            "success": False,
            "details": {"reason": "permission denied"},
        }
        event = AuditEvent.from_dict(data)

        assert event.event_type == AuditEventType.WRITE
        assert event.success is False


class TestAuditLogger:
    """Tests for AuditLogger class."""

    def test_create_logger(self):
        """Test creating an audit logger."""
        logger = AuditLogger()
        assert len(logger.events) == 0

    def test_log_event(self):
        """Test logging an event."""
        logger = AuditLogger()
        event = logger.log(
            event_type=AuditEventType.READ,
            user="user1",
            resource="/file",
            success=True,
        )

        assert len(logger.events) == 1
        assert event.user == "user1"

    def test_get_events_no_filter(self):
        """Test getting events without filter."""
        logger = AuditLogger()

        for i in range(5):
            logger.log(AuditEventType.READ, f"user{i}", f"/file{i}", True)

        events = logger.get_events()
        assert len(events) == 5

    def test_get_events_with_filter(self):
        """Test getting events with filter."""
        logger = AuditLogger()

        logger.log(AuditEventType.READ, "user1", "/file1", True)
        logger.log(AuditEventType.WRITE, "user1", "/file2", True)
        logger.log(AuditEventType.READ, "user2", "/file3", True)

        # Filter by event type
        events = logger.get_events(event_type=AuditEventType.READ)
        assert len(events) == 2

        # Filter by user
        events = logger.get_events(user="user1")
        assert len(events) == 2

    def test_get_events_time_filter(self):
        """Test getting events with time filter."""
        logger = AuditLogger()

        logger.log(AuditEventType.READ, "user1", "/file", True)
        time.sleep(0.01)

        start = datetime.now()
        logger.log(AuditEventType.WRITE, "user2", "/file", True)

        events = logger.get_events(start_time=start)
        assert len(events) == 1
        assert events[0].event_type == AuditEventType.WRITE

    def test_get_stats(self):
        """Test getting statistics."""
        logger = AuditLogger()

        logger.log(AuditEventType.READ, "user1", "/file", True)
        logger.log(AuditEventType.READ, "user1", "/file", True)
        logger.log(AuditEventType.WRITE, "user2", "/file", False)

        stats = logger.get_stats()

        assert stats["total_events"] == 3
        assert stats["by_type"]["read"] == 2
        assert stats["by_type"]["write"] == 1
        assert stats["by_user"]["user1"] == 2

    def test_max_events_limit(self):
        """Test max events limit."""
        logger = AuditLogger(max_events=10)

        for i in range(20):
            logger.log(AuditEventType.READ, "user", f"/file{i}", True)

        assert len(logger.events) == 10

    def test_export_json(self):
        """Test exporting to JSON."""
        logger = AuditLogger()
        logger.log(AuditEventType.READ, "user1", "/file", True)

        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            temp_path = f.name

        try:
            logger.export(temp_path, format="json")

            with open(temp_path) as f:
                data = json.load(f)

            assert len(data) == 1
        finally:
            Path(temp_path).unlink(missing_ok=True)

    def test_export_jsonl(self):
        """Test exporting to JSONL."""
        logger = AuditLogger()
        logger.log(AuditEventType.READ, "user1", "/file", True)
        logger.log(AuditEventType.WRITE, "user2", "/file", True)

        with tempfile.NamedTemporaryFile(suffix=".jsonl", delete=False) as f:
            temp_path = f.name

        try:
            logger.export(temp_path, format="jsonl")

            with open(temp_path) as f:
                lines = f.readlines()

            assert len(lines) == 2
        finally:
            Path(temp_path).unlink(missing_ok=True)

    def test_file_logging(self):
        """Test logging to file."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            temp_path = f.name

        try:
            logger = AuditLogger(log_path=temp_path)
            logger.log(AuditEventType.READ, "user1", "/file", True)

            with open(temp_path) as f:
                content = f.read()

            assert "user1" in content
        finally:
            Path(temp_path).unlink(missing_ok=True)


# ============================================================================
# Rate Limiter Tests
# ============================================================================

class TestRateLimitConfig:
    """Tests for RateLimitConfig."""

    def test_default_config(self):
        """Test default configuration."""
        config = RateLimitConfig()
        assert config.max_requests == 100
        assert config.window_seconds == 60

    def test_custom_config(self):
        """Test custom configuration."""
        config = RateLimitConfig(max_requests=50, window_seconds=30)
        assert config.max_requests == 50


class TestRateLimiter:
    """Tests for RateLimiter class."""

    def test_create_limiter(self):
        """Test creating a rate limiter."""
        limiter = RateLimiter()
        assert limiter.config.max_requests == 100

    def test_allow_requests(self):
        """Test allowing requests."""
        config = RateLimitConfig(max_requests=5, window_seconds=60)
        limiter = RateLimiter(config=config)

        for i in range(5):
            allowed, info = limiter.check("client1")
            assert allowed is True

    def test_deny_over_limit(self):
        """Test denying requests over limit."""
        config = RateLimitConfig(max_requests=3, window_seconds=60)
        limiter = RateLimiter(config=config)

        for i in range(3):
            limiter.check("client1")

        allowed, info = limiter.check("client1")
        assert allowed is False
        assert info["remaining"] == 0

    def test_rate_limit_info(self):
        """Test rate limit info."""
        config = RateLimitConfig(max_requests=10, window_seconds=60)
        limiter = RateLimiter(config=config)

        allowed, info = limiter.check("client1")

        assert info["allowed"] is True
        assert info["current_count"] == 1
        assert info["max_requests"] == 10
        assert info["remaining"] == 9

    def test_reset(self):
        """Test resetting rate limit."""
        config = RateLimitConfig(max_requests=2, window_seconds=60)
        limiter = RateLimiter(config=config)

        limiter.check("client1")
        limiter.check("client1")
        allowed, _ = limiter.check("client1")
        assert allowed is False

        limiter.reset("client1")
        allowed, _ = limiter.check("client1")
        assert allowed is True

    def test_independent_clients(self):
        """Test independent rate limiting for clients."""
        config = RateLimitConfig(max_requests=2, window_seconds=60)
        limiter = RateLimiter(config=config)

        limiter.check("client1")
        limiter.check("client1")

        allowed1, _ = limiter.check("client1")
        allowed2, _ = limiter.check("client2")

        assert allowed1 is False
        assert allowed2 is True

    def test_cleanup(self):
        """Test cleanup of expired buckets."""
        config = RateLimitConfig(max_requests=10, window_seconds=1)
        limiter = RateLimiter(config=config)

        limiter.check("client1")
        time.sleep(1.1)

        removed = limiter.cleanup()
        assert removed == 1


# ============================================================================
# Security Manager Tests
# ============================================================================

class TestSecurityManager:
    """Tests for SecurityManager class."""

    def test_create_manager(self):
        """Test creating a security manager."""
        sm = SecurityManager()
        assert sm.encryption is not None
        assert sm.audit is not None
        assert sm.rate_limiter is not None

    def test_encrypt_decrypt(self):
        """Test encryption through manager."""
        sm = SecurityManager()
        data = b"sensitive data"

        encrypted = sm.encrypt(data)
        decrypted = sm.decrypt(encrypted)

        assert decrypted == data

    def test_acl_management(self):
        """Test ACL management."""
        sm = SecurityManager()

        acl = sm.create_acl("/test", owner="user1", group="group1")
        assert acl is not None

        retrieved = sm.get_acl("/test")
        assert retrieved == acl

        result = sm.delete_acl("/test")
        assert result is True
        assert sm.get_acl("/test") is None

    def test_access_control(self):
        """Test access control."""
        sm = SecurityManager()

        sm.create_acl("/file", owner="user1")
        sm.add_user_to_group("user2", "editors")
        sm.grant_access("/file", "editors", "rw", is_group=True)

        # Owner should have access
        assert sm.check_access("/file", "user1", Permission.READ)

        # Group member should have granted access
        assert sm.check_access("/file", "user2", Permission.READ)
        assert sm.check_access("/file", "user2", Permission.WRITE)

        # Non-member should not have access
        assert not sm.check_access("/file", "user3", Permission.READ)

    def test_deny_access(self):
        """Test denying access."""
        sm = SecurityManager()

        sm.create_acl("/file", owner="admin")
        sm.grant_access("/file", "user1", "rw")
        sm.deny_access("/file", "user1", "w")

        # Read should work
        assert sm.check_access("/file", "user1", Permission.READ)

        # Write should be denied
        assert not sm.check_access("/file", "user1", Permission.WRITE)

    def test_user_group_management(self):
        """Test user/group management."""
        sm = SecurityManager()

        sm.add_user_to_group("user1", "group1")
        sm.add_user_to_group("user1", "group2")

        groups = sm.get_user_groups("user1")
        assert "group1" in groups
        assert "group2" in groups

        sm.remove_user_from_group("user1", "group1")
        groups = sm.get_user_groups("user1")
        assert "group1" not in groups
        assert "group2" in groups

    def test_audit_logging(self):
        """Test audit logging."""
        sm = SecurityManager()

        sm.audit_log("read", "/file", "user1", True)
        sm.audit_log("write", "/file", "user1", False)

        events = sm.get_audit_events(user="user1")
        assert len(events) == 2

        stats = sm.get_audit_stats()
        assert stats["total_events"] == 2

    def test_rate_limiting(self):
        """Test rate limiting."""
        config = RateLimitConfig(max_requests=3, window_seconds=60)
        sm = SecurityManager(rate_limit_config=config)

        for i in range(3):
            allowed, _ = sm.check_rate_limit("client1")
            assert allowed is True

        allowed, info = sm.check_rate_limit("client1")
        assert allowed is False

    def test_export_import_state(self):
        """Test exporting and importing state."""
        sm = SecurityManager()

        sm.create_acl("/file1", owner="user1")
        sm.create_acl("/file2", owner="user2")
        sm.add_user_to_group("user1", "group1")

        state = sm.export_state()

        new_sm = SecurityManager()
        new_sm.import_state(state)

        assert new_sm.get_acl("/file1") is not None
        assert new_sm.get_acl("/file2") is not None
        assert "group1" in new_sm.get_user_groups("user1")


class TestConvenienceFunctions:
    """Tests for convenience functions."""

    def test_create_security_manager(self):
        """Test create_security_manager function."""
        sm = create_security_manager(
            encryption_key="test_key_32_characters_long_!!"
        )
        assert sm.encryption is not None

    def test_create_with_audit_path(self):
        """Test creating with audit path."""
        with tempfile.TemporaryDirectory() as tmpdir:
            audit_path = Path(tmpdir) / "audit.json"
            sm = create_security_manager(audit_path=str(audit_path))

            sm.audit_log("read", "/file", "user1", True)  # Use valid event type

            assert audit_path.exists()


class TestThreadSafety:
    """Tests for thread safety."""

    def test_concurrent_acl_modifications(self):
        """Test concurrent ACL modifications."""
        sm = SecurityManager()
        sm.create_acl("/file", owner="admin")

        errors = []

        def modify_acl(user):
            try:
                for i in range(50):
                    sm.grant_access("/file", f"{user}_{i}", "r")
            except Exception as e:
                errors.append(e)

        threads = [
            threading.Thread(target=modify_acl, args=(f"user{i}",))
            for i in range(4)
        ]

        for t in threads:
            t.start()
        for t in threads:
            t.join()

        assert len(errors) == 0
        acl = sm.get_acl("/file")
        assert len(acl.entries) == 200  # 4 threads * 50 entries

    def test_concurrent_audit_logging(self):
        """Test concurrent audit logging."""
        sm = SecurityManager()
        errors = []

        def log_events(thread_id):
            try:
                for i in range(100):
                    sm.audit_log("read", f"/file{i}", f"user{thread_id}", True)
            except Exception as e:
                errors.append(e)

        threads = [
            threading.Thread(target=log_events, args=(i,))
            for i in range(4)
        ]

        for t in threads:
            t.start()
        for t in threads:
            t.join()

        assert len(errors) == 0
        stats = sm.get_audit_stats()
        assert stats["total_events"] == 400


class TestIntegration:
    """Integration tests."""

    def test_full_security_workflow(self):
        """Test complete security workflow."""
        with tempfile.TemporaryDirectory() as tmpdir:
            audit_path = Path(tmpdir) / "audit.json"

            # Use exactly 32 character key for AES-256
            sm = create_security_manager(
                encryption_key="integration_test_key_32_chars!!!",
                audit_path=str(audit_path)
            )

            # Create ACL for a resource
            sm.create_acl("/secure/data", owner="admin", group="admins")
            sm.grant_access("/secure/data", "admins", "rwx", is_group=True)
            sm.add_user_to_group("alice", "admins")

            # Check access
            assert sm.check_access("/secure/data", "alice", Permission.READ)
            assert sm.check_access("/secure/data", "alice", Permission.WRITE)

            # Encrypt sensitive data
            sensitive = b"Top secret information"
            encrypted = sm.encrypt(sensitive)

            # Log access
            sm.audit_log("read", "/secure/data", "alice", True, {"bytes": len(sensitive)})

            # Check rate limit
            for i in range(100):
                sm.check_rate_limit("alice_client")
            allowed, _ = sm.check_rate_limit("alice_client")
            assert allowed is False  # Should be rate limited

            # Verify audit
            events = sm.get_audit_events(user="alice")
            assert len(events) == 1

            # Decrypt data
            decrypted = sm.decrypt(encrypted)
            assert decrypted == sensitive

            # Export state
            state = sm.export_state()
            assert "/secure/data" in state["acls"]


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
