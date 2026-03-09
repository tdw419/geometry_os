#!/usr/bin/env python3
"""
VM Snapshot Manager for QEMU Virtual Machines.

Provides VM snapshot operations (create, list, restore, delete) via
QEMU monitor commands. Wraps the existing QemuBoot.send_monitor_command()
infrastructure.

Key Components:
- SnapshotError: Custom exception for snapshot operation failures
- SnapshotState: State of a snapshot (CREATING, COMPLETE, PARTIAL, CORRUPTED, DELETING)
- VMSnapshotMetadata: Metadata for a VM snapshot
- SnapshotResult: Result of a snapshot operation
- SnapshotInfo: Parsed information from 'info snapshots' command
- VMSnapshotManager: Manager class for VM snapshot lifecycle

Usage:
    from systems.pixel_compiler.boot.vm_snapshot import VMSnapshotManager

    manager = VMSnapshotManager(qemu_boot, container_name)

    # Create snapshot
    result = manager.create_snapshot("before-update", description="Pre-update snapshot")

    # List snapshots
    snapshots = manager.list_snapshots()

    # Restore snapshot
    result = manager.restore_snapshot("before-update")

    # Delete snapshot
    result = manager.delete_snapshot("before-update")
"""

import re
import logging
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from typing import List, Optional, Any, Dict

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class SnapshotError(Exception):
    """Exception raised for snapshot operation failures."""
    pass


class SnapshotState(Enum):
    """State of a snapshot."""
    CREATING = "creating"
    COMPLETE = "complete"
    PARTIAL = "partial"
    CORRUPTED = "corrupted"
    DELETING = "deleting"


class RestoreState(Enum):
    """State of a restore operation."""
    PENDING = "pending"
    VALIDATING = "validating"
    LOADING = "loading"
    VERIFYING = "verifying"
    COMPLETE = "complete"
    FAILED = "failed"


@dataclass
class VMSnapshotMetadata:
    """Metadata for a VM snapshot."""
    snapshot_id: str
    tag: str
    container_name: str
    created_at: datetime
    state: SnapshotState
    vm_memory: str
    description: Optional[str] = None
    size_bytes: int = 0

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for serialization."""
        return {
            "snapshot_id": self.snapshot_id,
            "tag": self.tag,
            "container_name": self.container_name,
            "created_at": self.created_at.isoformat(),
            "state": self.state.value,
            "vm_memory": self.vm_memory,
            "description": self.description,
            "size_bytes": self.size_bytes
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "VMSnapshotMetadata":
        """Create from dictionary."""
        return cls(
            snapshot_id=data["snapshot_id"],
            tag=data["tag"],
            container_name=data["container_name"],
            created_at=datetime.fromisoformat(data["created_at"]),
            state=SnapshotState(data["state"]),
            vm_memory=data["vm_memory"],
            description=data.get("description"),
            size_bytes=data.get("size_bytes", 0)
        )


@dataclass
class RestoreProgress:
    """Progress tracking for restore operations."""
    state: RestoreState
    tag: str
    started_at: datetime
    completed_at: Optional[datetime] = None
    error_message: Optional[str] = None
    pre_restore_vm_state: Optional[str] = None  # 'running', 'paused', etc.

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for serialization."""
        return {
            "state": self.state.value,
            "tag": self.tag,
            "started_at": self.started_at.isoformat(),
            "completed_at": self.completed_at.isoformat() if self.completed_at else None,
            "error_message": self.error_message,
            "pre_restore_vm_state": self.pre_restore_vm_state,
        }


@dataclass
class SnapshotResult:
    """Result of a snapshot operation."""
    success: bool
    tag: str
    metadata: Optional[VMSnapshotMetadata] = None
    error_message: Optional[str] = None
    restore_progress: Optional[RestoreProgress] = None


@dataclass
class SnapshotInfo:
    """Parsed information from 'info snapshots' command."""
    id: int
    tag: str
    size: str
    date: str
    vm_clock: str


class VMSnapshotManager:
    """
    Manages VM snapshot operations via QEMU monitor commands.

    Provides create, list, restore, and delete operations for QEMU
    VM snapshots using the existing send_monitor_command() infrastructure.
    """

    # Baseline: 2GB memory = 5 second timeout, scale linearly
    BASELINE_MEMORY_GB = 2.0
    BASELINE_TIMEOUT_SECONDS = 5.0
    MINIMUM_TIMEOUT_SECONDS = 2.0

    # Regex pattern for parsing 'info snapshots' output
    # Format: ID  TAG               VM SIZE                DATE     VM CLOCK
    # Example: 1   snapshot-1        2.5 GB      2024-01-15 14:30:00   00:01:23.456
    SNAPSHOT_LINE_PATTERN = re.compile(
        r'^\s*(\d+)\s+(\S+)\s+([\d.]+\s+\w+)\s+(\d{4}-\d{2}-\d{2}\s+\d{2}:\d{2}:\d{2})\s+([\d:.]+)'
    )

    # Tag validation pattern: alphanumeric, dash, underscore only
    TAG_PATTERN = re.compile(r'^[\w-]+$')

    def __init__(self, qemu_boot, container_name: str):
        """
        Initialize the VM snapshot manager.

        Args:
            qemu_boot: QemuBoot instance with send_monitor_command() method
            container_name: Name of the container/VM for metadata tracking

        Raises:
            ValueError: If qemu_boot is None
        """
        if qemu_boot is None:
            raise ValueError("qemu_boot cannot be None")

        self.qemu_boot = qemu_boot
        self.container_name = container_name

    def _validate_tag(self, tag: str) -> None:
        """
        Validate snapshot tag format.

        Args:
            tag: Snapshot tag to validate

        Raises:
            SnapshotError: If tag format is invalid
        """
        if not tag:
            raise SnapshotError("Snapshot tag cannot be empty")

        if not self.TAG_PATTERN.match(tag):
            raise SnapshotError(
                f"Invalid snapshot tag '{tag}': "
                "must contain only alphanumeric characters, dashes, and underscores"
            )

    def _calculate_timeout(self) -> float:
        """
        Calculate snapshot timeout based on VM memory size.

        Uses linear scaling: timeout = (memory_gb / baseline_gb) * baseline_timeout
        Minimum timeout is always enforced.

        Returns:
            Timeout in seconds
        """
        try:
            # Get memory from QemuBoot configuration
            memory_str = getattr(self.qemu_boot, 'memory', '2G')

            # Parse memory string (e.g., "2G", "512M", "4096")
            memory_gb = self._parse_memory_to_gb(memory_str)

            # Calculate timeout with linear scaling
            timeout = (memory_gb / self.BASELINE_MEMORY_GB) * self.BASELINE_TIMEOUT_SECONDS

            # Enforce minimum
            return max(timeout, self.MINIMUM_TIMEOUT_SECONDS)

        except Exception as e:
            logger.warning(f"Failed to calculate timeout, using baseline: {e}")
            return self.BASELINE_TIMEOUT_SECONDS

    def _parse_memory_to_gb(self, memory_str: str) -> float:
        """
        Parse memory string to gigabytes.

        Args:
            memory_str: Memory string like "2G", "512M", "4096"

        Returns:
            Memory size in gigabytes
        """
        memory_str = str(memory_str).strip().upper()

        # Extract numeric value and suffix
        match = re.match(r'^(\d+(?:\.\d+)?)\s*([KMGTP]?B?)?$', memory_str)
        if not match:
            return self.BASELINE_MEMORY_GB

        value = float(match.group(1))
        suffix = match.group(2) or ''

        # Convert to GB based on suffix
        multipliers = {
            '': 1 / (1024 ** 3),  # Assume bytes if no suffix
            'B': 1 / (1024 ** 3),
            'K': 1 / (1024 ** 2),
            'KB': 1 / (1024 ** 2),
            'M': 1 / 1024,
            'MB': 1 / 1024,
            'G': 1,
            'GB': 1,
            'T': 1024,
            'TB': 1024,
            'P': 1024 ** 2,
            'PB': 1024 ** 2,
        }

        return value * multipliers.get(suffix, 1 / (1024 ** 3))

    def _is_vm_running(self) -> bool:
        """
        Check if the VM is running.

        Returns:
            True if VM is running, False otherwise
        """
        # Check for process and monitor socket
        process = getattr(self.qemu_boot, '_process', None)
        monitor_socket = getattr(self.qemu_boot, '_monitor_socket', None)

        if process is None or process.poll() is not None:
            return False

        if monitor_socket is None or not monitor_socket.exists():
            return False

        return True

    def _generate_snapshot_id(self, tag: str) -> str:
        """
        Generate unique snapshot ID.

        Args:
            tag: Snapshot tag

        Returns:
            Unique snapshot ID
        """
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        return f"vmsnap_{self.container_name}_{tag}_{timestamp}"

    def create_snapshot(
        self,
        tag: str,
        description: str = "",
        timeout: Optional[float] = None
    ) -> SnapshotResult:
        """
        Create a VM snapshot.

        Args:
            tag: Unique snapshot tag (alphanumeric, dash, underscore only)
            description: Optional description for the snapshot
            timeout: Optional timeout override (calculated from memory if not provided)

        Returns:
            SnapshotResult with success status and metadata

        Raises:
            SnapshotError: If tag format is invalid
        """
        # Validate tag
        self._validate_tag(tag)

        # Check if VM is running
        if not self._is_vm_running():
            return SnapshotResult(
                success=False,
                tag=tag,
                error_message="VM is not running or monitor socket is not available"
            )

        # Calculate timeout if not provided
        if timeout is None:
            timeout = self._calculate_timeout()

        try:
            # Send savevm command via monitor
            command = f"savevm {tag}"
            logger.info(f"Creating VM snapshot '{tag}' with timeout {timeout}s")

            response = self.qemu_boot.send_monitor_command(command)

            # Create metadata
            snapshot_id = self._generate_snapshot_id(tag)
            memory_str = getattr(self.qemu_boot, 'memory', 'unknown')

            metadata = VMSnapshotMetadata(
                snapshot_id=snapshot_id,
                tag=tag,
                container_name=self.container_name,
                created_at=datetime.now(),
                state=SnapshotState.COMPLETE,
                vm_memory=str(memory_str),
                description=description if description else None
            )

            logger.info(f"VM snapshot '{tag}' created successfully")
            return SnapshotResult(
                success=True,
                tag=tag,
                metadata=metadata
            )

        except RuntimeError as e:
            error_msg = f"Failed to create snapshot: {e}"
            logger.error(error_msg)
            return SnapshotResult(
                success=False,
                tag=tag,
                error_message=error_msg
            )
        except Exception as e:
            error_msg = f"Unexpected error creating snapshot: {e}"
            logger.error(error_msg)
            return SnapshotResult(
                success=False,
                tag=tag,
                error_message=error_msg
            )

    def list_snapshots(self) -> List[SnapshotInfo]:
        """
        List all VM snapshots.

        Returns:
            List of SnapshotInfo objects parsed from 'info snapshots' output
        """
        if not self._is_vm_running():
            logger.warning("Cannot list snapshots: VM is not running")
            return []

        try:
            # Send info snapshots command
            response = self.qemu_boot.send_monitor_command("info snapshots")

            # Parse the response
            snapshots = self._parse_snapshot_list(response)

            logger.info(f"Found {len(snapshots)} VM snapshots")
            return snapshots

        except RuntimeError as e:
            logger.error(f"Failed to list snapshots: {e}")
            return []
        except Exception as e:
            logger.error(f"Unexpected error listing snapshots: {e}")
            return []

    def _parse_snapshot_list(self, response: str) -> List[SnapshotInfo]:
        """
        Parse 'info snapshots' command output.

        Args:
            response: Raw output from 'info snapshots' command

        Returns:
            List of SnapshotInfo objects
        """
        snapshots = []

        for line in response.split('\n'):
            line = line.strip()

            # Skip empty lines and header lines
            if not line or line.startswith('ID') or line.startswith('---'):
                continue

            # Try to match snapshot line pattern
            match = self.SNAPSHOT_LINE_PATTERN.match(line)
            if match:
                try:
                    snapshot = SnapshotInfo(
                        id=int(match.group(1)),
                        tag=match.group(2),
                        size=match.group(3),
                        date=match.group(4),
                        vm_clock=match.group(5)
                    )
                    snapshots.append(snapshot)
                except (ValueError, IndexError) as e:
                    logger.warning(f"Failed to parse snapshot line '{line}': {e}")
                    continue
            # Silently skip malformed lines (not matching pattern)

        return snapshots

    def restore_snapshot(self, tag: str) -> SnapshotResult:
        """
        Restore VM to a snapshot.

        Args:
            tag: Snapshot tag to restore

        Returns:
            SnapshotResult with success status
        """
        # Validate tag
        self._validate_tag(tag)

        # Check if VM is running
        if not self._is_vm_running():
            return SnapshotResult(
                success=False,
                tag=tag,
                error_message="VM is not running or monitor socket is not available"
            )

        # Verify snapshot exists
        snapshots = self.list_snapshots()
        snapshot_tags = [s.tag for s in snapshots]

        if tag not in snapshot_tags:
            return SnapshotResult(
                success=False,
                tag=tag,
                error_message=f"Snapshot '{tag}' not found. Available: {snapshot_tags}"
            )

        try:
            # Send loadvm command
            command = f"loadvm {tag}"
            logger.info(f"Restoring VM to snapshot '{tag}'")

            response = self.qemu_boot.send_monitor_command(command)

            logger.info(f"VM restored to snapshot '{tag}' successfully")
            return SnapshotResult(
                success=True,
                tag=tag
            )

        except RuntimeError as e:
            error_msg = f"Failed to restore snapshot: {e}"
            logger.error(error_msg)
            return SnapshotResult(
                success=False,
                tag=tag,
                error_message=error_msg
            )
        except Exception as e:
            error_msg = f"Unexpected error restoring snapshot: {e}"
            logger.error(error_msg)
            return SnapshotResult(
                success=False,
                tag=tag,
                error_message=error_msg
            )

    def delete_snapshot(self, tag: str) -> SnapshotResult:
        """
        Delete a VM snapshot.

        Args:
            tag: Snapshot tag to delete

        Returns:
            SnapshotResult with success status
        """
        # Validate tag
        self._validate_tag(tag)

        # Check if VM is running
        if not self._is_vm_running():
            return SnapshotResult(
                success=False,
                tag=tag,
                error_message="VM is not running or monitor socket is not available"
            )

        try:
            # Send delvm command
            command = f"delvm {tag}"
            logger.info(f"Deleting VM snapshot '{tag}'")

            response = self.qemu_boot.send_monitor_command(command)

            logger.info(f"VM snapshot '{tag}' deleted successfully")
            return SnapshotResult(
                success=True,
                tag=tag
            )

        except RuntimeError as e:
            error_msg = f"Failed to delete snapshot: {e}"
            logger.error(error_msg)
            return SnapshotResult(
                success=False,
                tag=tag,
                error_message=error_msg
            )
        except Exception as e:
            error_msg = f"Unexpected error deleting snapshot: {e}"
            logger.error(error_msg)
            return SnapshotResult(
                success=False,
                tag=tag,
                error_message=error_msg
            )
