#!/usr/bin/env python3
"""
Tests for Infinite Map Advanced FUSE Features.

Tests extended attributes, symbolic/hard links, file locking,
directory notifications, POSIX ACLs, and compliance testing.
"""

import pytest
import time
import fcntl
from pathlib import Path
from unittest.mock import Mock, patch, MagicMock
from datetime import datetime, timedelta
from collections import defaultdict

from systems.pixel_compiler.infinite_map_fuse_advanced import (
    # Enums
    LockType,
    ACLType,
    Permission,
    NotificationType,
    # Constants
    S_ISUID, S_ISGID, S_ISVTX,
    S_IRUSR, S_IWUSR, S_IXUSR,
    S_IRGRP, S_IWGRP, S_IXGRP,
    S_IROTH, S_IWOTH, S_IXOTH,
    # Dataclasses
    XAttrEntry,
    LinkEntry,
    FileLock,
    ACLEntry,
    DirectoryEvent,
    # Classes
    ExtendedAttributes,
    SymbolicLinkManager,
    HardLinkManager,
    FileLockManager,
    DirectoryNotifier,
    POSIXACLManager,
    POSIXComplianceTester,
    FUSEAdvancedFeatures,
)


# ============================================================================
# Test Enums and Constants
# ============================================================================

class TestEnums:
    """Tests for enums."""

    def test_lock_types(self):
        """Test LockType enum values."""
        assert LockType.SHARED.value == fcntl.LOCK_SH
        assert LockType.EXCLUSIVE.value == fcntl.LOCK_EX
        assert LockType.UNLOCK.value == fcntl.LOCK_UN

    def test_acl_types(self):
        """Test ACLType enum values."""
        assert ACLType.USER.value == "user"
        assert ACLType.GROUP.value == "group"
        assert ACLType.OTHER.value == "other"
        assert ACLType.MASK.value == "mask"

    def test_permissions(self):
        """Test Permission enum values."""
        assert Permission.READ.value == 4
        assert Permission.WRITE.value == 2
        assert Permission.EXECUTE.value == 1

    def test_notification_types(self):
        """Test NotificationType enum values."""
        assert NotificationType.CREATE.value == "create"
        assert NotificationType.DELETE.value == "delete"
        assert NotificationType.MODIFY.value == "modify"
        assert NotificationType.RENAME.value == "rename"
        assert NotificationType.ATTRIB.value == "attrib"

    def test_permission_constants(self):
        """Test POSIX permission constants."""
        assert S_IRUSR == 0o0400
        assert S_IWUSR == 0o0200
        assert S_IXUSR == 0o0100
        assert S_ISUID == 0o4000


# ============================================================================
# Test Dataclasses
# ============================================================================

class TestXAttrEntry:
    """Tests for XAttrEntry dataclass."""

    def test_creation(self):
        """Test XAttrEntry creation."""
        entry = XAttrEntry(
            name="comment",
            value=b"test value",
            namespace="user",
        )
        assert entry.name == "comment"
        assert entry.value == b"test value"
        assert entry.namespace == "user"

    def test_default_namespace(self):
        """Test default namespace."""
        entry = XAttrEntry(name="key", value=b"value")
        assert entry.namespace == "user"

    def test_to_dict(self):
        """Test to_dict conversion."""
        entry = XAttrEntry(
            name="comment",
            value=b"hello",
            namespace="user",
        )
        d = entry.to_dict()
        assert d["name"] == "comment"
        assert d["namespace"] == "user"
        assert d["value_size"] == 5


class TestLinkEntry:
    """Tests for LinkEntry dataclass."""

    def test_creation(self):
        """Test LinkEntry creation."""
        entry = LinkEntry(
            source="/link",
            target="/target",
            link_type="symlink",
        )
        assert entry.source == "/link"
        assert entry.target == "/target"
        assert entry.link_type == "symlink"
        assert entry.inode is None

    def test_to_dict(self):
        """Test to_dict conversion."""
        entry = LinkEntry(
            source="/link",
            target="/target",
            link_type="hardlink",
            inode=123,
        )
        d = entry.to_dict()
        assert d["source"] == "/link"
        assert d["target"] == "/target"
        assert d["link_type"] == "hardlink"
        assert d["inode"] == 123


class TestFileLock:
    """Tests for FileLock dataclass."""

    def test_creation(self):
        """Test FileLock creation."""
        lock = FileLock(
            path="/file",
            lock_type=LockType.EXCLUSIVE,
            owner_pid=1234,
            start=0,
            length=100,
        )
        assert lock.path == "/file"
        assert lock.lock_type == LockType.EXCLUSIVE
        assert lock.owner_pid == 1234
        assert lock.start == 0
        assert lock.length == 100

    def test_to_dict(self):
        """Test to_dict conversion."""
        lock = FileLock(
            path="/file",
            lock_type=LockType.SHARED,
            owner_pid=1234,
            start=0,
            length=0,
        )
        d = lock.to_dict()
        assert d["path"] == "/file"
        assert d["lock_type"] == "SHARED"
        assert d["owner_pid"] == 1234


class TestACLEntry:
    """Tests for ACLEntry dataclass."""

    def test_creation(self):
        """Test ACLEntry creation."""
        entry = ACLEntry(
            acl_type=ACLType.USER,
            qualifier=1000,
            permissions=6,  # rw
        )
        assert entry.acl_type == ACLType.USER
        assert entry.qualifier == 1000
        assert entry.permissions == 6

    def test_permissions_str(self):
        """Test permissions string conversion."""
        assert ACLEntry(ACLType.USER, 0, 7).permissions_str() == "rwx"
        assert ACLEntry(ACLType.USER, 0, 6).permissions_str() == "rw-"
        assert ACLEntry(ACLType.USER, 0, 4).permissions_str() == "r--"
        assert ACLEntry(ACLType.USER, 0, 0).permissions_str() == "---"

    def test_to_dict(self):
        """Test to_dict conversion."""
        entry = ACLEntry(
            acl_type=ACLType.GROUP,
            qualifier=100,
            permissions=5,  # rx
        )
        d = entry.to_dict()
        assert d["type"] == "group"
        assert d["qualifier"] == 100
        assert d["permissions"] == 5
        assert d["permissions_str"] == "r-x"


class TestDirectoryEvent:
    """Tests for DirectoryEvent dataclass."""

    def test_creation(self):
        """Test DirectoryEvent creation."""
        event = DirectoryEvent(
            event_type=NotificationType.CREATE,
            path="/dir",
            filename="file.txt",
        )
        assert event.event_type == NotificationType.CREATE
        assert event.path == "/dir"
        assert event.filename == "file.txt"

    def test_to_dict(self):
        """Test to_dict conversion."""
        event = DirectoryEvent(
            event_type=NotificationType.MODIFY,
            path="/dir",
            filename="file.txt",
            details={"size": 100},
        )
        d = event.to_dict()
        assert d["event_type"] == "modify"
        assert d["path"] == "/dir"
        assert d["filename"] == "file.txt"
        assert d["details"] == {"size": 100}


# ============================================================================
# Test ExtendedAttributes
# ============================================================================

class TestExtendedAttributes:
    """Tests for ExtendedAttributes class."""

    def test_init(self):
        """Test initialization."""
        xattr = ExtendedAttributes()
        assert len(xattr.attributes) == 0

    def test_set_get(self):
        """Test set and get operations."""
        xattr = ExtendedAttributes()

        xattr.set("/file", "user.comment", b"test value")
        value = xattr.get("/file", "user.comment")

        assert value == b"test value"

    def test_set_with_namespace(self):
        """Test set with explicit namespace."""
        xattr = ExtendedAttributes()

        xattr.set("/file", "security.label", b"confidential")
        value = xattr.get("/file", "security.label")

        assert value == b"confidential"

    def test_list(self):
        """Test listing attributes."""
        xattr = ExtendedAttributes()

        xattr.set("/file", "user.comment", b"test")
        xattr.set("/file", "user.author", b"me")

        attrs = xattr.list("/file")
        assert len(attrs) == 2
        assert "user.comment" in attrs
        assert "user.author" in attrs

    def test_list_empty(self):
        """Test listing attributes for file with none."""
        xattr = ExtendedAttributes()
        attrs = xattr.list("/nonexistent")
        assert attrs == []

    def test_remove(self):
        """Test removing an attribute."""
        xattr = ExtendedAttributes()

        xattr.set("/file", "user.comment", b"test")
        removed = xattr.remove("/file", "user.comment")

        assert removed is True
        assert xattr.get("/file", "user.comment") is None

    def test_remove_nonexistent(self):
        """Test removing nonexistent attribute."""
        xattr = ExtendedAttributes()
        removed = xattr.remove("/file", "user.comment")
        assert removed is False

    def test_get_all(self):
        """Test getting all attributes."""
        xattr = ExtendedAttributes()

        xattr.set("/file", "user.comment", b"test")
        xattr.set("/file", "user.author", b"me")

        all_attrs = xattr.get_all("/file")
        assert len(all_attrs) == 2

    def test_copy(self):
        """Test copying attributes."""
        xattr = ExtendedAttributes()

        xattr.set("/src", "user.comment", b"test")
        xattr.copy("/src", "/dst")

        dst_attrs = xattr.list("/dst")
        assert "user.comment" in dst_attrs

    def test_get_stats(self):
        """Test getting statistics."""
        xattr = ExtendedAttributes()

        xattr.set("/file1", "user.comment", b"test")
        xattr.set("/file2", "user.author", b"me")

        stats = xattr.get_stats()
        assert stats["total_files"] == 2
        assert stats["total_attributes"] == 2


# ============================================================================
# Test SymbolicLinkManager
# ============================================================================

class TestSymbolicLinkManager:
    """Tests for SymbolicLinkManager class."""

    def test_init(self):
        """Test initialization."""
        manager = SymbolicLinkManager()
        assert len(manager.symlinks) == 0

    def test_create_read(self):
        """Test creating and reading symlink."""
        manager = SymbolicLinkManager()

        manager.create("/link", "/target")
        target = manager.read("/link")

        assert target == "/target"

    def test_create_duplicate(self):
        """Test creating duplicate symlink."""
        manager = SymbolicLinkManager()

        manager.create("/link", "/target")
        success = manager.create("/link", "/other")

        assert success is False

    def test_remove(self):
        """Test removing symlink."""
        manager = SymbolicLinkManager()

        manager.create("/link", "/target")
        removed = manager.remove("/link")

        assert removed is True
        assert manager.exists("/link") is False

    def test_remove_nonexistent(self):
        """Test removing nonexistent symlink."""
        manager = SymbolicLinkManager()
        removed = manager.remove("/nonexistent")
        assert removed is False

    def test_resolve(self):
        """Test resolving symlink path."""
        manager = SymbolicLinkManager()

        manager.create("/link", "/target")
        resolved = manager.resolve("/link")

        assert resolved == "/target"

    def test_resolve_chain(self):
        """Test resolving symlink chain."""
        manager = SymbolicLinkManager()

        manager.create("/link1", "/link2")
        manager.create("/link2", "/target")

        resolved = manager.resolve("/link1")
        assert resolved == "/target"

    def test_resolve_max_depth(self):
        """Test resolving with max depth exceeded."""
        manager = SymbolicLinkManager()

        # Create circular links
        manager.create("/a", "/b")
        manager.create("/b", "/a")

        with pytest.raises(RuntimeError, match="loop"):
            manager.resolve("/a", max_depth=10)

    def test_list_all(self):
        """Test listing all symlinks."""
        manager = SymbolicLinkManager()

        manager.create("/link1", "/target1")
        manager.create("/link2", "/target2")

        links = manager.list_all()
        assert len(links) == 2

    def test_find_broken(self):
        """Test finding broken symlinks."""
        manager = SymbolicLinkManager()

        manager.create("/good", "/exists")
        manager.create("/broken", "/nonexistent")

        exists_func = lambda p: p == "/exists"
        broken = manager.find_broken(exists_func)

        assert "/broken" in broken
        assert "/good" not in broken

    def test_get_stats(self):
        """Test getting statistics."""
        manager = SymbolicLinkManager()

        manager.create("/link1", "/target1")
        manager.create("/link2", "/target2")

        stats = manager.get_stats()
        assert stats["total_symlinks"] == 2


# ============================================================================
# Test HardLinkManager
# ============================================================================

class TestHardLinkManager:
    """Tests for HardLinkManager class."""

    def test_init(self):
        """Test initialization."""
        manager = HardLinkManager()
        assert len(manager.inode_paths) == 0
        assert len(manager.path_inode) == 0

    def test_create(self):
        """Test creating hardlink."""
        manager = HardLinkManager()

        success, count = manager.create("/file1", "/file2")

        assert success is True
        assert count == 2

    def test_get_inode(self):
        """Test getting inode number."""
        manager = HardLinkManager()

        manager.create("/file1", "/file2")
        inode1 = manager.get_inode("/file1")
        inode2 = manager.get_inode("/file2")

        assert inode1 == inode2
        assert inode1 is not None

    def test_get_link_count(self):
        """Test getting link count."""
        manager = HardLinkManager()

        manager.create("/file1", "/file2")
        manager.create("/file1", "/file3")

        count = manager.get_link_count("/file1")
        assert count == 3

    def test_get_paths_for_inode(self):
        """Test getting paths for inode."""
        manager = HardLinkManager()

        manager.create("/file1", "/file2")
        manager.create("/file1", "/file3")

        inode = manager.get_inode("/file1")
        paths = manager.get_paths_for_inode(inode)

        assert len(paths) == 3
        assert "/file1" in paths

    def test_remove(self):
        """Test removing hardlink."""
        manager = HardLinkManager()

        manager.create("/file1", "/file2")
        success, remaining = manager.remove("/file2")

        assert success is True
        assert remaining == 1

    def test_remove_nonexistent(self):
        """Test removing nonexistent link."""
        manager = HardLinkManager()
        success, remaining = manager.remove("/nonexistent")

        assert success is False
        assert remaining == 0

    def test_is_hardlinked(self):
        """Test checking if paths are hardlinked."""
        manager = HardLinkManager()

        manager.create("/file1", "/file2")

        assert manager.is_hardlinked("/file1", "/file2") is True
        assert manager.is_hardlinked("/file1", "/other") is False

    def test_get_stats(self):
        """Test getting statistics."""
        manager = HardLinkManager()

        manager.create("/file1", "/file2")
        manager.create("/file1", "/file3")

        stats = manager.get_stats()
        assert stats["total_inodes"] == 1
        assert stats["total_links"] == 3


# ============================================================================
# Test FileLockManager
# ============================================================================

class TestFileLockManager:
    """Tests for FileLockManager class."""

    def test_init(self):
        """Test initialization."""
        manager = FileLockManager()
        assert len(manager.locks) == 0

    def test_acquire_exclusive(self):
        """Test acquiring exclusive lock."""
        manager = FileLockManager()

        success, msg = manager.acquire(
            "/file", LockType.EXCLUSIVE, 1234
        )

        assert success is True
        assert "acquired" in msg.lower()

    def test_acquire_shared(self):
        """Test acquiring shared lock."""
        manager = FileLockManager()

        success, msg = manager.acquire(
            "/file", LockType.SHARED, 1234
        )

        assert success is True

    def test_acquire_conflict(self):
        """Test conflicting lock acquisition."""
        manager = FileLockManager()

        # First lock
        manager.acquire("/file", LockType.EXCLUSIVE, 1234)

        # Conflicting lock
        success, msg = manager.acquire(
            "/file", LockType.SHARED, 5678, blocking=False
        )

        assert success is False

    def test_acquire_same_owner(self):
        """Test same owner can re-lock."""
        manager = FileLockManager()

        manager.acquire("/file", LockType.SHARED, 1234)
        success, msg = manager.acquire(
            "/file", LockType.EXCLUSIVE, 1234
        )

        assert success is True

    def test_release(self):
        """Test releasing lock."""
        manager = FileLockManager()

        manager.acquire("/file", LockType.EXCLUSIVE, 1234)
        success, msg = manager.acquire("/file", LockType.UNLOCK, 1234)

        assert success is True

    def test_release_all(self):
        """Test releasing all locks for PID."""
        manager = FileLockManager()

        manager.acquire("/file1", LockType.EXCLUSIVE, 1234)
        manager.acquire("/file2", LockType.EXCLUSIVE, 1234)

        count = manager.release_all(1234)

        assert count == 2

    def test_get_locks(self):
        """Test getting locks for path."""
        manager = FileLockManager()

        manager.acquire("/file", LockType.EXCLUSIVE, 1234)
        locks = manager.get_locks("/file")

        assert len(locks) == 1
        assert locks[0].owner_pid == 1234

    def test_is_locked(self):
        """Test checking if path is locked."""
        manager = FileLockManager()

        assert manager.is_locked("/file") is False

        manager.acquire("/file", LockType.EXCLUSIVE, 1234)
        assert manager.is_locked("/file") is True

    def test_get_stats(self):
        """Test getting statistics."""
        manager = FileLockManager()

        manager.acquire("/file1", LockType.EXCLUSIVE, 1234)
        manager.acquire("/file2", LockType.SHARED, 1234)

        stats = manager.get_stats()
        assert stats["total_locks"] == 2
        assert stats["exclusive_locks"] == 1
        assert stats["shared_locks"] == 1

    def test_range_overlap(self):
        """Test range overlap detection."""
        manager = FileLockManager()

        # Test overlapping ranges
        assert manager._ranges_overlap(0, 100, 50, 100) is True
        assert manager._ranges_overlap(0, 100, 100, 100) is False
        assert manager._ranges_overlap(0, 0, 0, 0) is True  # Both to EOF


# ============================================================================
# Test DirectoryNotifier
# ============================================================================

class TestDirectoryNotifier:
    """Tests for DirectoryNotifier class."""

    def test_init(self):
        """Test initialization."""
        notifier = DirectoryNotifier()
        assert len(notifier.events) == 0
        assert len(notifier.watchers) == 0

    def test_add_watch(self):
        """Test adding a watch."""
        notifier = DirectoryNotifier()

        notifier.add_watch("/dir", 1234)
        watchers = notifier.get_watchers("/dir")

        assert 1234 in watchers

    def test_remove_watch(self):
        """Test removing a watch."""
        notifier = DirectoryNotifier()

        notifier.add_watch("/dir", 1234)
        removed = notifier.remove_watch("/dir", 1234)

        assert removed is True
        assert 1234 not in notifier.get_watchers("/dir")

    def test_remove_nonexistent_watch(self):
        """Test removing nonexistent watch."""
        notifier = DirectoryNotifier()
        removed = notifier.remove_watch("/dir", 1234)
        assert removed is False

    def test_notify(self):
        """Test sending notification."""
        notifier = DirectoryNotifier()

        notifier.add_watch("/dir", 1234)
        count = notifier.notify("/dir", NotificationType.CREATE, "file.txt")

        assert count == 1

    def test_notify_no_watchers(self):
        """Test notification with no watchers."""
        notifier = DirectoryNotifier()

        count = notifier.notify("/dir", NotificationType.CREATE, "file.txt")

        assert count == 0

    def test_get_events(self):
        """Test getting events."""
        notifier = DirectoryNotifier()

        notifier.notify("/dir", NotificationType.CREATE, "file.txt")
        notifier.notify("/dir", NotificationType.MODIFY, "file.txt")

        events = notifier.get_events("/dir")
        assert len(events) == 2

    def test_get_events_filtered(self):
        """Test getting events filtered by time."""
        notifier = DirectoryNotifier()

        notifier.notify("/dir", NotificationType.CREATE, "file.txt")
        time.sleep(0.01)

        since = datetime.now()
        notifier.notify("/dir", NotificationType.MODIFY, "file.txt")

        events = notifier.get_events("/dir", since=since)
        assert len(events) == 1
        assert events[0].event_type == NotificationType.MODIFY

    def test_clear_events(self):
        """Test clearing events."""
        notifier = DirectoryNotifier()

        notifier.notify("/dir", NotificationType.CREATE, "file.txt")
        count = notifier.clear_events("/dir")

        assert count == 1
        assert len(notifier.get_events("/dir")) == 0

    def test_get_stats(self):
        """Test getting statistics."""
        notifier = DirectoryNotifier()

        notifier.add_watch("/dir1", 1234)
        notifier.add_watch("/dir2", 5678)
        notifier.notify("/dir1", NotificationType.CREATE, "file.txt")

        stats = notifier.get_stats()
        assert stats["watched_paths"] == 2
        assert stats["stored_events"] == 1


# ============================================================================
# Test POSIXACLManager
# ============================================================================

class TestPOSIXACLManager:
    """Tests for POSIXACLManager class."""

    def test_init(self):
        """Test initialization."""
        manager = POSIXACLManager()
        assert len(manager.acls) == 0

    def test_set_acl(self):
        """Test setting ACL."""
        manager = POSIXACLManager()

        entries = [
            ACLEntry(ACLType.USER, 1000, 6),
            ACLEntry(ACLType.GROUP, 100, 4),
        ]

        manager.set_acl("/file", entries)
        acl = manager.get_acl("/file")

        assert len(acl) == 2

    def test_add_entry(self):
        """Test adding ACL entry."""
        manager = POSIXACLManager()

        entry = ACLEntry(ACLType.USER, 1000, 6)
        manager.add_entry("/file", entry)

        acl = manager.get_acl("/file")
        assert len(acl) == 1

    def test_remove_entry(self):
        """Test removing ACL entry."""
        manager = POSIXACLManager()

        manager.set_acl("/file", [
            ACLEntry(ACLType.USER, 1000, 6),
            ACLEntry(ACLType.GROUP, 100, 4),
        ])

        removed = manager.remove_entry("/file", ACLType.USER, 1000)
        assert removed is True

        acl = manager.get_acl("/file")
        assert len(acl) == 1

    def test_remove_entry_nonexistent(self):
        """Test removing nonexistent ACL entry."""
        manager = POSIXACLManager()
        removed = manager.remove_entry("/file", ACLType.USER, 1000)
        assert removed is False

    def test_check_permission_granted(self):
        """Test permission check when granted."""
        manager = POSIXACLManager()

        manager.set_acl("/file", [
            ACLEntry(ACLType.USER, 1000, 6),  # rw
        ])

        can_read = manager.check_permission("/file", 1000, 100, Permission.READ)
        assert can_read is True

    def test_check_permission_denied(self):
        """Test permission check when denied."""
        manager = POSIXACLManager()

        manager.set_acl("/file", [
            ACLEntry(ACLType.USER, 1000, 4),  # r only
        ])

        can_write = manager.check_permission("/file", 1000, 100, Permission.WRITE)
        assert can_write is False

    def test_check_permission_no_acl(self):
        """Test permission check with no ACL."""
        manager = POSIXACLManager()

        can_read = manager.check_permission("/file", 1000, 100, Permission.READ)
        assert can_read is True  # Falls back to default (allowed)

    def test_get_mask(self):
        """Test getting mask."""
        manager = POSIXACLManager()

        manager.set_acl("/file", [
            ACLEntry(ACLType.USER, 1000, 6),
            ACLEntry(ACLType.MASK, None, 4),
        ])

        mask = manager.get_mask("/file")
        assert mask == 4

    def test_get_mask_default(self):
        """Test getting default mask when none set."""
        manager = POSIXACLManager()

        mask = manager.get_mask("/file")
        assert mask == 7  # Default rwx

    def test_calc_mask(self):
        """Test calculating mask."""
        manager = POSIXACLManager()

        manager.set_acl("/file", [
            ACLEntry(ACLType.USER, 1000, 6),  # rw
            ACLEntry(ACLType.GROUP, 100, 4),  # r
        ])

        mask = manager.calc_mask("/file")
        assert mask == 6  # Union of rw and r = rw

    def test_remove_acl(self):
        """Test removing entire ACL."""
        manager = POSIXACLManager()

        manager.set_acl("/file", [
            ACLEntry(ACLType.USER, 1000, 6),
        ])

        removed = manager.remove_acl("/file")
        assert removed is True
        assert len(manager.get_acl("/file")) == 0

    def test_get_stats(self):
        """Test getting statistics."""
        manager = POSIXACLManager()

        manager.set_acl("/file1", [ACLEntry(ACLType.USER, 1000, 6)])
        manager.set_acl("/file2", [ACLEntry(ACLType.USER, 1001, 4)])

        stats = manager.get_stats()
        assert stats["files_with_acl"] == 2
        assert stats["total_entries"] == 2


# ============================================================================
# Test POSIXComplianceTester
# ============================================================================

class TestPOSIXComplianceTester:
    """Tests for POSIXComplianceTester class."""

    def test_init(self):
        """Test initialization."""
        tester = POSIXComplianceTester()
        assert len(tester.test_results) == 0

    def test_run_all_tests(self):
        """Test running all compliance tests."""
        tester = POSIXComplianceTester()
        results = tester.run_all_tests()

        assert "passed" in results
        assert "failed" in results
        assert "total" in results
        assert "compliance_score" in results
        assert "tests" in results

    def test_compliance_score(self):
        """Test compliance score calculation."""
        tester = POSIXComplianceTester()
        results = tester.run_all_tests()

        # Should have a valid score
        assert 0 <= results["compliance_score"] <= 100

    def test_test_count(self):
        """Test that multiple tests are run."""
        tester = POSIXComplianceTester()
        results = tester.run_all_tests()

        # Should have multiple tests
        assert results["total"] >= 10


# ============================================================================
# Test FUSEAdvancedFeatures
# ============================================================================

class TestFUSEAdvancedFeatures:
    """Tests for FUSEAdvancedFeatures class."""

    def test_init(self):
        """Test initialization."""
        fuse = FUSEAdvancedFeatures()

        assert fuse.xattr is not None
        assert fuse.symlinks is not None
        assert fuse.hardlinks is not None
        assert fuse.locks is not None
        assert fuse.notifier is not None
        assert fuse.acls is not None
        assert fuse.compliance is not None

    def test_get_stats(self):
        """Test getting statistics."""
        fuse = FUSEAdvancedFeatures()
        stats = fuse.get_stats()

        assert "xattr" in stats
        assert "symlinks" in stats
        assert "hardlinks" in stats
        assert "locks" in stats
        assert "notifications" in stats
        assert "acls" in stats

    def test_run_compliance_test(self):
        """Test running compliance test."""
        fuse = FUSEAdvancedFeatures()
        results = fuse.run_compliance_test()

        assert "compliance_score" in results
        assert results["total"] > 0


# ============================================================================
# Integration Tests
# ============================================================================

class TestIntegration:
    """Integration tests for FUSE advanced features."""

    def test_full_xattr_workflow(self):
        """Test full xattr workflow."""
        xattr = ExtendedAttributes()

        # Set multiple attributes
        xattr.set("/file", "user.comment", b"test file")
        xattr.set("/file", "user.author", b"tester")
        xattr.set("/file", "security.label", b"public")

        # List
        attrs = xattr.list("/file")
        assert len(attrs) == 3

        # Get
        assert xattr.get("/file", "user.comment") == b"test file"

        # Remove
        xattr.remove("/file", "user.author")
        assert len(xattr.list("/file")) == 2

    def test_full_link_workflow(self):
        """Test full link workflow."""
        symlinks = SymbolicLinkManager()
        hardlinks = HardLinkManager()

        # Create symlink
        symlinks.create("/link", "/target")
        assert symlinks.resolve("/link") == "/target"

        # Create hardlinks
        hardlinks.create("/original", "/copy1")
        hardlinks.create("/original", "/copy2")

        assert hardlinks.get_link_count("/original") == 3
        assert hardlinks.is_hardlinked("/copy1", "/copy2")

    def test_full_lock_workflow(self):
        """Test full lock workflow."""
        locks = FileLockManager()

        # Acquire exclusive
        success, _ = locks.acquire("/file", LockType.EXCLUSIVE, 1234)
        assert success

        # Conflicting lock fails
        success, _ = locks.acquire("/file", LockType.SHARED, 5678, blocking=False)
        assert not success

        # Release
        locks.release_all(1234)
        assert not locks.is_locked("/file")

    def test_full_acl_workflow(self):
        """Test full ACL workflow."""
        acls = POSIXACLManager()

        # Set up ACL
        entries = [
            ACLEntry(ACLType.USER, 1000, 7),   # owner: rwx
            ACLEntry(ACLType.GROUP, 100, 5),   # group: r-x
            ACLEntry(ACLType.OTHER, None, 0),  # other: ---
        ]
        acls.set_acl("/secure", entries)

        # Check permissions
        assert acls.check_permission("/secure", 1000, 100, Permission.WRITE)
        assert acls.check_permission("/secure", 2000, 100, Permission.READ)
        assert not acls.check_permission("/secure", 2000, 200, Permission.READ)

    def test_full_notification_workflow(self):
        """Test full notification workflow."""
        notifier = DirectoryNotifier()

        # Set up watchers
        notifier.add_watch("/dir", 1234)
        notifier.add_watch("/dir", 5678)

        # Send notifications
        count = notifier.notify("/dir", NotificationType.CREATE, "file.txt")
        assert count == 2

        notifier.notify("/dir", NotificationType.MODIFY, "file.txt")

        # Get events
        events = notifier.get_events("/dir")
        assert len(events) == 2


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
