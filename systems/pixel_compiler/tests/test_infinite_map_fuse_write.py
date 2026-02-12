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
