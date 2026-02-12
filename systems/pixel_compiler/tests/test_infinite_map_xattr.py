#!/usr/bin/env python3
"""
Tests for Infinite Map Extended Attributes System.

Comprehensive test coverage for:
- XAttrEntry (serialization, namespaces)
- XAttrStore (CRUD operations, persistence)
- XAttrManager (validation, convenience methods)

Run with:
    PYTHONPATH=. pytest systems/pixel_compiler/tests/test_infinite_map_xattr.py -v
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

from systems.pixel_compiler.infinite_map_xattr import (
    XAttrNamespace,
    XAttrEntry,
    XAttrInfo,
    XAttrStore,
    XAttrManager,
    set_xattr,
    get_xattr,
    list_xattr,
    remove_xattr,
)


class TestXAttrNamespace:
    """Tests for XAttrNamespace enum."""

    def test_namespace_values(self):
        """Test all namespace values."""
        assert XAttrNamespace.USER.value == "user"
        assert XAttrNamespace.SYSTEM.value == "system"
        assert XAttrNamespace.SECURITY.value == "security"
        assert XAttrNamespace.TRUSTED.value == "trusted"


class TestXAttrEntry:
    """Tests for XAttrEntry dataclass."""

    def test_create_entry(self):
        """Test creating an xattr entry."""
        entry = XAttrEntry(
            name="comment",
            value=b"test value",
            namespace=XAttrNamespace.USER,
            created_at=datetime.now(),
            modified_at=datetime.now()
        )
        assert entry.name == "comment"
        assert entry.value == b"test value"
        assert entry.namespace == XAttrNamespace.USER

    def test_entry_serialization(self):
        """Test entry serialization to dict."""
        dt = datetime(2026, 2, 12, 12, 0, 0)
        entry = XAttrEntry(
            name="mime_type",
            value=b"text/plain",
            namespace=XAttrNamespace.USER,
            created_at=dt,
            modified_at=dt,
            flags=1
        )
        data = entry.to_dict()

        assert data["name"] == "mime_type"
        assert data["value"] == "746578742f706c61696e"  # hex of "text/plain"
        assert data["namespace"] == "user"
        assert data["flags"] == 1

    def test_entry_deserialization(self):
        """Test creating entry from dict."""
        data = {
            "name": "tags",
            "value": "696d706f7274616e74",  # hex of "important"
            "namespace": "user",
            "created_at": "2026-02-12T12:00:00",
            "modified_at": "2026-02-12T12:00:00",
            "flags": 0
        }
        entry = XAttrEntry.from_dict(data)

        assert entry.name == "tags"
        assert entry.value == b"important"
        assert entry.namespace == XAttrNamespace.USER

    def test_get_full_name(self):
        """Test getting full attribute name."""
        entry = XAttrEntry(
            name="comment",
            value=b"test",
            namespace=XAttrNamespace.USER,
            created_at=datetime.now(),
            modified_at=datetime.now()
        )
        assert entry.get_full_name() == "user.comment"

    def test_entry_with_binary_value(self):
        """Test entry with binary value."""
        binary_data = bytes([0, 1, 2, 255, 254])
        entry = XAttrEntry(
            name="binary",
            value=binary_data,
            namespace=XAttrNamespace.USER,
            created_at=datetime.now(),
            modified_at=datetime.now()
        )

        # Serialize and deserialize
        data = entry.to_dict()
        restored = XAttrEntry.from_dict(data)

        assert restored.value == binary_data


class TestXAttrInfo:
    """Tests for XAttrInfo dataclass."""

    def test_create_info(self):
        """Test creating xattr info."""
        info = XAttrInfo(
            path="/test/file",
            total_size=100,
            attribute_count=3,
            namespaces={XAttrNamespace.USER, XAttrNamespace.SYSTEM},
            attributes=["user.comment", "user.tags", "system.immutable"]
        )
        assert info.path == "/test/file"
        assert info.total_size == 100
        assert info.attribute_count == 3

    def test_info_serialization(self):
        """Test info serialization."""
        info = XAttrInfo(
            path="/file",
            total_size=50,
            attribute_count=2,
            namespaces={XAttrNamespace.USER},
            attributes=["user.comment", "user.mime_type"]
        )
        data = info.to_dict()

        assert data["path"] == "/file"
        assert data["total_size"] == 50
        assert "user" in data["namespaces"]


class TestXAttrStore:
    """Tests for XAttrStore class."""

    @pytest.fixture
    def temp_store(self):
        """Create a temporary xattr store."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            store_path = f.name
        store = XAttrStore(store_path)
        yield store
        os.unlink(store_path)
        tmp_path = Path(store_path).with_suffix(".tmp")
        if tmp_path.exists():
            os.unlink(tmp_path)

    def test_create_store(self, temp_store):
        """Test creating an xattr store."""
        assert temp_store.attributes == {}

    def test_parse_attr_name(self, temp_store):
        """Test parsing attribute names."""
        ns, name = temp_store.parse_attr_name("user.comment")
        assert ns == XAttrNamespace.USER
        assert name == "comment"

        ns, name = temp_store.parse_attr_name("system.immutable")
        assert ns == XAttrNamespace.SYSTEM
        assert name == "immutable"

        # No prefix defaults to user
        ns, name = temp_store.parse_attr_name("noprefix")
        assert ns == XAttrNamespace.USER
        assert name == "noprefix"

    def test_set_and_get(self, temp_store):
        """Test setting and getting attributes."""
        temp_store.set("/file", "user.comment", b"test comment")

        value = temp_store.get("/file", "user.comment")
        assert value == b"test comment"

    def test_get_nonexistent(self, temp_store):
        """Test getting nonexistent attribute."""
        value = temp_store.get("/file", "user.nonexistent")
        assert value is None

    def test_list_attributes(self, temp_store):
        """Test listing attributes."""
        temp_store.set("/file", "user.comment", b"comment")
        temp_store.set("/file", "user.mime_type", b"text/plain")

        attrs = temp_store.list("/file")
        assert len(attrs) == 2
        assert "user.comment" in attrs
        assert "user.mime_type" in attrs

    def test_list_with_namespace_filter(self, temp_store):
        """Test listing with namespace filter."""
        temp_store.set("/file", "user.comment", b"comment")
        temp_store.set("/file", "system.immutable", b"1")

        user_attrs = temp_store.list("/file", XAttrNamespace.USER)
        assert len(user_attrs) == 1
        assert "user.comment" in user_attrs

    def test_list_empty(self, temp_store):
        """Test listing attributes for file with none."""
        attrs = temp_store.list("/nonexistent")
        assert attrs == []

    def test_remove(self, temp_store):
        """Test removing attributes."""
        temp_store.set("/file", "user.comment", b"comment")
        result = temp_store.remove("/file", "user.comment")

        assert result is True
        assert temp_store.get("/file", "user.comment") is None

    def test_remove_nonexistent(self, temp_store):
        """Test removing nonexistent attribute."""
        result = temp_store.remove("/file", "user.nonexistent")
        assert result is False

    def test_remove_all(self, temp_store):
        """Test removing all attributes for a file."""
        temp_store.set("/file", "user.a", b"1")
        temp_store.set("/file", "user.b", b"2")
        temp_store.set("/file", "user.c", b"3")

        count = temp_store.remove_all("/file")
        assert count == 3
        assert temp_store.list("/file") == []

    def test_has_attributes(self, temp_store):
        """Test checking if file has attributes."""
        assert temp_store.has_attributes("/file") is False

        temp_store.set("/file", "user.comment", b"comment")
        assert temp_store.has_attributes("/file") is True

    def test_get_info(self, temp_store):
        """Test getting file attribute info."""
        temp_store.set("/file", "user.comment", b"test comment")
        temp_store.set("/file", "user.mime_type", b"text/plain")

        info = temp_store.get_info("/file")

        assert info.path == "/file"
        assert info.attribute_count == 2
        assert info.total_size == len(b"test comment") + len(b"text/plain")
        assert XAttrNamespace.USER in info.namespaces

    def test_get_info_empty(self, temp_store):
        """Test getting info for file with no attributes."""
        info = temp_store.get_info("/nonexistent")

        assert info.attribute_count == 0
        assert info.total_size == 0

    def test_copy_attributes(self, temp_store):
        """Test copying attributes between files."""
        temp_store.set("/src", "user.comment", b"source comment")
        temp_store.set("/src", "user.mime_type", b"text/plain")

        count = temp_store.copy_attributes("/src", "/dst")

        assert count == 2
        dst_attrs = temp_store.list("/dst")
        assert len(dst_attrs) == 2

    def test_copy_from_nonexistent(self, temp_store):
        """Test copying from nonexistent file."""
        count = temp_store.copy_attributes("/nonexistent", "/dst")
        assert count == 0

    def test_get_stats(self, temp_store):
        """Test getting store statistics."""
        temp_store.set("/file1", "user.comment", b"comment1")
        temp_store.set("/file1", "user.mime_type", b"text/plain")
        temp_store.set("/file2", "user.comment", b"comment2")

        stats = temp_store.get_stats()

        assert stats["total_files"] == 2
        assert stats["total_attributes"] == 3
        assert stats["total_size_bytes"] > 0

    def test_persistence(self, temp_store):
        """Test that attributes persist across store instances."""
        temp_store.set("/file", "user.comment", b"persistent")

        # Create new store from same file
        new_store = XAttrStore(temp_store.store_path)

        value = new_store.get("/file", "user.comment")
        assert value == b"persistent"

    def test_update_existing_attribute(self, temp_store):
        """Test updating an existing attribute."""
        temp_store.set("/file", "user.comment", b"original")
        temp_store.set("/file", "user.comment", b"updated")

        value = temp_store.get("/file", "user.comment")
        assert value == b"updated"

    def test_thread_safety(self, temp_store):
        """Test thread-safe operations."""
        errors = []

        def set_attrs(start_id):
            try:
                for i in range(start_id, start_id + 10):
                    temp_store.set(f"/file_{i}", "user.comment", f"comment_{i}".encode())
            except Exception as e:
                errors.append(e)

        threads = [threading.Thread(target=set_attrs, args=(i * 10,)) for i in range(3)]
        for t in threads:
            t.start()
        for t in threads:
            t.join()

        assert len(errors) == 0
        assert len(temp_store.attributes) == 30


class TestXAttrManager:
    """Tests for XAttrManager class."""

    @pytest.fixture
    def temp_store_path(self):
        """Create a temporary store path."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            yield f.name
        os.unlink(f.name)

    @pytest.fixture
    def manager(self, temp_store_path):
        """Create an xattr manager."""
        return XAttrManager(None, temp_store_path)

    @pytest.fixture
    def system_manager(self, temp_store_path):
        """Create an xattr manager with system namespace allowed."""
        return XAttrManager(None, temp_store_path, allow_system=True)

    def test_create_manager(self, manager):
        """Test creating an xattr manager."""
        assert manager.store is not None

    def test_set_and_get(self, manager):
        """Test setting and getting attributes."""
        success, msg = manager.set("/file", "user.comment", b"test")
        assert success is True

        success, value = manager.get("/file", "user.comment")
        assert success is True
        assert value == b"test"

    def test_set_create_only(self, manager):
        """Test create_only flag."""
        manager.set("/file", "user.comment", b"original")

        success, msg = manager.set("/file", "user.comment", b"new", create_only=True)
        assert success is False
        assert "already exists" in msg.lower()

    def test_set_replace_only(self, manager):
        """Test replace_only flag."""
        success, msg = manager.set("/file", "user.comment", b"value", replace_only=True)
        assert success is False
        assert "doesn't exist" in msg.lower()

    def test_set_name_too_long(self, manager):
        """Test validation of name length."""
        long_name = "user." + "x" * 300
        success, msg = manager.set("/file", long_name, b"value")
        assert success is False
        assert "too long" in msg.lower()

    def test_set_value_too_large(self, manager):
        """Test validation of value size."""
        large_value = b"x" * 100000
        success, msg = manager.set("/file", "user.comment", large_value)
        assert success is False
        assert "too large" in msg.lower()

    def test_system_namespace_blocked(self, manager):
        """Test that system namespace is blocked by default."""
        success, msg = manager.set("/file", "system.immutable", b"1")
        assert success is False
        assert "not allowed" in msg.lower()

    def test_system_namespace_allowed(self, system_manager):
        """Test that system namespace can be allowed."""
        success, msg = system_manager.set("/file", "system.immutable", b"1")
        assert success is True

    def test_list(self, manager):
        """Test listing attributes."""
        manager.set("/file", "user.comment", b"comment")
        manager.set("/file", "user.mime_type", b"text/plain")

        attrs = manager.list("/file")
        assert len(attrs) == 2

    def test_remove(self, manager):
        """Test removing attributes."""
        manager.set("/file", "user.comment", b"comment")
        success, msg = manager.remove("/file", "user.comment")

        assert success is True
        assert manager.list("/file") == []

    def test_remove_nonexistent(self, manager):
        """Test removing nonexistent attribute."""
        success, msg = manager.remove("/file", "user.nonexistent")
        assert success is False

    def test_get_info(self, manager):
        """Test getting file info."""
        manager.set("/file", "user.comment", b"test")
        info = manager.get_info("/file")

        assert info.attribute_count == 1

    def test_copy(self, manager):
        """Test copying attributes."""
        manager.set("/src", "user.comment", b"source")
        success, msg = manager.copy("/src", "/dst")

        assert success is True
        dst_attrs = manager.list("/dst")
        assert len(dst_attrs) == 1

    def test_has_attributes(self, manager):
        """Test checking for attributes."""
        assert manager.has_attributes("/file") is False
        manager.set("/file", "user.comment", b"test")
        assert manager.has_attributes("/file") is True

    def test_get_stats(self, manager):
        """Test getting statistics."""
        manager.set("/file1", "user.comment", b"test1")
        manager.set("/file2", "user.comment", b"test2")

        stats = manager.get_stats()
        assert stats["total_files"] == 2

    # Convenience method tests

    def test_set_user_comment(self, manager):
        """Test convenience method for user comment."""
        result = manager.set_user_comment("/file", "My comment")
        assert result is True

        comment = manager.get_user_comment("/file")
        assert comment == "My comment"

    def test_set_mime_type(self, manager):
        """Test convenience method for mime type."""
        result = manager.set_mime_type("/file", "application/json")
        assert result is True

        mime = manager.get_mime_type("/file")
        assert mime == "application/json"

    def test_set_tags(self, manager):
        """Test convenience method for tags."""
        result = manager.set_tags("/file", ["important", "work", "urgent"])
        assert result is True

        tags = manager.get_tags("/file")
        assert tags == ["important", "work", "urgent"]

    def test_get_nonexistent_convenience(self, manager):
        """Test getting nonexistent convenience attributes."""
        assert manager.get_user_comment("/file") is None
        assert manager.get_mime_type("/file") is None
        assert manager.get_tags("/file") == []


class TestConvenienceFunctions:
    """Tests for convenience functions."""

    def test_set_xattr(self):
        """Test set_xattr function."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            store_path = f.name

        try:
            result = set_xattr("/file", "user.comment", b"test", store_path)
            assert result is True

            value = get_xattr("/file", "user.comment", store_path)
            assert value == b"test"
        finally:
            os.unlink(store_path)

    def test_list_xattr(self):
        """Test list_xattr function."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            store_path = f.name

        try:
            set_xattr("/file", "user.a", b"1", store_path)
            set_xattr("/file", "user.b", b"2", store_path)

            attrs = list_xattr("/file", store_path)
            assert len(attrs) == 2
        finally:
            os.unlink(store_path)

    def test_remove_xattr(self):
        """Test remove_xattr function."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            store_path = f.name

        try:
            set_xattr("/file", "user.comment", b"test", store_path)
            result = remove_xattr("/file", "user.comment", store_path)
            assert result is True

            value = get_xattr("/file", "user.comment", store_path)
            assert value is None
        finally:
            os.unlink(store_path)


class TestIntegration:
    """Integration tests for the xattr system."""

    def test_full_workflow(self):
        """Test complete xattr workflow."""
        with tempfile.TemporaryDirectory() as d:
            store_path = Path(d) / "xattr.json"
            manager = XAttrManager(None, str(store_path))

            # Set various attributes
            manager.set_user_comment("/document.txt", "Important document")
            manager.set_mime_type("/document.txt", "text/plain")
            manager.set_tags("/document.txt", ["important", "work"])

            # Set custom attributes
            manager.set("/document.txt", "user.author", b"John Doe")
            manager.set("/document.txt", "user.version", b"1.0")

            # Get info
            info = manager.get_info("/document.txt")
            assert info.attribute_count == 5

            # List attributes
            attrs = manager.list("/document.txt")
            assert len(attrs) == 5

            # Copy to another file
            manager.copy("/document.txt", "/backup.txt")
            backup_attrs = manager.list("/backup.txt")
            assert len(backup_attrs) == 5

            # Remove one attribute
            manager.remove("/document.txt", "user.version")
            assert len(manager.list("/document.txt")) == 4

            # Get statistics
            stats = manager.get_stats()
            assert stats["total_files"] == 2
            assert stats["total_attributes"] == 9  # 4 + 5


class TestEdgeCases:
    """Tests for edge cases and error handling."""

    def test_empty_value(self):
        """Test setting empty value."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            store_path = f.name

        try:
            manager = XAttrManager(None, store_path)
            success, msg = manager.set("/file", "user.empty", b"")
            assert success is True

            value = manager.store.get("/file", "user.empty")
            assert value == b""
        finally:
            os.unlink(store_path)

    def test_unicode_value(self):
        """Test unicode values."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            store_path = f.name

        try:
            manager = XAttrManager(None, store_path)
            unicode_value = "Hello, 世界! 🌍".encode("utf-8")
            success, _ = manager.set("/file", "user.unicode", unicode_value)
            assert success is True

            success, value = manager.get("/file", "user.unicode")
            assert value.decode("utf-8") == "Hello, 世界! 🌍"
        finally:
            os.unlink(store_path)

    def test_attribute_count_limit(self):
        """Test maximum attributes per file limit."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            store_path = f.name

        try:
            manager = XAttrManager(None, store_path)
            manager.MAX_ATTRS_PER_FILE = 5  # Lower limit for testing

            # Add up to limit
            for i in range(5):
                success, _ = manager.set("/file", f"user.attr_{i}", f"value_{i}".encode())
                assert success is True

            # Try to add one more
            success, msg = manager.set("/file", "user.extra", b"extra")
            assert success is False
            assert "maximum" in msg.lower()
        finally:
            os.unlink(store_path)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
