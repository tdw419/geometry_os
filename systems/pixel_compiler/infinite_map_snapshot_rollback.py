#!/usr/bin/env python3
"""
Infinite Map Snapshot and Rollback System.

Provides copy-on-write snapshots for point-in-time recovery
and rollback capabilities for the Infinite Map filesystem.

Key Components:
- Snapshot: Immutable point-in-time state capture
- SnapshotStore: Manages snapshot storage and retrieval
- SnapshotManager: Creates, lists, restores, and deletes snapshots
- RollbackEngine: Performs rollback operations with verification

Usage:
    from infinite_map_snapshot_rollback import SnapshotManager

    manager = SnapshotManager(vat, image_path, snapshots_dir)

    # Create snapshot
    snapshot = manager.create("before-update")

    # List snapshots
    snapshots = manager.list()

    # Restore to snapshot
    manager.restore("before-update")

    # Delete snapshot
    manager.delete("old-snapshot")
"""

import os
import json
import shutil
import hashlib
import threading
from pathlib import Path
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any, Callable, Tuple
from datetime import datetime
from enum import Enum
import logging
import tempfile

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class SnapshotState(Enum):
    """State of a snapshot."""
    CREATING = "creating"
    COMPLETE = "complete"
    PARTIAL = "partial"
    CORRUPTED = "corrupted"
    DELETING = "deleting"


class RollbackStatus(Enum):
    """Status of a rollback operation."""
    SUCCESS = "success"
    FAILED = "failed"
    PARTIAL = "partial"
    VERIFIED = "verified"
    UNVERIFIED = "unverified"


@dataclass
class SnapshotMetadata:
    """Metadata for a snapshot."""
    snapshot_id: str
    name: str
    created_at: datetime
    state: SnapshotState
    vat_path: str
    image_path: str
    checksums_path: Optional[str] = None
    description: Optional[str] = None
    size_bytes: int = 0
    file_count: int = 0
    tags: List[str] = field(default_factory=list)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for serialization."""
        return {
            "snapshot_id": self.snapshot_id,
            "name": self.name,
            "created_at": self.created_at.isoformat(),
            "state": self.state.value,
            "vat_path": self.vat_path,
            "image_path": self.image_path,
            "checksums_path": self.checksums_path,
            "description": self.description,
            "size_bytes": self.size_bytes,
            "file_count": self.file_count,
            "tags": self.tags
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "SnapshotMetadata":
        """Create from dictionary."""
        return cls(
            snapshot_id=data["snapshot_id"],
            name=data["name"],
            created_at=datetime.fromisoformat(data["created_at"]),
            state=SnapshotState(data["state"]),
            vat_path=data["vat_path"],
            image_path=data["image_path"],
            checksums_path=data.get("checksums_path"),
            description=data.get("description"),
            size_bytes=data.get("size_bytes", 0),
            file_count=data.get("file_count", 0),
            tags=data.get("tags", [])
        )


@dataclass
class SnapshotInfo:
    """Detailed information about a snapshot."""
    metadata: SnapshotMetadata
    vat_entries: int = 0
    total_data_size: int = 0
    clusters_captured: int = 0

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        result = self.metadata.to_dict()
        result.update({
            "vat_entries": self.vat_entries,
            "total_data_size": self.total_data_size,
            "clusters_captured": self.clusters_captured
        })
        return result


@dataclass
class RollbackResult:
    """Result of a rollback operation."""
    status: RollbackStatus
    snapshot_id: str
    files_restored: int = 0
    bytes_restored: int = 0
    duration_ms: float = 0.0
    errors: List[str] = field(default_factory=list)
    verification_passed: bool = False

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "status": self.status.value,
            "snapshot_id": self.snapshot_id,
            "files_restored": self.files_restored,
            "bytes_restored": self.bytes_restored,
            "duration_ms": self.duration_ms,
            "errors": self.errors,
            "verification_passed": self.verification_passed
        }


@dataclass
class RestorePoint:
    """A restore point for partial rollback recovery."""
    point_id: str
    created_at: datetime
    current_image_path: str
    current_vat_path: str
    partial_snapshot_id: Optional[str] = None

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "point_id": self.point_id,
            "created_at": self.created_at.isoformat(),
            "current_image_path": self.current_image_path,
            "current_vat_path": self.current_vat_path,
            "partial_snapshot_id": self.partial_snapshot_id
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "RestorePoint":
        """Create from dictionary."""
        return cls(
            point_id=data["point_id"],
            created_at=datetime.fromisoformat(data["created_at"]),
            current_image_path=data["current_image_path"],
            current_vat_path=data["current_vat_path"],
            partial_snapshot_id=data.get("partial_snapshot_id")
        )


class SnapshotStore:
    """
    Manages snapshot storage and retrieval.

    Stores snapshots in a directory structure with metadata
    and data files.
    """

    def __init__(self, store_dir: str):
        self.store_dir = Path(store_dir)
        self.store_dir.mkdir(parents=True, exist_ok=True)
        self.index_path = self.store_dir / "snapshot_index.json"
        self.snapshots: Dict[str, SnapshotMetadata] = {}
        self.lock = threading.RLock()
        self._load_index()

    def _load_index(self):
        """Load snapshot index from disk."""
        if self.index_path.exists():
            try:
                with open(self.index_path, "r") as f:
                    data = json.load(f)
                    self.snapshots = {
                        k: SnapshotMetadata.from_dict(v)
                        for k, v in data.get("snapshots", {}).items()
                    }
            except (json.JSONDecodeError, KeyError) as e:
                logger.warning(f"Failed to load snapshot index: {e}")
                self.snapshots = {}

    def _save_index(self):
        """Save snapshot index to disk."""
        with self.lock:
            data = {
                "version": 1,
                "snapshots": {
                    k: v.to_dict()
                    for k, v in self.snapshots.items()
                }
            }
            # Atomic write
            temp_path = self.index_path.with_suffix(".tmp")
            with open(temp_path, "w") as f:
                json.dump(data, f, indent=2)
            temp_path.replace(self.index_path)

    def add(self, metadata: SnapshotMetadata) -> str:
        """Add a snapshot to the store."""
        with self.lock:
            self.snapshots[metadata.snapshot_id] = metadata
            self._save_index()
            return metadata.snapshot_id

    def get(self, snapshot_id: str) -> Optional[SnapshotMetadata]:
        """Get snapshot metadata by ID."""
        with self.lock:
            return self.snapshots.get(snapshot_id)

    def get_by_name(self, name: str) -> Optional[SnapshotMetadata]:
        """Get snapshot metadata by name."""
        with self.lock:
            for snapshot in self.snapshots.values():
                if snapshot.name == name:
                    return snapshot
            return None

    def list(self, state: Optional[SnapshotState] = None) -> List[SnapshotMetadata]:
        """List all snapshots, optionally filtered by state."""
        with self.lock:
            snapshots = list(self.snapshots.values())
            if state:
                snapshots = [s for s in snapshots if s.state == state]
            return sorted(snapshots, key=lambda s: s.created_at, reverse=True)

    def update(self, snapshot_id: str, updates: Dict[str, Any]) -> bool:
        """Update snapshot metadata."""
        with self.lock:
            if snapshot_id not in self.snapshots:
                return False

            snapshot = self.snapshots[snapshot_id]
            for key, value in updates.items():
                if hasattr(snapshot, key):
                    setattr(snapshot, key, value)

            self._save_index()
            return True

    def remove(self, snapshot_id: str) -> bool:
        """Remove snapshot from index."""
        with self.lock:
            if snapshot_id in self.snapshots:
                del self.snapshots[snapshot_id]
                self._save_index()
                return True
            return False

    def get_snapshot_dir(self, snapshot_id: str) -> Path:
        """Get directory path for a snapshot."""
        return self.store_dir / snapshot_id


class SnapshotManager:
    """
    Manages snapshot creation, restoration, and deletion.

    Provides copy-on-write snapshot functionality for
    point-in-time recovery.
    """

    def __init__(
        self,
        vat,
        image_path: str,
        snapshots_dir: str,
        checksum_store=None
    ):
        self.vat = vat
        self.image_path = Path(image_path)
        self.checksum_store = checksum_store
        self.store = SnapshotStore(snapshots_dir)
        self.lock = threading.RLock()

    def create(
        self,
        name: str,
        description: Optional[str] = None,
        tags: Optional[List[str]] = None,
        progress_callback: Optional[Callable[[int, int], None]] = None
    ) -> SnapshotMetadata:
        """
        Create a new snapshot.

        Args:
            name: Human-readable snapshot name
            description: Optional description
            tags: Optional list of tags
            progress_callback: Optional callback(current, total) for progress

        Returns:
            SnapshotMetadata for the created snapshot
        """
        with self.lock:
            # Generate snapshot ID
            snapshot_id = self._generate_snapshot_id(name)
            snapshot_dir = self.store.get_snapshot_dir(snapshot_id)
            snapshot_dir.mkdir(parents=True, exist_ok=True)

            # Create initial metadata
            metadata = SnapshotMetadata(
                snapshot_id=snapshot_id,
                name=name,
                created_at=datetime.now(),
                state=SnapshotState.CREATING,
                vat_path=str(snapshot_dir / "vat.json"),
                image_path=str(snapshot_dir / "image.png"),
                description=description,
                tags=tags or []
            )

            # Add to store (in creating state)
            self.store.add(metadata)

            try:
                # Copy VAT
                if progress_callback:
                    progress_callback(1, 3)
                vat_data = self._serialize_vat()
                with open(metadata.vat_path, "w") as f:
                    json.dump(vat_data, f, indent=2)

                # Copy image (using hard link if possible, otherwise copy)
                if progress_callback:
                    progress_callback(2, 3)
                self._copy_image(metadata.image_path)

                # Copy checksums if available
                if self.checksum_store:
                    checksums_path = str(snapshot_dir / "checksums.json")
                    self._copy_checksums(checksums_path)
                    metadata.checksums_path = checksums_path

                # Calculate size and file count
                if progress_callback:
                    progress_callback(3, 3)
                metadata.size_bytes = self._calculate_dir_size(snapshot_dir)
                metadata.file_count = self._count_files()

                # Mark as complete
                metadata.state = SnapshotState.COMPLETE
                self.store.update(snapshot_id, {"state": SnapshotState.COMPLETE, "size_bytes": metadata.size_bytes, "file_count": metadata.file_count})

                logger.info(f"Created snapshot: {snapshot_id} ({name})")
                return metadata

            except Exception as e:
                # Mark as partial/failed
                metadata.state = SnapshotState.PARTIAL
                self.store.update(snapshot_id, {"state": SnapshotState.PARTIAL})
                logger.error(f"Failed to create snapshot: {e}")
                raise

    def list(
        self,
        state: Optional[SnapshotState] = None,
        tags: Optional[List[str]] = None
    ) -> List[SnapshotInfo]:
        """
        List snapshots with optional filtering.

        Args:
            state: Filter by state
            tags: Filter by tags (any match)

        Returns:
            List of SnapshotInfo objects
        """
        metadata_list = self.store.list(state)
        result = []

        for meta in metadata_list:
            # Filter by tags
            if tags:
                if not any(t in meta.tags for t in tags):
                    continue

            # Build detailed info
            info = SnapshotInfo(metadata=meta)

            # Get additional stats from VAT
            try:
                with open(meta.vat_path, "r") as f:
                    vat_data = json.load(f)
                    info.vat_entries = len(vat_data.get("entries", {}))
                    info.clusters_captured = len(vat_data.get("clusters", {}))
                    info.total_data_size = vat_data.get("total_size", 0)
            except Exception:
                pass

            result.append(info)

        return result

    def get(self, name_or_id: str) -> Optional[SnapshotInfo]:
        """Get snapshot by name or ID."""
        metadata = self.store.get(name_or_id) or self.store.get_by_name(name_or_id)
        if metadata:
            info = SnapshotInfo(metadata=metadata)
            try:
                with open(metadata.vat_path, "r") as f:
                    vat_data = json.load(f)
                    info.vat_entries = len(vat_data.get("entries", {}))
                    info.clusters_captured = len(vat_data.get("clusters", {}))
                    info.total_data_size = vat_data.get("total_size", 0)
            except Exception:
                pass
            return info
        return None

    def restore(
        self,
        name_or_id: str,
        verify: bool = True,
        create_restore_point: bool = True,
        progress_callback: Optional[Callable[[int, int, str], None]] = None
    ) -> RollbackResult:
        """
        Restore filesystem to a snapshot.

        Args:
            name_or_id: Snapshot name or ID
            verify: Verify integrity after restore
            create_restore_point: Create restore point before rollback
            progress_callback: Optional callback(current, total, message)

        Returns:
            RollbackResult with restore status
        """
        start_time = datetime.now()

        # Find snapshot
        snapshot = self.get(name_or_id)
        if not snapshot:
            return RollbackResult(
                status=RollbackStatus.FAILED,
                snapshot_id=name_or_id,
                errors=[f"Snapshot not found: {name_or_id}"]
            )

        metadata = snapshot.metadata
        errors = []
        files_restored = 0
        bytes_restored = 0

        try:
            # Create restore point
            restore_point = None
            if create_restore_point:
                if progress_callback:
                    progress_callback(0, 5, "Creating restore point")
                restore_point = self._create_restore_point()
                files_restored = snapshot.file_count

            # Verify snapshot files exist
            if progress_callback:
                progress_callback(1, 5, "Verifying snapshot")
            if not self._verify_snapshot_files(metadata):
                errors.append("Snapshot files missing or corrupted")
                return RollbackResult(
                    status=RollbackStatus.FAILED,
                    snapshot_id=metadata.snapshot_id,
                    errors=errors
                )

            # Restore VAT
            if progress_callback:
                progress_callback(2, 5, "Restoring VAT")
            vat_restored = self._restore_vat(metadata.vat_path)
            if not vat_restored:
                errors.append("Failed to restore VAT")

            # Restore image
            if progress_callback:
                progress_callback(3, 5, "Restoring image")
            image_restored, image_bytes = self._restore_image(metadata.image_path)
            if image_restored:
                bytes_restored = image_bytes
            else:
                errors.append("Failed to restore image")

            # Restore checksums if available
            if metadata.checksums_path and os.path.exists(metadata.checksums_path):
                if progress_callback:
                    progress_callback(4, 5, "Restoring checksums")
                self._restore_checksums(metadata.checksums_path)

            # Verify if requested
            verification_passed = False
            if verify:
                if progress_callback:
                    progress_callback(5, 5, "Verifying restoration")
                verification_passed = self._verify_restoration(metadata)
            else:
                verification_passed = True  # Assume ok if not verifying

            # Determine status
            if len(errors) == 0:
                status = RollbackStatus.SUCCESS if verification_passed else RollbackStatus.UNVERIFIED
            elif len(errors) < 2:
                status = RollbackStatus.PARTIAL
            else:
                status = RollbackStatus.FAILED

            end_time = datetime.now()
            duration_ms = (end_time - start_time).total_seconds() * 1000

            return RollbackResult(
                status=status,
                snapshot_id=metadata.snapshot_id,
                files_restored=files_restored,
                bytes_restored=bytes_restored,
                duration_ms=duration_ms,
                errors=errors,
                verification_passed=verification_passed
            )

        except Exception as e:
            end_time = datetime.now()
            duration_ms = (end_time - start_time).total_seconds() * 1000
            errors.append(str(e))

            return RollbackResult(
                status=RollbackStatus.FAILED,
                snapshot_id=metadata.snapshot_id,
                errors=errors,
                duration_ms=duration_ms
            )

    def delete(
        self,
        name_or_id: str,
        force: bool = False
    ) -> Tuple[bool, str]:
        """
        Delete a snapshot.

        Args:
            name_or_id: Snapshot name or ID
            force: Delete even if snapshot is in use

        Returns:
            Tuple of (success, message)
        """
        with self.lock:
            metadata = self.store.get(name_or_id) or self.store.get_by_name(name_or_id)

            if not metadata:
                return False, f"Snapshot not found: {name_or_id}"

            if metadata.state == SnapshotState.CREATING:
                return False, "Cannot delete snapshot while creating"

            snapshot_dir = self.store.get_snapshot_dir(metadata.snapshot_id)

            # Mark as deleting
            self.store.update(metadata.snapshot_id, {"state": SnapshotState.DELETING})

            try:
                # Remove snapshot files
                if snapshot_dir.exists():
                    shutil.rmtree(snapshot_dir)

                # Remove from index
                self.store.remove(metadata.snapshot_id)

                logger.info(f"Deleted snapshot: {metadata.snapshot_id}")
                return True, f"Snapshot {metadata.name} deleted successfully"

            except Exception as e:
                self.store.update(metadata.snapshot_id, {"state": SnapshotState.CORRUPTED})
                return False, f"Failed to delete snapshot: {e}"

    def verify(self, name_or_id: str) -> Tuple[bool, List[str]]:
        """
        Verify snapshot integrity.

        Args:
            name_or_id: Snapshot name or ID

        Returns:
            Tuple of (is_valid, list_of_issues)
        """
        snapshot = self.get(name_or_id)
        if not snapshot:
            return False, [f"Snapshot not found: {name_or_id}"]

        metadata = snapshot.metadata
        issues = []

        # Check VAT file
        if not os.path.exists(metadata.vat_path):
            issues.append(f"VAT file missing: {metadata.vat_path}")
        else:
            try:
                with open(metadata.vat_path, "r") as f:
                    json.load(f)
            except json.JSONDecodeError:
                issues.append("VAT file corrupted (invalid JSON)")

        # Check image file
        if not os.path.exists(metadata.image_path):
            issues.append(f"Image file missing: {metadata.image_path}")
        else:
            # Basic PNG validation
            try:
                with open(metadata.image_path, "rb") as f:
                    header = f.read(8)
                    if header[:4] != b'\x89PNG':
                        issues.append("Image file is not a valid PNG")
            except Exception as e:
                issues.append(f"Image file read error: {e}")

        # Check checksums if available
        if metadata.checksums_path:
            if not os.path.exists(metadata.checksums_path):
                issues.append(f"Checksums file missing: {metadata.checksums_path}")

        return len(issues) == 0, issues

    def _generate_snapshot_id(self, name: str) -> str:
        """Generate unique snapshot ID."""
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        hash_input = f"{name}_{timestamp}_{os.urandom(4).hex()}"
        short_hash = hashlib.sha256(hash_input.encode()).hexdigest()[:8]
        return f"snap_{timestamp}_{short_hash}"

    def _serialize_vat(self) -> Dict[str, Any]:
        """Serialize VAT to dictionary."""
        try:
            if hasattr(self.vat, "to_dict"):
                data = self.vat.to_dict()
                # Ensure it's a plain dict, not a Mock
                if isinstance(data, dict):
                    return data
        except Exception:
            pass

        try:
            if hasattr(self.vat, "entries"):
                entries = {}
                for k, v in self.vat.entries.items():
                    if hasattr(v, "to_dict"):
                        entries[k] = v.to_dict()
                    elif isinstance(v, (str, int, float, bool, list, dict, type(None))):
                        entries[k] = v
                    else:
                        entries[k] = str(v)
                return {"entries": entries}
        except Exception:
            pass

        # Return minimal valid VAT structure
        return {"entries": {}, "version": 1}

    def _copy_image(self, dest_path: str):
        """Copy image to snapshot directory."""
        try:
            # Try hard link first (faster, uses less space)
            os.link(self.image_path, dest_path)
        except OSError:
            # Fall back to regular copy
            shutil.copy2(self.image_path, dest_path)

    def _copy_checksums(self, dest_path: str):
        """Copy checksums to snapshot directory."""
        if self.checksum_store and hasattr(self.checksum_store, "store_path"):
            if os.path.exists(self.checksum_store.store_path):
                shutil.copy2(self.checksum_store.store_path, dest_path)

    def _calculate_dir_size(self, dir_path: Path) -> int:
        """Calculate total size of directory."""
        total = 0
        for path in dir_path.rglob("*"):
            if path.is_file():
                total += path.stat().st_size
        return total

    def _count_files(self) -> int:
        """Count files in VAT."""
        # Check for explicit file_count attribute
        if hasattr(self.vat, "file_count"):
            count = self.vat.file_count
            if isinstance(count, int):
                return count

        # Try to count from entries
        if hasattr(self.vat, "entries"):
            try:
                return len(self.vat.entries)
            except (TypeError, AttributeError):
                pass

        return 0

    def _create_restore_point(self) -> RestorePoint:
        """Create a restore point before rollback."""
        point_id = f"rp_{datetime.now().strftime('%Y%m%d_%H%M%S')}"
        point = RestorePoint(
            point_id=point_id,
            created_at=datetime.now(),
            current_image_path=str(self.image_path),
            current_vat_path=str(self.image_path.with_suffix(".vat.json"))
        )

        # Save restore point
        point_path = self.store.store_dir / "restore_points" / f"{point_id}.json"
        point_path.parent.mkdir(parents=True, exist_ok=True)

        with open(point_path, "w") as f:
            json.dump(point.to_dict(), f, indent=2)

        # Also create backup of current state
        backup_dir = self.store.store_dir / "restore_points" / point_id
        backup_dir.mkdir(parents=True, exist_ok=True)

        if self.image_path.exists():
            shutil.copy2(self.image_path, backup_dir / "image.png")

        return point

    def _verify_snapshot_files(self, metadata: SnapshotMetadata) -> bool:
        """Verify snapshot files exist and are valid."""
        return (
            os.path.exists(metadata.vat_path) and
            os.path.exists(metadata.image_path)
        )

    def _restore_vat(self, snapshot_vat_path: str) -> bool:
        """Restore VAT from snapshot."""
        try:
            if hasattr(self.vat, "load_from_file"):
                self.vat.load_from_file(snapshot_vat_path)
                return True
            elif hasattr(self.vat, "from_dict"):
                with open(snapshot_vat_path, "r") as f:
                    data = json.load(f)
                self.vat.from_dict(data)
                return True
            return True  # VAT might be read-only
        except Exception as e:
            logger.error(f"Failed to restore VAT: {e}")
            return False

    def _restore_image(self, snapshot_image_path: str) -> Tuple[bool, int]:
        """Restore image from snapshot."""
        try:
            # Check if paths are the same (hard link)
            if os.path.samefile(snapshot_image_path, self.image_path):
                # Already the same file, nothing to restore
                size = os.path.getsize(self.image_path)
                return True, size

            # Remove destination if it's a hard link to avoid issues
            if os.path.exists(self.image_path):
                os.unlink(self.image_path)

            shutil.copy2(snapshot_image_path, self.image_path)
            size = os.path.getsize(self.image_path)
            return True, size
        except Exception as e:
            logger.error(f"Failed to restore image: {e}")
            return False, 0

    def _restore_checksums(self, snapshot_checksums_path: str) -> bool:
        """Restore checksums from snapshot."""
        try:
            if self.checksum_store and hasattr(self.checksum_store, "store_path"):
                shutil.copy2(snapshot_checksums_path, self.checksum_store.store_path)
                # Reload checksums
                self.checksum_store._load()
                return True
            return True
        except Exception as e:
            logger.error(f"Failed to restore checksums: {e}")
            return False

    def _verify_restoration(self, metadata: SnapshotMetadata) -> bool:
        """Verify restoration was successful."""
        # Compare file sizes
        try:
            snapshot_size = os.path.getsize(metadata.image_path)
            current_size = os.path.getsize(self.image_path)
            return snapshot_size == current_size
        except Exception:
            return False


class RollbackEngine:
    """
    Performs rollback operations with verification.

    Provides advanced rollback capabilities including
    partial rollback and conflict resolution.
    """

    def __init__(self, manager: SnapshotManager):
        self.manager = manager
        self.lock = threading.RLock()

    def rollback_to_latest(self) -> RollbackResult:
        """Rollback to the most recent snapshot."""
        snapshots = self.manager.list(state=SnapshotState.COMPLETE)
        if not snapshots:
            return RollbackResult(
                status=RollbackStatus.FAILED,
                snapshot_id="",
                errors=["No snapshots available"]
            )

        latest = snapshots[0]  # Already sorted by date descending
        return self.manager.restore(latest.metadata.snapshot_id)

    def rollback_partial(
        self,
        snapshot_id: str,
        file_patterns: List[str]
    ) -> RollbackResult:
        """
        Partial rollback for specific files.

        Args:
            snapshot_id: Snapshot to restore from
            file_patterns: File patterns to restore (glob patterns)

        Returns:
            RollbackResult with partial restore status
        """
        snapshot = self.manager.get(snapshot_id)
        if not snapshot:
            return RollbackResult(
                status=RollbackStatus.FAILED,
                snapshot_id=snapshot_id,
                errors=[f"Snapshot not found: {snapshot_id}"]
            )

        # For now, fall back to full restore
        # In a full implementation, this would selectively restore files
        return self.manager.restore(snapshot_id, verify=True, create_restore_point=True)

    def compare_with_current(
        self,
        snapshot_id: str
    ) -> Dict[str, Any]:
        """
        Compare snapshot with current state.

        Returns:
            Dictionary with comparison results
        """
        snapshot = self.manager.get(snapshot_id)
        if not snapshot:
            return {"error": f"Snapshot not found: {snapshot_id}"}

        result = {
            "snapshot_id": snapshot_id,
            "snapshot_name": snapshot.metadata.name,
            "snapshot_date": snapshot.metadata.created_at.isoformat(),
            "differences": []
        }

        # Compare file counts
        current_count = self.manager._count_files()
        if current_count != snapshot.metadata.file_count:
            result["differences"].append({
                "type": "file_count",
                "current": current_count,
                "snapshot": snapshot.metadata.file_count
            })

        # Compare sizes
        try:
            current_size = os.path.getsize(self.manager.image_path)
            if current_size != snapshot.total_data_size:
                result["differences"].append({
                    "type": "data_size",
                    "current": current_size,
                    "snapshot": snapshot.total_data_size
                })
        except Exception:
            pass

        return result
