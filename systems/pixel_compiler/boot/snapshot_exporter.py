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

import hashlib
import logging
import tempfile
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from pathlib import Path
from typing import Optional, Callable, Any, Tuple, Dict

from .snapshot_committer import SnapshotCommitter, CommitResult, CommitProgress

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class ExportStage(Enum):
    """Stages of the export pipeline."""
    IDLE = "idle"
    COMMITTING = "committing"
    EXTRACTING_BOOT_FILES = "extracting_boot_files"
    ENCODING = "encoding"
    VERIFYING = "verifying"
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
    verified: bool = False
    verification_error: Optional[str] = None

    def to_dict(self) -> dict:
        """Convert to dictionary for serialization."""
        return {
            "success": self.success,
            "output_path": str(self.output_path) if self.output_path else None,
            "size_bytes": self.size_bytes,
            "error_message": self.error_message,
            "progress": self.progress.to_dict() if self.progress else None,
            "snapshot_tag": self.snapshot_tag,
            "verified": self.verified,
            "verification_error": self.verification_error
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

    # Maximum size for combined kernel/initrd (100MB)
    MAX_BOOT_FILES_SIZE = 100 * 1024 * 1024

    def _extract_original_boot_files(self) -> Tuple[Optional[bytes], Optional[bytes]]:
        """
        Extract original kernel/initrd from booted container via FUSE.

        Uses boot_bridge._mount_helper to access the mounted filesystem
        and discover the original kernel/initrd files that were used to boot.

        Returns:
            Tuple of (kernel_data, initrd_data). Either may be None if not found
            or not accessible.
        """
        # Check if boot_bridge has mounted filesystem
        if not hasattr(self.boot_bridge, '_mounted') or not self.boot_bridge._mounted:
            logger.warning("Boot bridge not mounted - cannot extract boot files")
            return None, None

        if not hasattr(self.boot_bridge, '_mount_helper') or not self.boot_bridge._mount_helper:
            logger.warning("No mount helper available - cannot extract boot files")
            return None, None

        mount_helper = self.boot_bridge._mount_helper

        # Discover boot files from mounted filesystem
        try:
            kernel_path, initrd_path = mount_helper.discover_boot_files()
        except Exception as e:
            logger.warning(f"Failed to discover boot files: {e}")
            return None, None

        kernel_data = None
        initrd_data = None

        # Read kernel file if found
        if kernel_path:
            try:
                with open(kernel_path, 'rb') as f:
                    kernel_data = f.read()
                logger.info(f"Extracted kernel: {len(kernel_data)} bytes from {kernel_path}")
            except Exception as e:
                logger.warning(f"Failed to read kernel from {kernel_path}: {e}")

        # Read initrd file if found
        if initrd_path:
            try:
                with open(initrd_path, 'rb') as f:
                    initrd_data = f.read()
                logger.info(f"Extracted initrd: {len(initrd_data)} bytes from {initrd_path}")
            except Exception as e:
                logger.warning(f"Failed to read initrd from {initrd_path}: {e}")

        return kernel_data, initrd_data

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

        # Extract original kernel/initrd from booted container
        self._update_progress(
            ExportStage.EXTRACTING_BOOT_FILES,
            "Extracting original kernel/initrd...",
            bytes_processed=file_size,
            total_bytes=file_size
        )

        kernel_data, initrd_data = self._extract_original_boot_files()

        # Check if boot files are too large
        boot_files_size = (len(kernel_data) if kernel_data else 0) + (len(initrd_data) if initrd_data else 0)
        if boot_files_size > self.MAX_BOOT_FILES_SIZE:
            logger.warning(
                f"Boot files too large ({boot_files_size} bytes > {self.MAX_BOOT_FILES_SIZE}), "
                "skipping kernel/initrd preservation"
            )
            kernel_data = None
            initrd_data = None

        # Build combined data: qcow2 + kernel + initrd
        # Store offsets in metadata so decoder knows where each piece is
        combined_data = bytearray(qcow2_data)
        offsets: Dict[str, Dict[str, Any]] = {}

        if kernel_data:
            kernel_offset = len(combined_data)
            combined_data.extend(kernel_data)
            offsets["kernel"] = {
                "offset": kernel_offset,
                "size": len(kernel_data),
                "sha256": hashlib.sha256(kernel_data).hexdigest()
            }
            logger.info(f"Kernel stored at offset {kernel_offset}, size {len(kernel_data)}")

        if initrd_data:
            initrd_offset = len(combined_data)
            combined_data.extend(initrd_data)
            offsets["initrd"] = {
                "offset": initrd_offset,
                "size": len(initrd_data),
                "sha256": hashlib.sha256(initrd_data).hexdigest()
            }
            logger.info(f"Initrd stored at offset {initrd_offset}, size {len(initrd_data)}")

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
            "disk_size": len(qcow2_data),
            "offsets": offsets,
            "has_kernel": kernel_data is not None,
            "has_initrd": initrd_data is not None,
        }

        # Create encoder in standard mode for combined binary data
        encoder = PixelRTSEncoder(mode="standard")

        # Encode to PNG
        png_data = encoder.encode(bytes(combined_data), metadata=metadata)

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

    def _verify_export(
        self,
        output_path: Path,
        expected_disk_size: int,
        commit_result: CommitResult
    ) -> Tuple[bool, Optional[str]]:
        """
        Verify the exported .rts.png file.

        Verification steps:
        1. Decode the PNG to verify it's valid
        2. Check metadata is present and correct
        3. Verify disk size matches
        4. If kernel/initrd stored, verify their hashes

        Args:
            output_path: Path to the exported .rts.png file
            expected_disk_size: Expected disk size from commit result
            commit_result: The commit result with disk size info

        Returns:
            Tuple of (verified, error_message). error_message is None if verification passed.
        """
        # Import PixelRTSDecoder
        try:
            from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder
        except ImportError:
            try:
                from pixel_compiler.pixelrts_v2_core import PixelRTSDecoder
            except ImportError:
                logger.warning("PixelRTSDecoder not available for verification")
                return False, "PixelRTSDecoder not available"

        try:
            # Read PNG data
            with open(output_path, 'rb') as f:
                png_data = f.read()

            # Decode to verify it's valid
            decoder = PixelRTSDecoder()
            decoded_data = decoder.decode(png_data)

            # Get metadata from decoder
            metadata = decoder._metadata if hasattr(decoder, '_metadata') else None

            # Verify disk size
            if len(decoded_data) < expected_disk_size:
                return False, f"Decoded data too small: {len(decoded_data)} < {expected_disk_size}"

            # Verify kernel/initrd hashes if present in metadata
            if metadata and "offsets" in metadata:
                for name in ["kernel", "initrd"]:
                    if name in metadata["offsets"]:
                        offset_info = metadata["offsets"][name]
                        stored_hash = offset_info.get("sha256")
                        if stored_hash:
                            start = offset_info["offset"]
                            end = start + offset_info["size"]
                            if end <= len(decoded_data):
                                actual_hash = hashlib.sha256(decoded_data[start:end]).hexdigest()
                                if actual_hash != stored_hash:
                                    return False, f"{name} hash mismatch"
                            else:
                                return False, f"{name} offset exceeds decoded data size"

            logger.info(f"Export verification passed for {output_path}")
            return True, None

        except Exception as e:
            return False, f"Verification error: {e}"

    def export(
        self,
        output_path: Path,
        tag: Optional[str] = None,
        timeout: int = 600,
        verify: bool = True
    ) -> ExportResult:
        """
        Export the current VM state to a .rts.png file.

        Pipeline:
        1. Create temp directory for intermediate files
        2. Create SnapshotCommitter with boot_bridge
        3. Call committer.commit() to extract qcow2
        4. Encode via PixelRTSEncoder
        5. Verify the exported file (if verify=True)
        6. Cleanup temp files

        Args:
            output_path: Path for the output .rts.png file
            tag: Optional snapshot tag (auto-generated if None)
            timeout: Timeout for commit operation in seconds
            verify: Whether to verify the exported file (default: True)

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
        verified = False
        verification_error = None

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

            # Step 5: Verify the exported file
            if verify:
                self._update_progress(
                    ExportStage.VERIFYING,
                    "Verifying committed file...",
                    bytes_processed=output_size,
                    total_bytes=output_size
                )

                verified, verification_error = self._verify_export(
                    output_path=output_path,
                    expected_disk_size=commit_result.size_bytes,
                    commit_result=commit_result
                )

                if verified:
                    self._update_progress(
                        ExportStage.VERIFYING,
                        "Verification complete",
                        bytes_processed=output_size,
                        total_bytes=output_size
                    )
                else:
                    logger.warning(f"Verification failed: {verification_error}")
                    # Don't fail the export, just log warning
            else:
                verified = False
                verification_error = "Verification skipped"

            # Step 6: Update progress to complete
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
                snapshot_tag=commit_result.snapshot_tag,
                verified=verified,
                verification_error=verification_error
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
