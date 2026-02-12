#!/usr/bin/env python3
"""
Tests for Infinite Map Links System.

Comprehensive test coverage for:
- LinkEntry and LinkInfo dataclasses
- LinkTable (CRUD operations, inode management)
- LinkResolver (symlink resolution, circular detection)
- LinkManager (create, resolve, unlink)

Run with:
    PYTHONPATH=. pytest systems/pixel_compiler/tests/test_infinite_map_links.py -v
"""

import os
import sys
import json
import tempfile
import threading
from pathlib import Path
from datetime import datetime
from unittest.mock import Mock, MagicMock

import pytest

# Add parent to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.pixel_compiler.infinite_map_links import (
    LinkType,
    LinkState,
    LinkEntry,
    LinkInfo,
    InodeEntry,
    LinkTable,
    LinkResolver,
    LinkManager,
    create_symlink,
    create_hardlink,
    resolve_link,
)


class TestLinkType:
    """Tests for LinkType enum."""

    def test_link_types(self):
        """Test that all link types exist."""
        assert LinkType.SYMLINK.value == "symlink"
        assert LinkType.HARDLINK.value == "hardlink"


class TestLinkState:
    """Tests for LinkState enum."""

    def test_link_states(self):
        """Test that all link states exist."""
        assert LinkState.VALID.value == "valid"
        assert LinkState.BROKEN.value == "broken"
        assert LinkState.CIRCULAR.value == "circular"
        assert LinkState.DEEP.value == "deep"


class TestLinkEntry:
    """Tests for LinkEntry dataclass."""

    def test_create_symlink_entry(self):
        """Test creating a symlink entry."""
        entry = LinkEntry(
            link_path="/home/user/link",
            target_path="/home/user/target",
            link_type=LinkType.SYMLINK,
            created_at=datetime.now()
        )
        assert entry.link_path == "/home/user/link"
        assert entry.target_path == "/home/user/target"
        assert entry.link_type == LinkType.SYMLINK
        assert entry.inode is None
        assert entry.ref_count == 1

    def test_create_hardlink_entry(self):
        """Test creating a hardlink entry."""
        entry = LinkEntry(
            link_path="/home/user/hardlink",
            target_path="/home/user/target",
            link_type=LinkType.HARDLINK,
            created_at=datetime.now(),
            inode=42,
            ref_count=2
        )
        assert entry.link_type == LinkType.HARDLINK
        assert entry.inode == 42
        assert entry.ref_count == 2

    def test_entry_serialization(self):
        """Test entry serialization to dict."""
        dt = datetime(2026, 2, 12, 12, 0, 0)
        entry = LinkEntry(
            link_path="/link",
            target_path="/target",
            link_type=LinkType.SYMLINK,
            created_at=dt
        )
        data = entry.to_dict()

        assert data["link_path"] == "/link"
        assert data["target_path"] == "/target"
        assert data["link_type"] == "symlink"
        assert data["created_at"] == "2026-02-12T12:00:00"

    def test_entry_deserialization(self):
        """Test creating entry from dict."""
        data = {
            "link_path": "/link",
            "target_path": "/target",
            "link_type": "hardlink",
            "created_at": "2026-02-12T12:00:00",
            "inode": 100,
            "ref_count": 3
        }
        entry = LinkEntry.from_dict(data)

        assert entry.link_path == "/link"
        assert entry.link_type == LinkType.HARDLINK
        assert entry.inode == 100
        assert entry.ref_count == 3


class TestLinkInfo:
    """Tests for LinkInfo dataclass."""

    def test_create_link_info(self):
        """Test creating link info."""
        info = LinkInfo(
            link_path="/link",
            target_path="/target",
            link_type=LinkType.SYMLINK,
            state=LinkState.VALID,
            resolved_path="/target",
            chain=["/link", "/target"]
        )
        assert info.state == LinkState.VALID
        assert info.resolved_path == "/target"
        assert len(info.chain) == 2

    def test_link_info_serialization(self):
        """Test link info serialization."""
        info = LinkInfo(
            link_path="/link",
            target_path="/target",
            link_type=LinkType.SYMLINK,
            state=LinkState.BROKEN,
            error="Target not found"
        )
        data = info.to_dict()

        assert data["state"] == "broken"
        assert data["error"] == "Target not found"


class TestInodeEntry:
    """Tests for InodeEntry dataclass."""

    def test_create_inode_entry(self):
        """Test creating an inode entry."""
        entry = InodeEntry(
            inode=1,
            original_path="/original",
            ref_count=2,
            hardlinks={"/link1", "/link2"}
        )
        assert entry.inode == 1
        assert entry.ref_count == 2
        assert len(entry.hardlinks) == 2

    def test_inode_entry_serialization(self):
        """Test inode entry serialization."""
        entry = InodeEntry(
            inode=5,
            original_path="/original",
            hardlinks={"/link1"}
        )
        data = entry.to_dict()

        assert data["inode"] == 5
        assert "/link1" in data["hardlinks"]

    def test_inode_entry_deserialization(self):
        """Test creating inode entry from dict."""
        data = {
            "inode": 10,
            "original_path": "/original",
            "ref_count": 5,
            "hardlinks": ["/link1", "/link2", "/link3"]
        }
        entry = InodeEntry.from_dict(data)

        assert entry.inode == 10
        assert entry.ref_count == 5
        assert len(entry.hardlinks) == 3


class TestLinkTable:
    """Tests for LinkTable class."""

    @pytest.fixture
    def temp_table(self):
        """Create a temporary link table."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            table_path = f.name
        table = LinkTable(table_path)
        yield table
        os.unlink(table_path)
        tmp_path = Path(table_path).with_suffix(".tmp")
        if tmp_path.exists():
            os.unlink(tmp_path)

    def test_create_table(self, temp_table):
        """Test creating a link table."""
        assert temp_table.links == {}
        assert temp_table.next_inode == 1

    def test_add_link(self, temp_table):
        """Test adding a link."""
        entry = LinkEntry(
            link_path="/link",
            target_path="/target",
            link_type=LinkType.SYMLINK,
            created_at=datetime.now()
        )
        path = temp_table.add_link(entry)

        assert path == "/link"
        assert temp_table.get_link("/link") is not None

    def test_get_nonexistent_link(self, temp_table):
        """Test getting nonexistent link."""
        result = temp_table.get_link("/nonexistent")
        assert result is None

    def test_remove_link(self, temp_table):
        """Test removing a link."""
        entry = LinkEntry(
            link_path="/link",
            target_path="/target",
            link_type=LinkType.SYMLINK,
            created_at=datetime.now()
        )
        temp_table.add_link(entry)

        result = temp_table.remove_link("/link")
        assert result is True
        assert temp_table.get_link("/link") is None

    def test_remove_nonexistent_link(self, temp_table):
        """Test removing nonexistent link."""
        result = temp_table.remove_link("/nonexistent")
        assert result is False

    def test_allocate_inode(self, temp_table):
        """Test inode allocation."""
        inode1 = temp_table.allocate_inode("/file1")
        inode2 = temp_table.allocate_inode("/file2")

        assert inode1 == 1
        assert inode2 == 2
        assert temp_table.next_inode == 3

    def test_get_inode(self, temp_table):
        """Test getting inode entry."""
        inode = temp_table.allocate_inode("/file")
        entry = temp_table.get_inode(inode)

        assert entry is not None
        assert entry.original_path == "/file"

    def test_add_hardlink_to_inode(self, temp_table):
        """Test adding hardlink to inode."""
        inode = temp_table.allocate_inode("/original")
        result = temp_table.add_hardlink_to_inode(inode, "/hardlink")

        assert result is True
        entry = temp_table.get_inode(inode)
        assert entry.ref_count == 2
        assert "/hardlink" in entry.hardlinks

    def test_get_links_by_inode(self, temp_table):
        """Test getting all links by inode."""
        inode = temp_table.allocate_inode("/original")
        temp_table.add_hardlink_to_inode(inode, "/link1")
        temp_table.add_hardlink_to_inode(inode, "/link2")

        links = temp_table.get_links_by_inode(inode)

        assert "/original" in links
        assert "/link1" in links
        assert "/link2" in links

    def test_list_symlinks(self, temp_table):
        """Test listing symlinks."""
        for i in range(3):
            entry = LinkEntry(
                link_path=f"/symlink_{i}",
                target_path=f"/target_{i}",
                link_type=LinkType.SYMLINK,
                created_at=datetime.now()
            )
            temp_table.add_link(entry)

        for i in range(2):
            entry = LinkEntry(
                link_path=f"/hardlink_{i}",
                target_path=f"/target_{i}",
                link_type=LinkType.HARDLINK,
                created_at=datetime.now(),
                inode=i + 1
            )
            temp_table.add_link(entry)

        symlinks = temp_table.list_symlinks()
        assert len(symlinks) == 3

    def test_list_hardlinks(self, temp_table):
        """Test listing hardlinks."""
        entry1 = LinkEntry(
            link_path="/symlink",
            target_path="/target",
            link_type=LinkType.SYMLINK,
            created_at=datetime.now()
        )
        temp_table.add_link(entry1)

        inode = temp_table.allocate_inode("/original")
        entry2 = LinkEntry(
            link_path="/hardlink",
            target_path="/original",
            link_type=LinkType.HARDLINK,
            created_at=datetime.now(),
            inode=inode
        )
        temp_table.add_link(entry2)

        hardlinks = temp_table.list_hardlinks()
        assert len(hardlinks) == 1

    def test_get_stats(self, temp_table):
        """Test getting statistics."""
        for i in range(2):
            entry = LinkEntry(
                link_path=f"/symlink_{i}",
                target_path=f"/target_{i}",
                link_type=LinkType.SYMLINK,
                created_at=datetime.now()
            )
            temp_table.add_link(entry)

        for i in range(3):
            entry = LinkEntry(
                link_path=f"/hardlink_{i}",
                target_path=f"/target_{i}",
                link_type=LinkType.HARDLINK,
                created_at=datetime.now(),
                inode=i + 1
            )
            temp_table.add_link(entry)

        stats = temp_table.get_stats()

        assert stats["total_links"] == 5
        assert stats["symlinks"] == 2
        assert stats["hardlinks"] == 3

    def test_persistence(self, temp_table):
        """Test that links persist across table instances."""
        entry = LinkEntry(
            link_path="/persistent",
            target_path="/target",
            link_type=LinkType.SYMLINK,
            created_at=datetime.now()
        )
        temp_table.add_link(entry)
        temp_table._save()

        # Create new table from same file
        new_table = LinkTable(temp_table.table_path)
        assert new_table.get_link("/persistent") is not None

    def test_hardlink_removal_updates_refcount(self, temp_table):
        """Test that removing hardlink updates reference count."""
        inode = temp_table.allocate_inode("/original")
        temp_table.add_hardlink_to_inode(inode, "/link1")

        entry = LinkEntry(
            link_path="/link1",
            target_path="/original",
            link_type=LinkType.HARDLINK,
            created_at=datetime.now(),
            inode=inode,
            ref_count=2
        )
        temp_table.add_link(entry)

        # Remove the hardlink
        temp_table.remove_link("/link1")

        # Check ref count was decremented
        inode_entry = temp_table.get_inode(inode)
        assert inode_entry.ref_count == 1

    def test_thread_safety(self, temp_table):
        """Test thread-safe operations."""
        errors = []

        def add_links(start_id):
            try:
                for i in range(start_id, start_id + 10):
                    entry = LinkEntry(
                        link_path=f"/link_{i}",
                        target_path=f"/target_{i}",
                        link_type=LinkType.SYMLINK,
                        created_at=datetime.now()
                    )
                    temp_table.add_link(entry)
            except Exception as e:
                errors.append(e)

        threads = [threading.Thread(target=add_links, args=(i * 10,)) for i in range(3)]
        for t in threads:
            t.start()
        for t in threads:
            t.join()

        assert len(errors) == 0
        assert len(temp_table.links) == 30


class TestLinkResolver:
    """Tests for LinkResolver class."""

    @pytest.fixture
    def mock_vat(self):
        """Create a mock VAT."""
        vat = Mock()
        vat.lookup.return_value = Mock()  # Files exist by default
        return vat

    @pytest.fixture
    def temp_table(self):
        """Create a temporary link table."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            table_path = f.name
        table = LinkTable(table_path)
        yield table
        os.unlink(table_path)

    @pytest.fixture
    def resolver(self, mock_vat, temp_table):
        """Create a link resolver."""
        return LinkResolver(temp_table, mock_vat)

    def test_resolve_non_link(self, resolver):
        """Test resolving a non-link path."""
        state, resolved, chain = resolver.resolve("/regular/file")

        assert state == LinkState.VALID
        assert resolved == "/regular/file"

    def test_resolve_symlink(self, resolver, temp_table):
        """Test resolving a symlink."""
        entry = LinkEntry(
            link_path="/link",
            target_path="/target",
            link_type=LinkType.SYMLINK,
            created_at=datetime.now()
        )
        temp_table.add_link(entry)

        state, resolved, chain = resolver.resolve("/link")

        assert state == LinkState.VALID
        assert resolved == "/target"
        assert "/link" in chain
        assert "/target" in chain

    def test_resolve_chain(self, resolver, temp_table):
        """Test resolving a chain of symlinks."""
        # Create chain: /link1 -> /link2 -> /target
        for link, target in [("/link1", "/link2"), ("/link2", "/target")]:
            entry = LinkEntry(
                link_path=link,
                target_path=target,
                link_type=LinkType.SYMLINK,
                created_at=datetime.now()
            )
            temp_table.add_link(entry)

        state, resolved, chain = resolver.resolve("/link1")

        assert state == LinkState.VALID
        assert resolved == "/target"
        assert len(chain) == 3

    def test_detect_circular(self, resolver, temp_table):
        """Test detecting circular symlinks."""
        # Create circular: /a -> /b -> /a
        for link, target in [("/a", "/b"), ("/b", "/a")]:
            entry = LinkEntry(
                link_path=link,
                target_path=target,
                link_type=LinkType.SYMLINK,
                created_at=datetime.now()
            )
            temp_table.add_link(entry)

        state, resolved, chain = resolver.resolve("/a")

        assert state == LinkState.CIRCULAR

    def test_detect_deep_chain(self, resolver, temp_table):
        """Test detecting too-deep symlink chain."""
        # Create 50 symlinks in a chain
        for i in range(50):
            entry = LinkEntry(
                link_path=f"/link_{i}",
                target_path=f"/link_{i+1}",
                link_type=LinkType.SYMLINK,
                created_at=datetime.now()
            )
            temp_table.add_link(entry)

        state, resolved, chain = resolver.resolve("/link_0")

        assert state == LinkState.DEEP

    def test_resolve_broken_link(self, resolver, temp_table, mock_vat):
        """Test resolving a broken symlink."""
        mock_vat.lookup.return_value = None  # Target doesn't exist

        entry = LinkEntry(
            link_path="/broken",
            target_path="/nonexistent",
            link_type=LinkType.SYMLINK,
            created_at=datetime.now()
        )
        temp_table.add_link(entry)

        state, resolved, chain = resolver.resolve("/broken")

        assert state == LinkState.BROKEN

    def test_resolve_without_following(self, resolver, temp_table):
        """Test resolving without following symlinks."""
        entry = LinkEntry(
            link_path="/link",
            target_path="/target",
            link_type=LinkType.SYMLINK,
            created_at=datetime.now()
        )
        temp_table.add_link(entry)

        state, resolved, chain = resolver.resolve("/link", follow_symlinks=False)

        # Should return the link itself, not the target
        assert resolved == "/link"

    def test_get_link_info(self, resolver, temp_table):
        """Test getting link info."""
        entry = LinkEntry(
            link_path="/link",
            target_path="/target",
            link_type=LinkType.SYMLINK,
            created_at=datetime.now()
        )
        temp_table.add_link(entry)

        info = resolver.get_link_info("/link")

        assert info is not None
        assert info.link_type == LinkType.SYMLINK
        assert info.state == LinkState.VALID


class TestLinkManager:
    """Tests for LinkManager class."""

    @pytest.fixture
    def mock_vat(self):
        """Create a mock VAT."""
        vat = Mock()
        vat.lookup.return_value = Mock()
        return vat

    @pytest.fixture
    def temp_table_path(self):
        """Create a temporary table path."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            yield f.name
        os.unlink(f.name)

    @pytest.fixture
    def manager(self, mock_vat, temp_table_path):
        """Create a link manager."""
        return LinkManager(mock_vat, temp_table_path)

    def test_create_manager(self, manager):
        """Test creating a link manager."""
        assert manager.link_table is not None
        assert manager.resolver is not None

    def test_create_symlink(self, manager):
        """Test creating a symlink."""
        success, message = manager.create_symlink("/link", "/target")

        assert success is True
        assert manager.is_symlink("/link")

    def test_create_duplicate_symlink(self, manager):
        """Test creating duplicate symlink fails."""
        manager.create_symlink("/link", "/target")
        success, message = manager.create_symlink("/link", "/other")

        assert success is False
        assert "already exists" in message.lower()

    def test_create_hardlink(self, manager):
        """Test creating a hardlink."""
        success, message = manager.create_hardlink("/hardlink", "/original")

        assert success is True
        assert manager.is_hardlink("/hardlink")

    def test_readlink(self, manager):
        """Test reading symlink target."""
        manager.create_symlink("/link", "/target")
        success, target = manager.readlink("/link")

        assert success is True
        assert target == "/target"

    def test_readlink_not_symlink(self, manager):
        """Test reading hardlink as symlink fails."""
        manager.create_hardlink("/hardlink", "/original")
        success, message = manager.readlink("/hardlink")

        assert success is False

    def test_unlink(self, manager):
        """Test unlinking."""
        manager.create_symlink("/link", "/target")
        success, message = manager.unlink("/link")

        assert success is True
        assert not manager.is_link("/link")

    def test_unlink_nonexistent(self, manager):
        """Test unlinking nonexistent link."""
        success, message = manager.unlink("/nonexistent")

        assert success is False

    def test_is_link(self, manager):
        """Test checking if path is a link."""
        manager.create_symlink("/link", "/target")

        assert manager.is_link("/link") is True
        assert manager.is_link("/nonexistent") is False

    def test_resolve(self, manager):
        """Test resolving a link."""
        manager.create_symlink("/link", "/target")
        state, resolved = manager.resolve("/link")

        assert state == LinkState.VALID
        assert resolved == "/target"

    def test_get_hardlinks(self, manager):
        """Test getting all hardlinks for an inode."""
        manager.create_hardlink("/hardlink1", "/original")
        manager.create_hardlink("/hardlink2", "/original")

        # Get the inode from one of the hardlinks
        link = manager.link_table.get_link("/hardlink1")
        hardlinks = manager.get_hardlinks(link.inode)

        assert len(hardlinks) >= 2

    def test_list_broken_links(self, manager, mock_vat):
        """Test listing broken links."""
        mock_vat.lookup.return_value = None  # Targets don't exist

        manager.create_symlink("/broken1", "/missing1")
        manager.create_symlink("/broken2", "/missing2")

        broken = manager.list_broken_links()

        assert len(broken) == 2

    def test_get_stats(self, manager):
        """Test getting statistics."""
        manager.create_symlink("/symlink1", "/target1")
        manager.create_symlink("/symlink2", "/target2")
        manager.create_hardlink("/hardlink", "/original")

        stats = manager.get_stats()

        assert stats["symlinks"] == 2
        assert stats["hardlinks"] == 1
        assert stats["total_links"] == 3


class TestConvenienceFunctions:
    """Tests for convenience functions."""

    def test_create_symlink_function(self):
        """Test create_symlink convenience function."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            table_path = f.name

        try:
            result = create_symlink("/link", "/target", table_path)
            assert result is True

            # Verify it was created
            manager = LinkManager(None, table_path)
            assert manager.is_symlink("/link")
        finally:
            os.unlink(table_path)

    def test_create_hardlink_function(self):
        """Test create_hardlink convenience function."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            table_path = f.name

        try:
            # Need VAT for hardlink (to check target exists)
            vat = Mock()
            vat.lookup.return_value = Mock()

            from systems.pixel_compiler.infinite_map_links import LinkManager
            manager = LinkManager(vat, table_path)
            success, _ = manager.create_hardlink("/hardlink", "/original")

            assert success is True
        finally:
            os.unlink(table_path)

    def test_resolve_link_function(self):
        """Test resolve_link convenience function."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False) as f:
            table_path = f.name

        try:
            # Create symlink
            mgr = LinkManager(None, table_path)
            mgr.create_symlink("/link", "/target")

            # Resolve
            resolved = resolve_link("/link", table_path)

            # With None VAT, it assumes target exists
            assert resolved == "/target"
        finally:
            os.unlink(table_path)


class TestIntegration:
    """Integration tests for the links system."""

    def test_full_workflow(self):
        """Test complete link workflow."""
        with tempfile.TemporaryDirectory() as d:
            table_path = Path(d) / "links.json"

            # Create mock VAT
            vat = Mock()
            existing_files = {"/original", "/target1", "/target2"}
            vat.lookup.side_effect = lambda p: Mock() if p in existing_files else None

            manager = LinkManager(vat, str(table_path))

            # Create symlinks
            manager.create_symlink("/symlink1", "/target1")
            manager.create_symlink("/symlink2", "/target2")

            # Create hardlinks
            manager.create_hardlink("/hardlink1", "/original")
            manager.create_hardlink("/hardlink2", "/original")

            # Check stats
            stats = manager.get_stats()
            assert stats["symlinks"] == 2
            assert stats["hardlinks"] == 2

            # Resolve symlinks
            state, resolved = manager.resolve("/symlink1")
            assert state == LinkState.VALID
            assert resolved == "/target1"

            # Read symlink
            success, target = manager.readlink("/symlink2")
            assert target == "/target2"

            # Get hardlinks
            link = manager.link_table.get_link("/hardlink1")
            hardlinks = manager.get_hardlinks(link.inode)
            assert len(hardlinks) == 3  # original + 2 hardlinks

            # Delete a link
            manager.unlink("/symlink1")
            assert not manager.is_link("/symlink1")

            # Check updated stats
            stats = manager.get_stats()
            assert stats["symlinks"] == 1


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
