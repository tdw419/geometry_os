"""
Test write operations on Infinite Map FUSE mount.

Task 1: Add File Creation Support
Tests for the FUSE create() operation.
"""

import pytest
import tempfile
import os
from pathlib import Path


class TestFUSEWriteSupport:
    """Test write operations on Infinite Map FUSE mount."""

    @pytest.fixture
    def mounted_map(self, tmp_path):
        """Create a test infinite map and mount it."""
        from systems.pixel_compiler.infinite_map_v2 import InfiniteMapBuilderV2

        # Create source directory
        source = tmp_path / "source"
        source.mkdir()
        (source / "existing.txt").write_bytes(b"hello")

        # Build infinite map
        output = tmp_path / "test.rts.png"
        builder = InfiniteMapBuilderV2(str(source), str(output), grid_size=256)
        builder.build()

        yield {
            "image_path": str(output),
            "mount_dir": str(tmp_path / "mnt"),
            "builder": builder
        }

    def test_create_new_file(self, mounted_map):
        """Test creating a new file via FUSE create operation."""
        from systems.pixel_compiler.infinite_map_fuse import InfiniteMapFilesystem
        import errno

        # Create FUSE instance with write support enabled (for unit test)
        fuse_instance = InfiniteMapFilesystem(
            mounted_map["image_path"],
            enable_writes=True  # Enable write support for this test
        )

        # Test create operation
        result = fuse_instance.create("/newfile.txt", 0o644)

        # create() should return 0 on success
        assert result == 0

        # Verify file was created in VAT
        assert fuse_instance.container.vat.lookup("newfile.txt") is not None

    def test_write_to_file(self, mounted_map):
        """Test writing data to a file via FUSE write operation."""
        from systems.pixel_compiler.infinite_map_fuse import InfiniteMapFilesystem

        fuse_instance = InfiniteMapFilesystem(
            mounted_map["image_path"],
            enable_writes=True
        )

        # First create the file
        fuse_instance.create("/writetest.txt", 0o644)

        # Write data
        data = b"Hello, Infinite Map!"
        result = fuse_instance.write("/writetest.txt", data, 0)

        # Verify write succeeded (returns bytes written)
        assert result == len(data)

        # Verify data can be read back
        read_data = fuse_instance.read("/writetest.txt", len(data), 0)
        assert read_data == data

    def test_mkdir_creates_directory(self, mounted_map):
        """Test creating a directory via FUSE mkdir operation."""
        from systems.pixel_compiler.infinite_map_fuse import InfiniteMapFilesystem

        # Create FUSE instance with write support enabled
        fuse_instance = InfiniteMapFilesystem(
            mounted_map["image_path"],
            enable_writes=True
        )

        # Create directory
        result = fuse_instance.mkdir("/newdir", 0o755)

        # Verify success
        assert result == 0

        # Verify directory appears in readdir
        entries = fuse_instance.readdir("/", 0)
        assert "newdir" in entries

    def test_unlink_deletes_file(self, mounted_map):
        """Test deleting a file via FUSE unlink operation."""
        from systems.pixel_compiler.infinite_map_fuse import InfiniteMapFilesystem

        # Create FUSE instance with write support enabled
        fuse_instance = InfiniteMapFilesystem(
            mounted_map["image_path"],
            enable_writes=True
        )

        # First verify existing.txt exists
        entries = fuse_instance.readdir("/", 0)
        assert "existing.txt" in entries, "existing.txt should exist before deletion"

        # Delete the file
        result = fuse_instance.unlink("/existing.txt")

        # Verify success
        assert result == 0

        # Verify file no longer exists
        entries = fuse_instance.readdir("/", 0)
        assert "existing.txt" not in entries, "existing.txt should be removed after unlink"

        # Verify VAT entry is removed
        assert "existing.txt" not in fuse_instance.container.vat.entries, "VAT entry should be removed"

    def test_rename_moves_file(self, mounted_map):
        """Test renaming a file via FUSE rename operation."""
        from systems.pixel_compiler.infinite_map_fuse import InfiniteMapFilesystem

        # Create FUSE instance with write support enabled
        fuse_instance = InfiniteMapFilesystem(
            mounted_map["image_path"],
            enable_writes=True
        )

        # First verify existing.txt exists and get its data
        old_info = fuse_instance.container.vat.lookup("existing.txt")
        assert old_info is not None, "existing.txt should exist before rename"

        # Read original data
        original_data = fuse_instance.read("/existing.txt", 5, 0)
        assert original_data == b"hello", "Should read original data before rename"

        # Rename existing.txt to renamed.txt
        result = fuse_instance.rename("/existing.txt", "/renamed.txt")

        # Verify success
        assert result == 0

        # Verify old name gone
        assert fuse_instance.container.vat.lookup("existing.txt") is None

        # Verify new name exists with same data
        new_info = fuse_instance.container.vat.lookup("renamed.txt")
        assert new_info is not None

    def test_rename_nonexistent_file_fails(self, mounted_map):
        """Test renaming a non-existent file fails with ENOENT."""
        from systems.pixel_compiler.infinite_map_fuse import InfiniteMapFilesystem
        from fuse import FuseOSError
        import errno

        fuse_instance = InfiniteMapFilesystem(
            mounted_map["image_path"],
            enable_writes=True
        )

        # Try to rename a file that doesn't exist
        try:
            fuse_instance.rename("/nonexistent.txt", "/newname.txt")
            assert False, "Should have raised FuseOSError"
        except FuseOSError as e:
            assert e.args[0] == errno.ENOENT

    def test_rename_to_existing_file_fails(self, mounted_map):
        """Test renaming to an existing file fails with EEXIST."""
        from systems.pixel_compiler.infinite_map_fuse import InfiniteMapFilesystem
        from fuse import FuseOSError
        import errno

        fuse_instance = InfiniteMapFilesystem(
            mounted_map["image_path"],
            enable_writes=True
        )

        # Create a second file
        fuse_instance.create("/second.txt", 0o644)

        # Try to rename existing.txt to second.txt (which already exists)
        try:
            fuse_instance.rename("/existing.txt", "/second.txt")
            assert False, "Should have raised FuseOSError"
        except FuseOSError as e:
            assert e.args[0] == errno.EEXIST

    def test_flush_persists_changes(self, mounted_map):
        """Test that flush persists changes to the PNG file."""
        from systems.pixel_compiler.infinite_map_fuse import InfiniteMapFilesystem

        fuse_instance = InfiniteMapFilesystem(
            mounted_map["image_path"],
            enable_writes=True
        )

        # Create and write a file
        fuse_instance.create("/persist.txt", 0o644)
        fuse_instance.write("/persist.txt", b"persistent data", 0)

        # Verify dirty flag is set
        assert fuse_instance.dirty, "dirty flag should be set after write"

        # Flush changes
        result = fuse_instance.flush("/persist.txt")

        # Verify success
        assert result == 0

        # Verify dirty flag cleared
        assert not fuse_instance.dirty, "dirty flag should be cleared after flush"

    def test_fsync_calls_flush(self, mounted_map):
        """Test that fsync delegates to flush."""
        from systems.pixel_compiler.infinite_map_fuse import InfiniteMapFilesystem

        fuse_instance = InfiniteMapFilesystem(
            mounted_map["image_path"],
            enable_writes=True
        )

        # Create and write a file
        fuse_instance.create("/sync_test.txt", 0o644)
        fuse_instance.write("/sync_test.txt", b"sync data", 0)

        # Verify dirty flag is set
        assert fuse_instance.dirty

        # Call fsync
        result = fuse_instance.fsync("/sync_test.txt", datasync=0)

        # Verify success and dirty flag cleared
        assert result == 0
        assert not fuse_instance.dirty

    def test_truncate_resizes_file(self, mounted_map):
        """Test truncating a file to smaller size."""
        from systems.pixel_compiler.infinite_map_fuse import InfiniteMapFilesystem

        fuse_instance = InfiniteMapFilesystem(
            mounted_map["image_path"],
            enable_writes=True
        )

        # Create file with data
        fuse_instance.create("/trunc.txt", 0o644)
        fuse_instance.write("/trunc.txt", b"0123456789ABCDEF", 0)

        # Truncate to 5 bytes
        result = fuse_instance.truncate("/trunc.txt", 5)

        # Verify success
        assert result == 0

        # Read back and verify size (should be "01234")
        data = fuse_instance.read("/trunc.txt", 100, 0)
        assert data == b"01234"

    def test_fuse_instance_has_write_support(self, mounted_map):
        """Test that FUSE instance initializes with write support."""
        from systems.pixel_compiler.infinite_map_fuse import InfiniteMapFilesystem

        fuse_instance = InfiniteMapFilesystem(
            mounted_map["image_path"],
            enable_writes=True
        )

        # Verify write-related attributes exist
        assert hasattr(fuse_instance, 'dirty'), "FUSE instance should have 'dirty' attribute"
        assert hasattr(fuse_instance, 'img_data'), "FUSE instance should have 'img_data' attribute (pixel array)"
        assert hasattr(fuse_instance, '_open_files'), "FUSE instance should have '_open_files' attribute"

        # Verify dirty flag starts False
        assert fuse_instance.dirty == False, "dirty flag should start as False"

        # Verify _open_files is an empty dict
        assert isinstance(fuse_instance._open_files, dict), "_open_files should be a dict"
        assert fuse_instance._open_files == {}, "_open_files should start empty"

        # Verify img_data is mutable (numpy array)
        import numpy as np
        assert isinstance(fuse_instance.img_data, np.ndarray), "img_data should be a numpy array"

    def test_read_uses_cache(self, mounted_map):
        """Test that read operations use the LRU cache."""
        from systems.pixel_compiler.infinite_map_fuse import InfiniteMapFilesystem

        fuse_instance = InfiniteMapFilesystem(
            mounted_map["image_path"],
            enable_writes=True
        )

        # Verify cache is initialized
        assert hasattr(fuse_instance, 'cache'), "FUSE instance should have 'cache' attribute"
        assert fuse_instance.cache is not None, "Cache should be initialized"

        # Get initial cache stats
        stats_before = fuse_instance.cache.get_stats()
        initial_misses = stats_before["misses"]

        # First read - should be a cache miss
        data1 = fuse_instance.read("/existing.txt", 5, 0)
        stats_after_first = fuse_instance.cache.get_stats()

        # Should have at least one miss now
        assert stats_after_first["misses"] >= initial_misses + 1, \
            "First read should be a cache miss"

        # Second read - should be a cache hit
        data2 = fuse_instance.read("/existing.txt", 5, 0)
        stats_after_second = fuse_instance.cache.get_stats()

        # Should have a hit now
        assert stats_after_second["hits"] >= 1, \
            "Second read should be a cache hit"

        # Data should be identical
        assert data1 == data2, "Cached data should match original data"

    def test_cache_invalidation_on_write(self, mounted_map):
        """Test that cache is invalidated when file is written."""
        from systems.pixel_compiler.infinite_map_fuse import InfiniteMapFilesystem

        fuse_instance = InfiniteMapFilesystem(
            mounted_map["image_path"],
            enable_writes=True
        )

        # First read - populate cache
        data1 = fuse_instance.read("/existing.txt", 5, 0)
        stats_after_read = fuse_instance.cache.get_stats()
        assert stats_after_read["hits"] >= 0 or stats_after_read["misses"] >= 1

        # Write to the file - should invalidate cache
        fuse_instance.write("/existing.txt", b"world", 0)

        # Cache should be invalidated for this file
        # After write, a read should miss the cache
        data2 = fuse_instance.read("/existing.txt", 5, 0)

        # Verify data changed
        assert data2 == b"world", "Data should be updated after write"

    def test_cache_configurable_size(self, mounted_map):
        """Test that cache size is configurable."""
        from systems.pixel_compiler.infinite_map_fuse import InfiniteMapFilesystem

        # Create FUSE with custom cache size (1MB)
        fuse_instance = InfiniteMapFilesystem(
            mounted_map["image_path"],
            enable_writes=True,
            cache_size=1024 * 1024  # 1MB
        )

        # Verify cache has the correct max size
        stats = fuse_instance.cache.get_stats()
        assert stats["max_size"] == 1024 * 1024, \
            "Cache max_size should be configurable"
