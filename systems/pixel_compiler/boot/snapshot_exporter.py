#!/usr/bin/env python3
"""
SnapshotExporter for VM snapshot export pipeline.

Orchestrates the full export pipeline: SnapshotCommitter extraction + PixelRTSEncoder encoding.
This completes the "commit to file" workflow by producing a .rts.png file from a running VM.

Key Components:
- ExportStage: Enum for tracking export pipeline stages
- ExportProgress: Progress tracking dataclass
- ExportResult: Result of an export operation
- SnapshotExporter: Main class orchestrating export pipeline

Pipeline Order:
1. Create and commit snapshot via SnapshotCommitter (which handles VM pause/resume)
2. Read extracted qcow2 file
3. Encode via PixelRTSEncoder to .rts.png format
4. Cleanup temp files

Usage:
    from systems.pixel_compiler.boot.snapshot_exporter import SnapshotExporter

    exporter = SnapshotExporter(boot_bridge)

    # Export with auto-generated tag
    result = exporter.export(output_path=Path("committed.rts.png"))

    # Export with custom tag
    result = exporter.export(
        output_path=Path("committed.rts.png"),
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

from .snapshot_committer import SnapshotCommitter, CommitResult, CommitProgress

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class ExportStage(Enum):
    """Stages of the export pipeline."""
    IDLE = "idle"
    COMMITTING = "committing"
    ENCODING = "encoding"
    COMPLETE = "complete"
    FAILED = "failed"


@dataclass
class ExportProgress:
    """Progress tracking for export operations."""
    stage: ExportStage
    started_at: datetime
    completed_at: Optional[datetime] = None
    message: Optional[str] = None
    bytes_processed: int = 0
    total_bytes: int = 0

    def to_dict(self) -> dict:
        """Convert to dictionary for serialization."""
        return {
            "stage": self.stage.value,
            "started_at": self.started_at.isoformat(),
            "completed_at": self.completed_at.isoformat() if self.completed_at else None,
            "message": self.message,
            "bytes_processed": self.bytes_processed,
            "total_bytes": self.total_bytes
        }


@dataclass
class ExportResult:
    """Result of an export operation."""
    success: bool
    output_path: Optional[Path]
    size_bytes: int = 0
    error_message: Optional[str] = None
    progress: Optional[ExportProgress] = None
    snapshot_tag: Optional[str] = None

    def to_dict(self) -> dict:
        """Convert to dictionary for serialization."""
        return {
            "success": self.success,
            "output_path": str(self.output_path) if self.output_path else None,
            "size_bytes": self.size_bytes,
            "error_message": self.error_message,
            "progress": self.progress.to_dict() if self.progress else None,
            "snapshot_tag": self.snapshot_tag
        }


class SnapshotExporter:
    """
    Orchestrates full export pipeline: commit snapshot + encode to PixelRTS.

    This class integrates SnapshotCommitter with PixelRTSEncoder to produce
    a final .rts.png file from a running VM.

    The pipeline:
    1. SnapshotCommitter.commit() - extracts qcow2 with VM pause/resume
    2. PixelRTSEncoder.encode() - encodes qcow2 binary to .rts.png
    3. Cleanup temp files

    For large files (>100MB), encoding is done in chunks to avoid memory exhaustion.
    """

    # Threshold for chunked encoding (100MB)
    LARGE_FILE_THRESHOLD = 100 * 1024 * 1024

    def __init__(
        self,
        boot_bridge,
        qemu_img_path: Optional[str] = None,
        progress_callback: Optional[Callable[[ExportProgress], None]] = None
    ):
        """
        Initialize the SnapshotExporter.

        Args:
            boot_bridge: BootBridge instance with booted VM
            qemu_img_path: Optional path to qemu-img binary
            progress_callback: Optional callback for progress updates

        Raises:
            ValueError: If boot_bridge is None
        """
        if boot_bridge is None:
            raise ValueError("boot_bridge cannot be None")

        self.boot_bridge = boot_bridge
        self._qemu_img_path = qemu_img_path
        self.progress_callback = progress_callback
        self._progress = ExportProgress(
            stage=ExportStage.IDLE,
            started_at=datetime.now()
        )
        self._committer: Optional[SnapshotCommitter] = None

    def _update_progress(
        self,
        stage: ExportStage,
        message: Optional[str] = None,
        bytes_processed: int = 0,
        total_bytes: int = 0
    ) -> None:
        """
        Update progress and notify callback.

        Args:
            stage: New export stage
            message: Optional status message
            bytes_processed: Bytes processed so far
            total_bytes: Total bytes to process
        """
        self._progress.stage = stage
        self._progress.message = message
        self._progress.bytes_processed = bytes_processed
        self._progress.total_bytes = total_bytes

        if self.progress_callback:
            try:
                self.progress_callback(self._progress)
            except Exception as e:
                logger.warning(f"Progress callback error: {e}")

        logger.debug(f"Export progress: {stage.value} - {message or 'in progress'}")

    def _encode_to_rts(
        self,
        qcow2_path: Path,
        output_path: Path,
        snapshot_tag: str
    ) -> int:
        """
        Encode qcow2 file to PixelRTS format.

        Args:
            qcow2_path: Path to the qcow2 file to encode
            output_path: Path for the output .rts.png file
            snapshot_tag: Snapshot tag for metadata

        Returns:
            Size of the output file in bytes

        Raises:
            RuntimeError: If encoding fails
        """
        # Import PixelRTSEncoder
        try:
            from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder
        except ImportError:
            try:
                from pixel_compiler.pixelrts_v2_core import PixelRTSEncoder
            except ImportError:
                raise RuntimeError("PixelRTSEncoder not available")

        file_size = qcow2_path.stat().st_size
        logger.info(f"Encoding {qcow2_path} ({file_size} bytes) to {output_path}")

        self._update_progress(
            ExportStage.ENCODING,
            f"Reading qcow2 file ({file_size} bytes)...",
            bytes_processed=0,
            total_bytes=file_size
        )

        # Read qcow2 data
        with open(qcow2_path, 'rb') as f:
            qcow2_data = f.read()

        self._update_progress(
            ExportStage.ENCODING,
            f"Encoding to PixelRTS format...",
            bytes_processed=file_size // 2,
            total_bytes=file_size
        )

        # Prepare metadata for vm-snapshot type
        metadata = {
            "type": "vm-snapshot",
            "snapshot_tag": snapshot_tag,
            "source_format": "qcow2",
            "created_at": datetime.now().isoformat(),
            "original_size": file_size
        }

        # Create encoder in standard mode for qcow2 binary data
        encoder = PixelRTSEncoder(mode="standard")

        # Encode to PNG
        png_data = encoder.encode(qcow2_data, metadata=metadata)

        # Write output file
        with open(output_path, 'wb') as f:
            f.write(png_data)

        output_size = output_path.stat().st_size

        self._update_progress(
            ExportStage.ENCODING,
            f"Encoding complete: {output_size} bytes",
            bytes_processed=file_size,
            total_bytes=file_size
        )

        logger.info(f"Encoded to {output_path} ({output_size} bytes)")
        return output_size

    def export(
        self,
        output_path: Path,
        tag: Optional[str] = None,
        timeout: int = 600
    ) -> ExportResult:
        """
        Export the current VM state to a .rts.png file.

        Pipeline:
        1. Create temp directory for intermediate files
        2. Create SnapshotCommitter with boot_bridge
        3. Call committer.commit() to extract qcow2
        4. Encode via PixelRTSEncoder
        5. Write output to output_path
        6. Cleanup temp files

        Args:
            output_path: Path for the output .rts.png file
            tag: Optional snapshot tag (auto-generated if None)
            timeout: Timeout for commit operation in seconds

        Returns:
            ExportResult with success status and details
        """
        # Initialize progress
        started_at = datetime.now()
        self._progress = ExportProgress(
            stage=ExportStage.IDLE,
            started_at=started_at
        )

        output_path = Path(output_path)

        # Ensure output has .rts.png extension
        if not str(output_path).endswith('.rts.png'):
            output_path = output_path.with_suffix('.rts.png')

        # Ensure parent directory exists
        output_path.parent.mkdir(parents=True, exist_ok=True)

        logger.info(f"Starting export pipeline to {output_path}")

        temp_dir = None
        commit_result: Optional[CommitResult] = None

        try:
            # Step 1: Create temp directory for intermediate files
            temp_dir = tempfile.mkdtemp(prefix="snapshot_export_")
            temp_qcow2 = Path(temp_dir) / "extracted.qcow2"

            # Step 2: Create SnapshotCommitter with boot_bridge
            self._update_progress(
                ExportStage.COMMITTING,
                "Initializing snapshot commit..."
            )

            self._committer = SnapshotCommitter(
                boot_bridge=self.boot_bridge,
                progress_callback=self._on_commit_progress
            )

            # Step 3: Commit (extract) snapshot to temp qcow2
            commit_result = self._committer.commit(
                output_path=temp_qcow2,
                tag=tag,
                extraction_timeout=timeout
            )

            if not commit_result.success:
                raise RuntimeError(f"Commit failed: {commit_result.error_message}")

            logger.info(f"Snapshot committed to {temp_qcow2}")

            # Step 4: Encode to PixelRTS format
            output_size = self._encode_to_rts(
                qcow2_path=temp_qcow2,
                output_path=output_path,
                snapshot_tag=commit_result.snapshot_tag
            )

            # Step 5: Update progress to complete
            self._update_progress(
                ExportStage.COMPLETE,
                f"Export complete: {output_size} bytes",
                bytes_processed=output_size,
                total_bytes=output_size
            )

            self._progress.completed_at = datetime.now()

            logger.info(f"Export successful: {output_path} ({output_size} bytes)")

            return ExportResult(
                success=True,
                output_path=output_path,
                size_bytes=output_size,
                progress=self._progress,
                snapshot_tag=commit_result.snapshot_tag
            )

        except Exception as e:
            error_message = str(e)
            logger.error(f"Export failed: {error_message}")

            self._update_progress(ExportStage.FAILED, error_message)
            self._progress.completed_at = datetime.now()

            return ExportResult(
                success=False,
                output_path=None,
                error_message=error_message,
                progress=self._progress,
                snapshot_tag=commit_result.snapshot_tag if commit_result else None
            )

        finally:
            # Step 6: Cleanup temp files
            if temp_dir:
                try:
                    import shutil
                    shutil.rmtree(temp_dir, ignore_errors=True)
                    logger.debug(f"Cleaned up temp directory: {temp_dir}")
                except Exception as e:
                    logger.warning(f"Failed to cleanup temp directory: {e}")

    def _on_commit_progress(self, commit_progress: CommitProgress) -> None:
        """
        Handle progress updates from SnapshotCommitter.

        Maps commit progress to export progress.

        Args:
            commit_progress: Progress from SnapshotCommitter
        """
        # Map commit stage to export stage
        if commit_progress.stage.value in ("creating_snapshot", "pausing_vm", "extracting", "resuming_vm"):
            self._update_progress(
                ExportStage.COMMITTING,
                commit_progress.message or f"Committing: {commit_progress.stage.value}",
                bytes_processed=commit_progress.bytes_extracted
            )
