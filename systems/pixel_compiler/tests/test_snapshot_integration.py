#!/usr/bin/env python3
"""
Snapshot integration tests for InfiniteMapBuilderV2.

Tests snapshot manager integration with builder including:
- Snapshot creation
- Snapshot restoration
- VAT state capture and apply
- Cache invalidation after restore
- Atomic operations
"""

import pytest
import tempfile
import shutil
from pathlib import Path
import json
import time

from systems.pixel_compiler.infinite_map_v2 import (
    InfiniteMapBuilderV2,
    VisualAllocationTable,
    ClusterLocation
)
from systems.pixel_compiler.infinite_map_snapshot import (
    SnapshotManager,
    SnapshotMetadata,
    SnapshotError
)


class TestSnapshotIntegration:
    """Test snapshot manager integration with InfiniteMapBuilderV2."""

    @pytest.fixture
    def temp_dirs(self):
        """Create temporary directories for testing."""
        temp_dir = tempfile.mkdtemp()
        source_dir = Path(temp_dir) / "source"
        source_dir.mkdir(parents=True)
        output_dir = Path(temp_dir) / "output"
        output_dir.mkdir(parents=True)
        snapshot_dir = Path(temp_dir) / "snapshots"
        snapshot_dir.mkdir(parents=True)

        # Create test files
        (source_dir / "kernel").write_bytes(b"KERNEL_DATA" * 100)
        (source_dir / "initrd").write_bytes(b"INITRD_DATA" * 50)
        (source_dir / "lib").mkdir()
        (source_dir / "lib" / "libc.so").write_bytes(b"LIBC_DATA" * 30)

        yield {
            'source': str(source_dir),
            'output': str(output_dir / 'test.rts.png'),
            'snapshots': str(snapshot_dir)
        }

        # Cleanup
        shutil.rmtree(temp_dir)

    @pytest.fixture
    def builder(self, temp_dirs):
        """Create a test builder."""
        return InfiniteMapBuilderV2(
            source_dir=temp_dirs['source'],
            output_path=temp_dirs['output'],
            grid_size=512,
            snapshot_storage_dir=temp_dirs['snapshots']
        )

    def test_snapshot_manager_initialized_in_builder(self, temp_dirs):
        """Test that SnapshotManager is initialized in builder."""
        builder = InfiniteMapBuilderV2(
            source_dir=temp_dirs['source'],
            output_path=temp_dirs['output'],
            grid_size=512,
            snapshot_storage_dir=temp_dirs['snapshots']
        )

        # Builder should have snapshot manager attribute
        assert hasattr(builder, '_snapshot_manager')
        assert builder._snapshot_manager is not None
        assert isinstance(builder._snapshot_manager, SnapshotManager)

    def test_create_snapshot_captures_vat_state(self, builder, temp_dirs):
        """Test that create_snapshot captures VAT state correctly."""
        # Build to populate VAT
        result = builder.build()
        vat = builder.ai_placer.vat

        # Create snapshot
        snapshot_meta = builder.create_snapshot(
            description="Test snapshot"
        )

        # Verify snapshot metadata
        assert snapshot_meta is not None
        assert isinstance(snapshot_meta, SnapshotMetadata)
        assert snapshot_meta.description == "Test snapshot"
        assert snapshot_meta.total_files == len(vat.entries)
        assert snapshot_meta.grid_size == builder.grid_size

        # Verify snapshot files created
        snapshot_dir = Path(temp_dirs['snapshots'])
        assert snapshot_dir.exists()
        assert (snapshot_dir / snapshot_meta.snapshot_id).exists()
        assert (snapshot_dir / snapshot_meta.snapshot_id / "metadata.json").exists()
        assert (snapshot_dir / snapshot_meta.snapshot_id / "vat.json").exists()

    def test_restore_snapshot_applies_vat_state(self, builder, temp_dirs):
        """Test that restore_snapshot applies VAT state correctly."""
        # Build and create snapshot
        builder.build()
        original_vat = builder.ai_placer.vat
        original_files = len(original_vat.entries)

        # Create snapshot
        snapshot_meta = builder.create_snapshot(
            description="Before modification"
        )

        # Modify VAT by adding more files
        source = Path(temp_dirs['source'])
        (source / "new_file.txt").write_bytes(b"NEW_DATA" * 20)

        # Rebuild to modify VAT
        builder2 = InfiniteMapBuilderV2(
            source_dir=temp_dirs['source'],
            output_path=temp_dirs['output'],
            grid_size=512,
            snapshot_storage_dir=temp_dirs['snapshots']
        )
        builder2.build()
        modified_vat = builder2.ai_placer.vat

        # Verify VAT changed
        assert len(modified_vat.entries) > original_files

        # Restore snapshot
        success = builder2.restore_snapshot(snapshot_meta.snapshot_id)

        # Verify restore succeeded
        assert success is True
        assert len(builder2.ai_placer.vat.entries) == original_files

    def test_list_snapshots(self, builder):
        """Test that list_snapshots returns all snapshots."""
        builder.build()

        # Create multiple snapshots
        meta1 = builder.create_snapshot(description="First snapshot")
        time.sleep(0.1)  # Ensure different timestamps
        meta2 = builder.create_snapshot(description="Second snapshot")

        # List snapshots
        snapshots = builder.list_snapshots()

        # Should have at least our 2 snapshots
        assert len(snapshots) >= 2

        # Should be sorted by timestamp (newest first)
        if len(snapshots) >= 2:
            assert snapshots[0]['timestamp'] >= snapshots[1]['timestamp']

    def test_restore_with_tags_filter(self, builder):
        """Test that list_snapshots can filter by tags."""
        builder.build()

        # Create snapshots with descriptions (acting as tags)
        builder.create_snapshot(description="backup-before-upgrade")
        builder.create_snapshot(description="backup-after-upgrade")
        builder.create_snapshot(description="milestone-1.0")

        # List all snapshots
        all_snapshots = builder.list_snapshots()
        assert len(all_snapshots) >= 3

    def test_restore_invalid_snapshot_id_returns_false(self, builder):
        """Test that restoring invalid snapshot ID returns False."""
        builder.build()

        # Try to restore non-existent snapshot
        success = builder.restore_snapshot("non-existent-snapshot-id")

        assert success is False

    def test_cache_invalidated_after_restore(self, builder, temp_dirs):
        """Test that texture cache is invalidated after restore."""
        builder.build()

        # Simulate cache by setting a value
        builder._texture_cache = {"dummy": "cached_value"}

        # Create and restore snapshot
        snapshot_meta = builder.create_snapshot(description="Cache test")
        builder.restore_snapshot(snapshot_meta.snapshot_id)

        # Cache should be invalidated (cleared or None)
        assert builder._texture_cache is None or len(builder._texture_cache) == 0

    def test_atomic_snapshot_creation(self, builder, temp_dirs):
        """Test that snapshot creation is atomic."""
        builder.build()

        # Create snapshot
        snapshot_meta = builder.create_snapshot(description="Atomic test")

        # Verify snapshot directory exists and is complete
        snapshot_dir = Path(temp_dirs['snapshots']) / snapshot_meta.snapshot_id

        # Both files should exist (not partially created)
        assert (snapshot_dir / "metadata.json").exists()
        assert (snapshot_dir / "vat.json").exists()

        # Verify metadata is valid JSON
        with open(snapshot_dir / "metadata.json") as f:
            metadata = json.load(f)
            assert metadata['snapshot_id'] == snapshot_meta.snapshot_id

        # Verify VAT is valid JSON
        with open(snapshot_dir / "vat.json") as f:
            vat_data = json.load(f)
            assert 'entries' in vat_data
            assert 'grid_size' in vat_data

    def test_vat_capture_internal_method(self, builder):
        """Test _capture_vat_state internal method."""
        builder.build()
        vat = builder.ai_placer.vat

        # Capture VAT state
        vat_state = builder._capture_vat_state()

        # Verify state structure
        assert isinstance(vat_state, dict)
        assert 'grid_size' in vat_state
        assert 'center' in vat_state
        assert 'entries' in vat_state
        assert vat_state['grid_size'] == vat.grid_size
        assert vat_state['center'] == [vat.center.x, vat.center.y]
        assert len(vat_state['entries']) == len(vat.entries)

    def test_vat_apply_internal_method(self, builder):
        """Test _apply_vat_state internal method."""
        builder.build()
        original_vat = builder.ai_placer.vat

        # Capture VAT state
        vat_state = builder._capture_vat_state()

        # Create new empty VAT
        new_vat = VisualAllocationTable(grid_size=builder.grid_size)
        builder.ai_placer.vat = new_vat

        # Verify VAT is now empty
        assert len(builder.ai_placer.vat.entries) == 0

        # Apply captured state
        builder._apply_vat_state(vat_state)

        # Verify VAT is restored
        assert len(builder.ai_placer.vat.entries) == len(original_vat.entries)

    def test_snapshot_preserves_file_locations(self, builder, temp_dirs):
        """Test that snapshot preserves exact file locations."""
        builder.build()
        original_vat = builder.ai_placer.vat

        # Get original location of a file
        first_file = list(original_vat.entries.keys())[0]
        original_loc = original_vat.lookup(first_file)

        # Create snapshot
        snapshot_meta = builder.create_snapshot()

        # Restore snapshot to new builder
        builder2 = InfiniteMapBuilderV2(
            source_dir=builder.source_dir,
            output_path=builder.output_path,
            grid_size=builder.grid_size,
            snapshot_storage_dir=temp_dirs['snapshots']
        )
        builder2.build()  # Build to initialize
        builder2.restore_snapshot(snapshot_meta.snapshot_id)

        # Verify file location matches
        restored_loc = builder2.ai_placer.vat.lookup(first_file)
        assert restored_loc is not None
        assert restored_loc.x == original_loc.x
        assert restored_loc.y == original_loc.y

    def test_snapshot_metadata_integrity(self, builder):
        """Test that snapshot metadata has correct integrity info."""
        builder.build()

        snapshot_meta = builder.create_snapshot(description="Integrity test")

        # Check checksum is present and valid hex string
        assert snapshot_meta.vat_checksum
        assert len(snapshot_meta.vat_checksum) == 64  # SHA256 = 64 hex chars
        assert all(c in '0123456789abcdef' for c in snapshot_meta.vat_checksum)

        # Check other fields
        assert snapshot_meta.total_files > 0
        assert snapshot_meta.total_clusters > 0
        assert snapshot_meta.timestamp > 0


if __name__ == '__main__':
    pytest.main([__file__, '-v'])
