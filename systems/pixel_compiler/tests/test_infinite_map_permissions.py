#!/usr/bin/env python3
"""
Tests for Infinite Map Permissions and ACL System.

Comprehensive test coverage for:
- PermissionEntry (Unix permissions, symbolic notation)
- ACLEntry and ACL (access control lists)
- FileOwnership and FileSecurityInfo
- PermissionStore (persistence)
- PermissionManager (access checking, chmod, chown)

Run with:
    PYTHONPATH=. pytest systems/pixel_compiler/tests/test_infinite_map_permissions.py -v
"""

import os
import sys
import json
import tempfile
import threading
from pathlib import Path
from datetime import datetime
from unittest.mock import Mock

import pytest

# Add parent to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.pixel_compiler.infinite_map_permissions import (
    PermissionFlag,
    ACLTag,
    AccessType,
    PermissionEntry,
    ACLEntry,
    ACL,
    FileOwnership,
    FileSecurityInfo,
    PermissionStore,
    PermissionManager,
    chmod,
    chown,
    check_access,
)


class TestPermissionFlag:
    """Tests for PermissionFlag enum."""

    def test_permission_values(self):
        """Test permission flag values."""
        assert PermissionFlag.READ == 4
        assert PermissionFlag.WRITE == 2
        assert PermissionFlag.EXECUTE == 1
        assert PermissionFlag.ALL == 7

    def test_permission_combination(self):
        """Test combining permission flags."""
        rw = PermissionFlag.READ | PermissionFlag.WRITE
        assert rw == 6

        rwx = PermissionFlag.READ | PermissionFlag.WRITE | PermissionFlag.EXECUTE
        assert rwx == PermissionFlag.ALL


class TestACLTag:
    """Tests for ACLTag enum."""

    def test_tag_values(self):
        """Test ACL tag values."""
        assert ACLTag.USER_OBJ.value == "user_obj"
        assert ACLTag.USER.value == "user"
        assert ACLTag.GROUP_OBJ.value == "group_obj"
        assert ACLTag.GROUP.value == "group"
        assert ACLTag.MASK.value == "mask"
        assert ACLTag.OTHER.value == "other"


class TestAccessType:
    """Tests for AccessType enum."""

    def test_access_values(self):
        """Test access type values."""
        assert AccessType.READ == 4
        assert AccessType.WRITE == 2
        assert AccessType.EXECUTE == 1


class TestPermissionEntry:
    """Tests for PermissionEntry dataclass."""

    def test_create_entry(self):
        """Test creating permission entry."""
        perm = PermissionEntry(owner=7, group=5, other=0)
        assert perm.owner == 7
        assert perm.group == 5
        assert perm.other == 0

    def test_from_mode(self):
        """Test creating from Unix mode."""
        perm = PermissionEntry.from_mode(0o755)

        assert perm.owner == 7  # rwx
        assert perm.group == 5  # r-x
        assert perm.other == 5  # r-x

    def test_from_mode_644(self):
        """Test creating from mode 644."""
        perm = PermissionEntry.from_mode(0o644)

        assert perm.owner == 6  # rw-
        assert perm.group == 4  # r--
        assert perm.other == 4  # r--

    def test_to_mode(self):
        """Test converting to Unix mode."""
        perm = PermissionEntry(owner=7, group=5, other=1)
        mode = perm.to_mode()

        assert mode == 0o751

    def test_roundtrip(self):
        """Test mode roundtrip."""
        original = 0o644
        perm = PermissionEntry.from_mode(original)
        assert perm.to_mode() == original

    def test_to_symbolic(self):
        """Test converting to symbolic notation."""
        perm = PermissionEntry(owner=7, group=5, other=1)
        symbolic = perm.to_symbolic()

        assert symbolic == "rwxr-x--x"

    def test_from_symbolic(self):
        """Test creating from symbolic notation."""
        perm = PermissionEntry.from_symbolic("rwxr-xr-x")

        assert perm.owner == 7
        assert perm.group == 5
        assert perm.other == 5

    def test_symbolic_roundtrip(self):
        """Test symbolic notation roundtrip."""
        original = "rw-r--r--"
        perm = PermissionEntry.from_symbolic(original)
        assert perm.to_symbolic() == original

    def test_special_bits(self):
        """Test setuid, setgid, sticky bits."""
        perm = PermissionEntry(
            owner=7, group=5, other=5,
            setuid=True, setgid=True, sticky=True
        )

        # Symbolic should show special bits
        symbolic = perm.to_symbolic()
        assert 's' in symbolic  # setuid/setgid
        assert 't' in symbolic  # sticky

    def test_serialization(self):
        """Test serialization to dict."""
        perm = PermissionEntry(owner=7, group=4, other=0)
        data = perm.to_dict()

        assert data["owner"] == 7
        assert data["group"] == 4
        assert data["other"] == 0
        assert data["mode"] == 0o740

    def test_deserialization(self):
        """Test creating from dict."""
        data = {"owner": 6, "group": 4, "other": 4}
        perm = PermissionEntry.from_dict(data)

        assert perm.owner == 6
        assert perm.group == 4
        assert perm.other == 4


class TestACLEntry:
    """Tests for ACLEntry dataclass."""

    def test_create_user_entry(self):
        """Test creating user ACL entry."""
        entry = ACLEntry(
            tag=ACLTag.USER,
            qualifier="alice",
            permissions=7
        )
        assert entry.tag == ACLTag.USER
        assert entry.qualifier == "alice"
        assert entry.permissions == 7

    def test_create_group_entry(self):
        """Test creating group ACL entry."""
        entry = ACLEntry(
            tag=ACLTag.GROUP,
            qualifier="developers",
            permissions=5
        )
        assert entry.tag == ACLTag.GROUP

    def test_matches(self):
        """Test entry matching."""
        entry = ACLEntry(ACLTag.USER, "alice", 7)

        assert entry.matches(ACLTag.USER, "alice")
        assert not entry.matches(ACLTag.USER, "bob")
        assert not entry.matches(ACLTag.GROUP, "alice")

    def test_serialization(self):
        """Test serialization to dict."""
        entry = ACLEntry(ACLTag.USER, "alice", 6)
        data = entry.to_dict()

        assert data["tag"] == "user"
        assert data["qualifier"] == "alice"
        assert data["permissions"] == 6


class TestACL:
    """Tests for ACL class."""

    def test_create_acl(self):
        """Test creating an ACL."""
        acl = ACL()
        assert len(acl.entries) == 0

    def test_add_entry(self):
        """Test adding entries."""
        acl = ACL()
        entry = ACLEntry(ACLTag.USER, "alice", 7)

        result = acl.add_entry(entry)
        assert result is True
        assert len(acl.entries) == 1

    def test_add_duplicate(self):
        """Test adding duplicate entry fails."""
        acl = ACL()
        acl.add_entry(ACLEntry(ACLTag.USER, "alice", 7))

        result = acl.add_entry(ACLEntry(ACLTag.USER, "alice", 5))
        assert result is False
        assert len(acl.entries) == 1

    def test_remove_entry(self):
        """Test removing entries."""
        acl = ACL()
        acl.add_entry(ACLEntry(ACLTag.USER, "alice", 7))

        result = acl.remove_entry(ACLTag.USER, "alice")
        assert result is True
        assert len(acl.entries) == 0

    def test_remove_nonexistent(self):
        """Test removing nonexistent entry."""
        acl = ACL()
        result = acl.remove_entry(ACLTag.USER, "alice")
        assert result is False

    def test_get_entry(self):
        """Test getting specific entry."""
        acl = ACL()
        acl.add_entry(ACLEntry(ACLTag.USER, "alice", 7))
        acl.add_entry(ACLEntry(ACLTag.USER, "bob", 5))

        entry = acl.get_entry(ACLTag.USER, "alice")
        assert entry is not None
        assert entry.permissions == 7

    def test_get_entries_by_tag(self):
        """Test getting entries by tag."""
        acl = ACL()
        acl.add_entry(ACLEntry(ACLTag.USER, "alice", 7))
        acl.add_entry(ACLEntry(ACLTag.USER, "bob", 5))
        acl.add_entry(ACLEntry(ACLTag.GROUP, "devs", 6))

        user_entries = acl.get_entries_by_tag(ACLTag.USER)
        assert len(user_entries) == 2

    def test_get_mask(self):
        """Test getting permission mask."""
        acl = ACL()
        acl.add_entry(ACLEntry(ACLTag.MASK, None, 5))

        mask = acl.get_mask()
        assert mask == 5

    def test_get_mask_from_group(self):
        """Test getting mask from group_obj when no mask."""
        acl = ACL()
        acl.add_entry(ACLEntry(ACLTag.GROUP_OBJ, None, 6))

        mask = acl.get_mask()
        assert mask == 6

    def test_from_permission_entry(self):
        """Test creating ACL from permission entry."""
        perm = PermissionEntry(owner=7, group=5, other=0)
        acl = ACL.from_permission_entry(perm)

        assert len(acl.entries) == 3
        assert acl.get_entry(ACLTag.USER_OBJ).permissions == 7
        assert acl.get_entry(ACLTag.GROUP_OBJ).permissions == 5
        assert acl.get_entry(ACLTag.OTHER).permissions == 0

    def test_serialization(self):
        """Test ACL serialization."""
        acl = ACL()
        acl.add_entry(ACLEntry(ACLTag.USER, "alice", 7))
        data = acl.to_dict()

        assert len(data["entries"]) == 1

        restored = ACL.from_dict(data)
        assert len(restored.entries) == 1


class TestFileOwnership:
    """Tests for FileOwnership dataclass."""

    def test_create_ownership(self):
        """Test creating ownership info."""
        ownership = FileOwnership(owner="alice", group="developers")
        assert ownership.owner == "alice"
        assert ownership.group == "developers"

    def test_serialization(self):
        """Test ownership serialization."""
        ownership = FileOwnership(owner="bob", group="users", owner_id=1000)
        data = ownership.to_dict()

        assert data["owner"] == "bob"
        assert data["group"] == "users"
        assert data["owner_id"] == 1000


class TestFileSecurityInfo:
    """Tests for FileSecurityInfo dataclass."""

    def test_create_security_info(self):
        """Test creating security info."""
        info = FileSecurityInfo(
            path="/file",
            ownership=FileOwnership(owner="alice", group="users"),
            permissions=PermissionEntry.from_mode(0o644)
        )
        assert info.path == "/file"
        assert info.acl is None

    def test_serialization(self):
        """Test security info serialization."""
        info = FileSecurityInfo(
            path="/file",
            ownership=FileOwnership(owner="alice", group="users"),
            permissions=PermissionEntry(owner=6, group=4, other=4),
            acl=ACL.from_permission_entry(PermissionEntry(owner=6, group=4, other=4))
        )
        data = info.to_dict()

        assert data["path"] == "/file"
        assert data["acl"] is not None


class TestPermissionStore:
    """Tests for PermissionStore class."""

    @pytest.fixture
    def temp_store(self):
        """Create a temporary permission store."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            store_path = f.name
        store = PermissionStore(store_path)
        yield store
        os.unlink(store_path)
        tmp_path = Path(store_path).with_suffix(".tmp")
        if tmp_path.exists():
            os.unlink(tmp_path)

    def test_create_store(self, temp_store):
        """Test creating a permission store."""
        assert temp_store.security_info == {}

    def test_set_and_get(self, temp_store):
        """Test setting and getting security info."""
        info = {
            "ownership": {"owner": "alice", "group": "users"},
            "permissions": {"owner": 6, "group": 4, "other": 4},
            "acl": None
        }
        temp_store.set_security_info("/file", info)

        result = temp_store.get_security_info("/file")
        assert result == info

    def test_get_nonexistent(self, temp_store):
        """Test getting nonexistent file."""
        result = temp_store.get_security_info("/nonexistent")
        assert result is None

    def test_remove(self, temp_store):
        """Test removing security info."""
        info = {
            "ownership": {"owner": "alice", "group": "users"},
            "permissions": {"owner": 6, "group": 4, "other": 4}
        }
        temp_store.set_security_info("/file", info)
        result = temp_store.remove_security_info("/file")

        assert result is True
        assert temp_store.get_security_info("/file") is None

    def test_persistence(self, temp_store):
        """Test that permissions persist."""
        info = {
            "ownership": {"owner": "alice", "group": "users"},
            "permissions": {"owner": 7, "group": 5, "other": 0}
        }
        temp_store.set_security_info("/file", info)

        # Create new store from same file
        new_store = PermissionStore(temp_store.store_path)
        result = new_store.get_security_info("/file")

        assert result["ownership"]["owner"] == "alice"

    def test_get_stats(self, temp_store):
        """Test getting statistics."""
        info = {
            "ownership": {"owner": "alice", "group": "users"},
            "permissions": {"owner": 6, "group": 4, "other": 4},
            "acl": {"entries": [{"tag": "user", "qualifier": "bob", "permissions": 7}]}
        }
        temp_store.set_security_info("/file1", info)
        temp_store.set_security_info("/file2", {
            "ownership": {"owner": "bob", "group": "users"},
            "permissions": {"owner": 6, "group": 4, "other": 4}
        })

        stats = temp_store.get_stats()
        assert stats["total_files"] == 2
        assert stats["files_with_acl"] == 1


class TestPermissionManager:
    """Tests for PermissionManager class."""

    @pytest.fixture
    def temp_store_path(self):
        """Create a temporary store path."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            yield f.name
        os.unlink(f.name)

    @pytest.fixture
    def manager(self, temp_store_path):
        """Create a permission manager."""
        return PermissionManager(None, temp_store_path)

    def test_create_manager(self, manager):
        """Test creating a permission manager."""
        assert manager.store is not None

    def test_initialize_file(self, manager):
        """Test initializing file security info."""
        info = manager.initialize_file("/file", owner="alice", group="users", mode=0o644)

        assert info.ownership.owner == "alice"
        assert info.permissions.owner == 6

    def test_set_permissions(self, manager):
        """Test setting permissions."""
        manager.initialize_file("/file")
        result = manager.set_permissions("/file", 0o755)

        assert result is True
        assert manager.get_permissions("/file") == 0o755

    def test_chmod(self, manager):
        """Test chmod operation."""
        success, msg = manager.chmod("/file", 0o644)

        assert success is True
        assert manager.get_permissions("/file") == 0o644

    def test_chown(self, manager):
        """Test chown operation."""
        manager.initialize_file("/file")
        success, msg = manager.chown("/file", "bob", "developers")

        assert success is True
        info = manager.get_security_info("/file")
        assert info.ownership.owner == "bob"
        assert info.ownership.group == "developers"

    def test_check_access_owner(self, manager):
        """Test access check for owner."""
        manager.initialize_file("/file", owner="alice", mode=0o755)

        # Owner should have full access
        assert manager.check_access("/file", "alice", [], "read") is True
        assert manager.check_access("/file", "alice", [], "write") is True
        assert manager.check_access("/file", "alice", [], "execute") is True

    def test_check_access_other(self, manager):
        """Test access check for other users."""
        manager.initialize_file("/file", owner="alice", group="users", mode=0o644)

        # Other should have only read
        assert manager.check_access("/file", "bob", ["other"], "read") is True
        assert manager.check_access("/file", "bob", ["other"], "write") is False

    def test_check_access_group(self, manager):
        """Test access check for group members."""
        manager.initialize_file("/file", owner="alice", group="developers", mode=0o750)

        # Group member should have read and execute
        assert manager.check_access("/file", "bob", ["developers"], "read") is True
        assert manager.check_access("/file", "bob", ["developers"], "execute") is True
        assert manager.check_access("/file", "bob", ["developers"], "write") is False

    def test_check_access_no_info(self, manager):
        """Test access check for file without security info."""
        # Should allow access by default
        assert manager.check_access("/nonexistent", "bob", [], "read") is True

    def test_add_acl_entry(self, manager):
        """Test adding ACL entry."""
        manager.initialize_file("/file")
        success, msg = manager.add_acl_entry("/file", ACLTag.USER, "charlie", 7)

        assert success is True
        acl = manager.get_acl("/file")
        assert acl is not None
        assert acl.get_entry(ACLTag.USER, "charlie") is not None

    def test_remove_acl_entry(self, manager):
        """Test removing ACL entry."""
        manager.initialize_file("/file")
        manager.add_acl_entry("/file", ACLTag.USER, "charlie", 7)

        success, msg = manager.remove_acl_entry("/file", ACLTag.USER, "charlie")
        assert success is True

        acl = manager.get_acl("/file")
        assert acl.get_entry(ACLTag.USER, "charlie") is None

    def test_get_acl(self, manager):
        """Test getting ACL."""
        manager.initialize_file("/file", mode=0o755)
        # Add an ACL entry to enable ACL
        manager.add_acl_entry("/file", ACLTag.USER, "bob", 7)
        acl = manager.get_acl("/file")

        # ACL should now exist with entries
        assert acl is not None
        assert acl.get_entry(ACLTag.USER, "bob") is not None

    def test_clear_acl(self, manager):
        """Test clearing ACL."""
        manager.initialize_file("/file")
        manager.add_acl_entry("/file", ACLTag.USER, "charlie", 7)

        result = manager.clear_acl("/file")
        assert result is True
        assert manager.get_acl("/file") is None

    def test_copy_permissions(self, manager):
        """Test copying permissions."""
        manager.initialize_file("/src", owner="alice", mode=0o755)
        manager.initialize_file("/dst", owner="bob", mode=0o644)

        result = manager.copy_permissions("/src", "/dst")
        assert result is True

        dst_info = manager.get_security_info("/dst")
        assert dst_info.ownership.owner == "alice"
        assert dst_info.permissions.to_mode() == 0o755

    def test_list_files_by_owner(self, manager):
        """Test listing files by owner."""
        manager.initialize_file("/file1", owner="alice")
        manager.initialize_file("/file2", owner="alice")
        manager.initialize_file("/file3", owner="bob")

        files = manager.list_files_by_owner("alice")
        assert len(files) == 2

    def test_list_files_by_group(self, manager):
        """Test listing files by group."""
        manager.initialize_file("/file1", group="developers")
        manager.initialize_file("/file2", group="developers")
        manager.initialize_file("/file3", group="users")

        files = manager.list_files_by_group("developers")
        assert len(files) == 2


class TestConvenienceFunctions:
    """Tests for convenience functions."""

    def test_chmod(self):
        """Test chmod function."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            store_path = f.name

        try:
            manager = PermissionManager(None, store_path)
            manager.initialize_file("/file")

            result = chmod("/file", 0o755, store_path)
            assert result is True
        finally:
            os.unlink(store_path)

    def test_chown(self):
        """Test chown function."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            store_path = f.name

        try:
            manager = PermissionManager(None, store_path)
            manager.initialize_file("/file")

            result = chown("/file", "alice", "users", store_path)
            assert result is True
        finally:
            os.unlink(store_path)

    def test_check_access(self):
        """Test check_access function."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            store_path = f.name

        try:
            manager = PermissionManager(None, store_path)
            manager.initialize_file("/file", owner="alice", mode=0o755)

            result = check_access("/file", "alice", [], "read", store_path)
            assert result is True
        finally:
            os.unlink(store_path)


class TestIntegration:
    """Integration tests for the permissions system."""

    def test_full_workflow(self):
        """Test complete permission workflow."""
        with tempfile.TemporaryDirectory() as d:
            store_path = Path(d) / "permissions.json"
            manager = PermissionManager(None, str(store_path))

            # Initialize files
            manager.initialize_file("/project/src/file.py", owner="alice", group="developers", mode=0o755)
            manager.initialize_file("/project/docs/readme.md", owner="alice", group="users", mode=0o644)

            # Add ACL for specific user
            manager.add_acl_entry("/project/src/file.py", ACLTag.USER, "bob", 6)
            manager.add_acl_entry("/project/src/file.py", ACLTag.GROUP, "testers", 4)

            # Add mask
            manager.add_acl_entry("/project/src/file.py", ACLTag.MASK, None, 7)

            # Check access
            assert manager.check_access("/project/src/file.py", "alice", ["developers"], "read")
            assert manager.check_access("/project/src/file.py", "bob", ["users"], "read")
            assert manager.check_access("/project/src/file.py", "bob", ["users"], "write")

            # Change ownership
            manager.chown("/project/src/file.py", "charlie", None)

            # Get statistics
            stats = manager.get_stats()
            assert stats["total_files"] == 2


class TestEdgeCases:
    """Tests for edge cases and error handling."""

    def test_permission_entry_invalid_symbolic(self):
        """Test invalid symbolic notation."""
        with pytest.raises(ValueError):
            PermissionEntry.from_symbolic("rwx")  # Too short

    def test_check_access_string_access(self):
        """Test string access types."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            store_path = f.name

        try:
            manager = PermissionManager(None, store_path)
            manager.initialize_file("/file", owner="alice", mode=0o755)

            # Test various string formats as owner
            assert manager.check_access("/file", "alice", [], "r") is True
            assert manager.check_access("/file", "alice", [], "read") is True
            assert manager.check_access("/file", "alice", [], "w") is True
            assert manager.check_access("/file", "alice", [], "write") is True

            # Test as other user (other=5, so no write)
            assert manager.check_access("/file", "bob", [], "r") is True
            assert manager.check_access("/file", "bob", [], "w") is False
        finally:
            os.unlink(store_path)

    def test_default_permissions(self):
        """Test default permissions."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            store_path = f.name

        try:
            manager = PermissionManager(None, store_path, default_mode=0o644)
            info = manager.initialize_file("/file")

            assert info.permissions.to_mode() == 0o644
        finally:
            os.unlink(store_path)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
