#!/usr/bin/env python3
"""
SnapshotCommitter for VM snapshot commit pipeline.

Orchestrates VM pause/resume and snapshot extraction to ensure consistent
snapshot state during the commit process. This prevents state corruption
that would occur if the VM continued writing during extraction.

Key Components:
- CommitStage: Enum for tracking commit pipeline stages
- CommitProgress: Progress tracking dataclass
- CommitResult: Result of a commit operation
- SnapshotCommitter: Main class orchestrating commit pipeline

Pipeline Order:
1. Create internal snapshot via VMSnapshotManager
2. Pause VM via QEMU monitor command
3. Extract snapshot via QemuImgWrapper
4. Resume VM via QEMU monitor command (ALWAYS, even on failure)

Usage:
    from systems.pixel_compiler.boot.snapshot_committer import SnapshotCommitter

    committer = SnapshotCommitter(boot_bridge)

    # Commit with auto-generated tag
    result = committer.commit(output_path=Path("snapshot.qcow2"))

    # Commit with custom tag
    result = committer.commit(
        output_path=Path("snapshot.qcow2"),
        tag="before-update"
    )
"""

import logging
import tempfile
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from pathlib import Path
from typing import Optional, Callable, Any

from .vm_snapshot import VMSnapshotManager, SnapshotError

# Import QemuImgWrapper from the module created in Plan 01
from .qemu_img_wrapper import QemuImgWrapper, QemuImgError

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class CommitStage(Enum):
    """Stages of the commit pipeline."""
    IDLE = "idle"
    CREATING_SNAPSHOT = "creating_snapshot"
    PAUSING_VM = "pausing_vm"
    EXTRACTING = "extracting"
    RESUMING_VM = "resuming_vm"
    COMPLETE = "complete"
    FAILED = "failed"


@dataclass
class CommitProgress:
    """Progress tracking for commit operations."""
    stage: CommitStage
    started_at: datetime
    completed_at: Optional[datetime] = None
    message: Optional[str] = None
    bytes_extracted: int = 0

    def to_dict(self) -> dict:
        """Convert to dictionary for serialization."""
        return {
            "stage": self.stage.value,
            "started_at": self.started_at.isoformat(),
            "completed_at": self.completed_at.isoformat() if self.completed_at else None,
            "message": self.message,
            "bytes_extracted": self.bytes_extracted
        }


@dataclass
class CommitResult:
    """Result of a commit operation."""
    success: bool
    output_path: Optional[Path]
    snapshot_tag: str
    size_bytes: int = 0
    error_message: Optional[str] = None
    progress: Optional[CommitProgress] = None

    def to_dict(self) -> dict:
        """Convert to dictionary for serialization."""
        return {
            "success": self.success,
            "output_path": str(self.output_path) if self.output_path else None,
            "snapshot_tag": self.snapshot_tag,
            "size_bytes": self.size_bytes,
            "error_message": self.error_message,
            "progress": self.progress.to_dict() if self.progress else None
        }


class SnapshotCommitter:
    """
    Orchestrates VM pause/resume and snapshot extraction for consistent commits.

    This class ensures that:
    1. An internal VM snapshot is created before extraction
    2. The VM is paused during extraction to prevent writes
    3. The VM is ALWAYS resumed after extraction (success or failure)
    4. The extracted snapshot is a consistent point-in-time state

    The pipeline order is critical:
    create_snapshot -> pause_vm -> extract -> resume_vm
    """

    def __init__(
        self,
        boot_bridge,
        progress_callback: Optional[Callable[[CommitProgress], None]] = None
    ):
        """
        Initialize the SnapshotCommitter.

        Args:
            boot_bridge: BootBridge instance with booted VM
            progress_callback: Optional callback for progress updates

        Raises:
            ValueError: If boot_bridge is None
        """
        if boot_bridge is None:
            raise ValueError("boot_bridge cannot be None")

        self.boot_bridge = boot_bridge
        self.progress_callback = progress_callback
        self._progress = CommitProgress(
            stage=CommitStage.IDLE,
            started_at=datetime.now()
        )

    def _update_progress(
        self,
        stage: CommitStage,
        message: Optional[str] = None,
        bytes_extracted: int = 0
    ) -> None:
        """
        Update progress and notify callback.

        Args:
            stage: New commit stage
            message: Optional status message
            bytes_extracted: Bytes extracted so far
        """
        self._progress.stage = stage
        self._progress.message = message
        self._progress.bytes_extracted = bytes_extracted

        if self.progress_callback:
            try:
                self.progress_callback(self._progress)
            except Exception as e:
                logger.warning(f"Progress callback error: {e}")

        logger.debug(f"Commit progress: {stage.value} - {message or 'in progress'}")

    def _get_qemu_boot(self):
        """
        Get the QemuBoot instance from BootBridge.

        Returns:
            QemuBoot instance

        Raises:
            SnapshotError: If VM is not booted
        """
        qemu = getattr(self.boot_bridge, '_qemu', None)
        if qemu is None:
            raise SnapshotError("VM is not booted")
        return qemu

    def _get_qcow2_path(self) -> Path:
        """
        Get the qcow2 disk path from BootBridge.

        Returns:
            Path to the qcow2 disk file

        Raises:
            SnapshotError: If disk path cannot be determined
        """
        # BootBridge stores rts_png_path which is the container
        # For actual qcow2 path, we need to check if there's a backing file
        # The QemuBoot instance should have the image_path
        qemu = self._get_qemu_boot()
        image_path = getattr(qemu, 'image_path', None)

        if image_path is None:
            # Fallback to rts_png_path from boot_bridge
            image_path = getattr(self.boot_bridge, 'rts_png_path', None)

        if image_path is None:
            raise SnapshotError("Cannot determine qcow2 disk path")

        return Path(image_path)

    def _pause_vm(self) -> None:
        """
        Pause the VM via QEMU monitor command.

        Raises:
            SnapshotError: If pause command fails
        """
        self._update_progress(CommitStage.PAUSING_VM, "Pausing VM...")
        qemu = self._get_qemu_boot()

        try:
            # Send 'stop' command to pause VM
            response = qemu.send_monitor_command('stop')
            logger.info("VM paused successfully")
        except Exception as e:
            raise SnapshotError(f"Failed to pause VM: {e}")

    def _resume_vm(self) -> None:
        """
        Resume the VM via QEMU monitor command.

        This method should be called in a finally block to ensure
        the VM is always resumed, even if extraction fails.

        Raises:
            SnapshotError: If resume command fails
        """
        self._update_progress(CommitStage.RESUMING_VM, "Resuming VM...")
        qemu = self._get_qemu_boot()

        try:
            # Send 'cont' command to resume VM
            response = qemu.send_monitor_command('cont')
            logger.info("VM resumed successfully")
        except Exception as e:
            # Log but don't raise - we want to preserve any extraction error
            logger.error(f"Failed to resume VM: {e}")
            raise SnapshotError(f"Failed to resume VM: {e}")

    def _create_snapshot(self, tag: str) -> None:
        """
        Create an internal VM snapshot.

        Args:
            tag: Snapshot tag name

        Raises:
            SnapshotError: If snapshot creation fails
        """
        self._update_progress(CommitStage.CREATING_SNAPSHOT, f"Creating snapshot '{tag}'...")

        try:
            result = self.boot_bridge.create_snapshot(tag)
            if not result.success:
                raise SnapshotError(f"Failed to create snapshot: {result.error_message}")
            logger.info(f"Internal snapshot '{tag}' created successfully")
        except SnapshotError:
            raise
        except Exception as e:
            raise SnapshotError(f"Failed to create snapshot: {e}")

    def commit(
        self,
        output_path: Path,
        tag: Optional[str] = None,
        extraction_timeout: int = 300
    ) -> CommitResult:
        """
        Commit the current VM state to a qcow2 file.

        Pipeline:
        1. Auto-generate tag if None: commit-{YYYYMMDD-HHMMSS}
        2. Create internal snapshot via VMSnapshotManager
        3. Pause VM via QEMU monitor
        4. Extract snapshot via QemuImgWrapper
        5. Resume VM (ALWAYS, even on failure)

        Args:
            output_path: Path for the output qcow2 file
            tag: Optional snapshot tag (auto-generated if None)
            extraction_timeout: Timeout for extraction in seconds

        Returns:
            CommitResult with success status and details
        """
        # Initialize progress
        started_at = datetime.now()
        self._progress = CommitProgress(
            stage=CommitStage.IDLE,
            started_at=started_at
        )

        # Auto-generate tag if not provided
        if tag is None:
            tag = datetime.now().strftime("commit-%Y%m%d-%H%M%S")

        logger.info(f"Starting commit pipeline with tag '{tag}' to {output_path}")

        # Track whether we need to resume VM
        vm_paused = False
        extraction_error = None

        try:
            # Step 1: Create internal snapshot
            self._create_snapshot(tag)

            # Step 2: Pause VM
            self._pause_vm()
            vm_paused = True

            # Step 3: Extract snapshot
            self._update_progress(
                CommitStage.EXTRACTING,
                f"Extracting snapshot '{tag}'..."
            )

            qemu_img = QemuImgWrapper()
            qcow2_path = self._get_qcow2_path()

            # Extract to a temp file first, then rename to avoid partial files
            output_path = Path(output_path)
            output_path.parent.mkdir(parents=True, exist_ok=True)

            temp_output = output_path.with_suffix('.qcow2.tmp')

            extract_result = qemu_img.extract_snapshot(
                source_qcow2=qcow2_path,
                snapshot_tag=tag,
                output_path=temp_output,
                timeout=extraction_timeout
            )

            if not extract_result.success:
                raise SnapshotError(f"Extraction failed: {extract_result.error_message}")

            # Rename temp file to final output
            temp_output.rename(output_path)

            # Get final file size
            size_bytes = output_path.stat().st_size if output_path.exists() else 0

            self._update_progress(
                CommitStage.COMPLETE,
                f"Commit complete: {size_bytes} bytes",
                bytes_extracted=size_bytes
            )

            self._progress.completed_at = datetime.now()

            logger.info(f"Commit successful: {output_path} ({size_bytes} bytes)")

            return CommitResult(
                success=True,
                output_path=output_path,
                snapshot_tag=tag,
                size_bytes=size_bytes,
                progress=self._progress
            )

        except SnapshotError as e:
            extraction_error = str(e)
            logger.error(f"Commit failed: {extraction_error}")

        except Exception as e:
            extraction_error = f"Unexpected error: {e}"
            logger.error(f"Commit failed: {extraction_error}")

        finally:
            # Step 4: ALWAYS resume VM if it was paused
            if vm_paused:
                try:
                    self._resume_vm()
                except SnapshotError as e:
                    # If resume fails, log it but preserve original error
                    logger.error(f"VM resume failed after commit error: {e}")
                    if extraction_error:
                        extraction_error = f"{extraction_error}; Resume also failed: {e}"
                    else:
                        extraction_error = f"VM resume failed: {e}"

        # If we reach here, commit failed
        self._update_progress(CommitStage.FAILED, extraction_error)
        self._progress.completed_at = datetime.now()

        return CommitResult(
            success=False,
            output_path=None,
            snapshot_tag=tag,
            error_message=extraction_error,
            progress=self._progress
        )
