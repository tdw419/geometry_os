#!/usr/bin/env python3
"""
Tests for Infinite Map Snapshot and Restore System.

Tests capturing and restoring complete Infinite Map state.
"""

import pytest
import json
import tempfile
from pathlib import Path
from systems.pixel_compiler.infinite_map_snapshot import (
    SnapshotManager,
    SnapshotMetadata,
    SnapshotError
)


def test_snapshot_metadata_creation():
    """SnapshotMetadata captures snapshot info."""
    meta = SnapshotMetadata(
        snapshot_id="test-snap-1",
        timestamp=1234567890.0,
        grid_size=2048,
        total_files=42,
        total_clusters=100,
        vat_checksum="abc123",
        description="Test snapshot"
    )

    assert meta.snapshot_id == "test-snap-1"
    assert meta.timestamp == 1234567890.0
    assert meta.grid_size == 2048
    assert meta.total_files == 42
    assert meta.description == "Test snapshot"


def test_snapshot_metadata_to_dict():
    """SnapshotMetadata serializes to dict."""
    meta = SnapshotMetadata(
        snapshot_id="snap-2",
        timestamp=1234567890.0,
        grid_size=1024,
        total_files=10,
        total_clusters=25,
        vat_checksum="def456",
        description="Another snapshot"
    )

    data = meta.to_dict()

    assert data['snapshot_id'] == "snap-2"
    assert data['timestamp'] == 1234567890.0
    assert data['grid_size'] == 1024
    assert data['total_files'] == 10
    assert data['description'] == "Another snapshot"


def test_snapshot_metadata_from_dict():
    """SnapshotMetadata deserializes from dict."""
    data = {
        'snapshot_id': 'snap-3',
        'timestamp': 1234567890.0,
        'grid_size': 512,
        'total_files': 5,
        'total_clusters': 12,
        'vat_checksum': 'ghi789',
        'description': 'Yet another snapshot'
    }

    meta = SnapshotMetadata.from_dict(data)

    assert meta.snapshot_id == "snap-3"
    assert meta.timestamp == 1234567890.0
    assert meta.grid_size == 512


def test_snapshot_manager_initialization():
    """SnapshotManager initializes with storage directory."""
    with tempfile.TemporaryDirectory() as tmpdir:
        manager = SnapshotManager(storage_dir=tmpdir)

        assert manager.storage_dir == Path(tmpdir)
        assert manager.list_snapshots() == []


def test_create_snapshot():
    """SnapshotManager creates snapshot from VAT."""
    with tempfile.TemporaryDirectory() as tmpdir:
        manager = SnapshotManager(storage_dir=tmpdir)

        # Create mock VAT
        from systems.pixel_compiler.infinite_map_v2 import (
            VisualAllocationTable, ClusterLocation
        )
        vat = VisualAllocationTable(
            grid_size=1024,
            center=ClusterLocation(x=512, y=512),
            entries={
                "file1": [ClusterLocation(x=100, y=100)],
                "file2": [ClusterLocation(x=200, y=200)]
            }
        )

        # Create snapshot
        meta = manager.create_snapshot(
            vat=vat,
            description="Test snapshot"
        )

        assert meta is not None
        assert meta.total_files == 2
        assert meta.grid_size == 1024
        assert meta.description == "Test snapshot"


def test_restore_snapshot():
    """SnapshotManager restores VAT from snapshot."""
    with tempfile.TemporaryDirectory() as tmpdir:
        manager = SnapshotManager(storage_dir=tmpdir)

        # Create and save snapshot
        from systems.pixel_compiler.infinite_map_v2 import (
            VisualAllocationTable, ClusterLocation
        )
        original_vat = VisualAllocationTable(
            grid_size=512,
            center=ClusterLocation(x=256, y=256),
            entries={
                "boot/vmlinuz": [ClusterLocation(x=50, y=50)],
                "etc/config": [ClusterLocation(x=100, y=100)]
            }
        )

        meta = manager.create_snapshot(
            vat=original_vat,
            description="Restore test"
        )

        # Restore snapshot
        restored_vat = manager.restore_snapshot(meta.snapshot_id)

        assert restored_vat is not None
        assert restored_vat.grid_size == original_vat.grid_size
        assert restored_vat.center.x == original_vat.center.x
        assert restored_vat.center.y == original_vat.center.y
        assert len(restored_vat.entries) == len(original_vat.entries)


def test_list_snapshots():
    """SnapshotManager lists all snapshots."""
    with tempfile.TemporaryDirectory() as tmpdir:
        manager = SnapshotManager(storage_dir=tmpdir)

        from systems.pixel_compiler.infinite_map_v2 import (
            VisualAllocationTable, ClusterLocation
        )
        vat = VisualAllocationTable(
            grid_size=256,
            center=ClusterLocation(x=128, y=128),
            entries={}
        )

        # Create multiple snapshots
        manager.create_snapshot(vat=vat, description="Snap 1")
        manager.create_snapshot(vat=vat, description="Snap 2")
        manager.create_snapshot(vat=vat, description="Snap 3")

        # List snapshots (sorted by timestamp, newest first)
        snapshots = manager.list_snapshots()

        assert len(snapshots) == 3
        # Snapshots are sorted by timestamp (newest first)
        assert snapshots[0]['description'] == "Snap 3"
        assert snapshots[1]['description'] == "Snap 2"
        assert snapshots[2]['description'] == "Snap 1"


def test_delete_snapshot():
    """SnapshotManager deletes snapshot."""
    with tempfile.TemporaryDirectory() as tmpdir:
        manager = SnapshotManager(storage_dir=tmpdir)

        from systems.pixel_compiler.infinite_map_v2 import (
            VisualAllocationTable, ClusterLocation
        )
        vat = VisualAllocationTable(
            grid_size=256,
            center=ClusterLocation(x=128, y=128),
            entries={}
        )

        # Create snapshot
        meta = manager.create_snapshot(vat=vat, description="To delete")

        # Verify it exists
        snapshots = manager.list_snapshots()
        assert len(snapshots) == 1

        # Delete snapshot
        result = manager.delete_snapshot(meta.snapshot_id)
        assert result is True

        # Verify it's gone
        snapshots = manager.list_snapshots()
        assert len(snapshots) == 0


def test_delete_nonexistent_snapshot():
    """Deleting non-existent snapshot returns False."""
    with tempfile.TemporaryDirectory() as tmpdir:
        manager = SnapshotManager(storage_dir=tmpdir)

        result = manager.delete_snapshot("nonexistent-id")
        assert result is False


def test_export_import_snapshot():
    """SnapshotManager exports and imports snapshots."""
    with tempfile.TemporaryDirectory() as tmpdir:
        manager = SnapshotManager(storage_dir=tmpdir)

        from systems.pixel_compiler.infinite_map_v2 import (
            VisualAllocationTable, ClusterLocation
        )
        vat = VisualAllocationTable(
            grid_size=512,
            center=ClusterLocation(x=256, y=256),
            entries={
                "kernel": [ClusterLocation(x=10, y=10)]
            }
        )

        # Create and export snapshot
        meta = manager.create_snapshot(vat=vat, description="Export test")

        export_path = Path(tmpdir) / "export.json"
        manager.export_snapshot(meta.snapshot_id, str(export_path))

        assert export_path.exists()

        # Import snapshot
        imported_meta = manager.import_snapshot(str(export_path))

        assert imported_meta.snapshot_id == meta.snapshot_id
        assert imported_meta.description == meta.description


def test_snapshot_auto_incrementing_id():
    """SnapshotManager auto-increments snapshot IDs."""
    with tempfile.TemporaryDirectory() as tmpdir:
        manager = SnapshotManager(storage_dir=tmpdir)

        from systems.pixel_compiler.infinite_map_v2 import (
            VisualAllocationTable, ClusterLocation
        )
        vat = VisualAllocationTable(
            grid_size=256,
            center=ClusterLocation(x=128, y=128),
            entries={}
        )

        # Create multiple snapshots
        meta1 = manager.create_snapshot(vat=vat)
        meta2 = manager.create_snapshot(vat=vat)
        meta3 = manager.create_snapshot(vat=vat)

        # IDs should increment
        assert meta1.snapshot_id != meta2.snapshot_id
        assert meta2.snapshot_id != meta3.snapshot_id


def test_get_snapshot_metadata():
    """SnapshotManager retrieves metadata for specific snapshot."""
    with tempfile.TemporaryDirectory() as tmpdir:
        manager = SnapshotManager(storage_dir=tmpdir)

        from systems.pixel_compiler.infinite_map_v2 import (
            VisualAllocationTable, ClusterLocation
        )
        vat = VisualAllocationTable(
            grid_size=512,
            center=ClusterLocation(x=256, y=256),
            entries={}
        )

        # Create snapshot with specific description
        meta = manager.create_snapshot(
            vat=vat,
            description="Metadata test"
        )

        # Retrieve metadata
        retrieved_meta = manager.get_snapshot_metadata(meta.snapshot_id)

        assert retrieved_meta is not None
        assert retrieved_meta.snapshot_id == meta.snapshot_id
        assert retrieved_meta.description == "Metadata test"


def test_restore_nonexistent_snapshot_raises_error():
    """Restoring non-existent snapshot raises error."""
    with tempfile.TemporaryDirectory() as tmpdir:
        manager = SnapshotManager(storage_dir=tmpdir)

        with pytest.raises(SnapshotError):
            manager.restore_snapshot("nonexistent-id")
