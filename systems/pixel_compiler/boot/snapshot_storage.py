"""
Snapshot Storage for PixelRTS

Provides persistent metadata storage for VM snapshots, enabling
snapshot listing and management even when VMs are not running.

Key Components:
- SnapshotMetadata: Persistable snapshot metadata
- SnapshotStorage: Manager for snapshot metadata persistence

Storage Location: /tmp/pixelrts/snapshots/<container>/metadata.json

Usage:
    storage = SnapshotStorage()

    # Save snapshot metadata
    storage.save_metadata("alpine", metadata)

    # List all snapshots for a container
    snapshots = storage.list_snapshots("alpine")

    # Delete snapshot metadata
    storage.delete_metadata("alpine", "before-update")
"""

import json
import logging
from dataclasses import asdict, dataclass
from datetime import datetime
from pathlib import Path
from typing import Any

logger = logging.getLogger(__name__)

# Default storage location
DEFAULT_SNAPSHOT_DIR = Path("/tmp/pixelrts/snapshots")


@dataclass
class SnapshotMetadata:
    """
    Persistable snapshot metadata.

    This is a simplified version of VMSnapshotMetadata that can be
    serialized to JSON and stored on disk.
    """
    tag: str
    container_name: str
    created_at: str  # ISO format datetime string
    size: str  # Human-readable size like "2.5 GB"
    description: str | None = None
    vm_clock: str | None = None  # VM clock time at snapshot

    def to_dict(self) -> dict[str, Any]:
        """Convert to dictionary for JSON serialization."""
        return asdict(self)

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> "SnapshotMetadata":
        """Create from dictionary."""
        return cls(
            tag=data["tag"],
            container_name=data["container_name"],
            created_at=data["created_at"],
            size=data["size"],
            description=data.get("description"),
            vm_clock=data.get("vm_clock")
        )

    @classmethod
    def from_snapshot_info(cls, info: Any, container_name: str, description: str = "") -> "SnapshotMetadata":
        """
        Create from VMSnapshotManager.SnapshotInfo.

        Args:
            info: SnapshotInfo object from list_snapshots()
            container_name: Name of the container
            description: Optional description
        """
        return cls(
            tag=info.tag,
            container_name=container_name,
            created_at=str(info.date) if info.date else datetime.now().isoformat(),
            size=info.size,
            description=description or None,
            vm_clock=str(info.vm_clock) if info.vm_clock else None
        )


class SnapshotStorage:
    """
    Manages persistent storage of snapshot metadata.

    Metadata is stored in JSON files at:
    /tmp/pixelrts/snapshots/<container>/metadata.json

    Each file contains a list of SnapshotMetadata objects.
    """

    def __init__(self, snapshot_dir: Path | None = None):
        """
        Initialize snapshot storage.

        Args:
            snapshot_dir: Optional custom storage directory
        """
        self.snapshot_dir = snapshot_dir or DEFAULT_SNAPSHOT_DIR
        self._ensure_storage_dir()

    def _ensure_storage_dir(self) -> None:
        """Ensure the storage directory exists."""
        self.snapshot_dir.mkdir(parents=True, exist_ok=True)

    def _get_container_dir(self, container_name: str) -> Path:
        """Get the storage directory for a container."""
        return self.snapshot_dir / container_name

    def _get_metadata_file(self, container_name: str) -> Path:
        """Get the metadata file path for a container."""
        return self._get_container_dir(container_name) / "metadata.json"

    def _load_all_metadata(self, container_name: str) -> list[SnapshotMetadata]:
        """
        Load all metadata for a container.

        Args:
            container_name: Container name

        Returns:
            List of SnapshotMetadata objects (empty if no metadata exists)
        """
        metadata_file = self._get_metadata_file(container_name)

        if not metadata_file.exists():
            return []

        try:
            with open(metadata_file) as f:
                data = json.load(f)
                return [SnapshotMetadata.from_dict(item) for item in data]
        except (json.JSONDecodeError, KeyError) as e:
            logger.warning(f"Failed to load metadata for {container_name}: {e}")
            return []

    def _save_all_metadata(self, container_name: str, snapshots: list[SnapshotMetadata]) -> None:
        """
        Save all metadata for a container.

        Args:
            container_name: Container name
            snapshots: List of SnapshotMetadata to save
        """
        container_dir = self._get_container_dir(container_name)
        container_dir.mkdir(parents=True, exist_ok=True)

        metadata_file = self._get_metadata_file(container_name)
        data = [snap.to_dict() for snap in snapshots]

        with open(metadata_file, 'w') as f:
            json.dump(data, f, indent=2)

    def save_metadata(self, container_name: str, metadata: SnapshotMetadata) -> None:
        """
        Save or update snapshot metadata.

        Args:
            container_name: Container name
            metadata: SnapshotMetadata to save
        """
        snapshots = self._load_all_metadata(container_name)

        # Update existing or append new
        existing_idx = next(
            (i for i, s in enumerate(snapshots) if s.tag == metadata.tag),
            None
        )

        if existing_idx is not None:
            snapshots[existing_idx] = metadata
        else:
            snapshots.append(metadata)

        self._save_all_metadata(container_name, snapshots)
        logger.info(f"Saved metadata for snapshot '{metadata.tag}' in container '{container_name}'")

    def list_snapshots(self, container_name: str | None = None) -> list[SnapshotMetadata]:
        """
        List all snapshots, optionally filtered by container.

        Args:
            container_name: Optional container name filter

        Returns:
            List of SnapshotMetadata objects
        """
        if container_name:
            return self._load_all_metadata(container_name)

        # List all containers' snapshots
        all_snapshots = []
        for container_dir in self.snapshot_dir.iterdir():
            if container_dir.is_dir():
                snapshots = self._load_all_metadata(container_dir.name)
                all_snapshots.extend(snapshots)

        # Sort by creation date (newest first)
        all_snapshots.sort(key=lambda s: s.created_at, reverse=True)
        return all_snapshots

    def get_metadata(self, container_name: str, tag: str) -> SnapshotMetadata | None:
        """
        Get metadata for a specific snapshot.

        Args:
            container_name: Container name
            tag: Snapshot tag

        Returns:
            SnapshotMetadata or None if not found
        """
        snapshots = self._load_all_metadata(container_name)
        return next((s for s in snapshots if s.tag == tag), None)

    def delete_metadata(self, container_name: str, tag: str) -> bool:
        """
        Delete metadata for a snapshot.

        Args:
            container_name: Container name
            tag: Snapshot tag

        Returns:
            True if deleted, False if not found
        """
        snapshots = self._load_all_metadata(container_name)
        original_count = len(snapshots)

        snapshots = [s for s in snapshots if s.tag != tag]

        if len(snapshots) < original_count:
            self._save_all_metadata(container_name, snapshots)
            logger.info(f"Deleted metadata for snapshot '{tag}' in container '{container_name}'")
            return True

        return False

    def list_containers(self) -> list[str]:
        """
        List all containers that have snapshot metadata.

        Returns:
            List of container names
        """
        containers = []
        for item in self.snapshot_dir.iterdir():
            if item.is_dir() and (item / "metadata.json").exists():
                containers.append(item.name)
        return sorted(containers)

    def get_storage_path(self) -> Path:
        """Get the storage directory path."""
        return self.snapshot_dir
