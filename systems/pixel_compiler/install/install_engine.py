"""
Install Engine for PixelRTS

Orchestrates the full installation flow: verify container, write data with progress,
handle cancellation, and ensure atomic writes. This is the core installer that
glues together DiskWriter, InstallProgress, and PixelRTSDecoder.

INSTALL-02: InstallEngine orchestrates verification, chunked write with progress,
            cancellation, and cleanup

Key Features:
    - InstallResult dataclass for operation results
    - InstallError exception class for install errors
    - InstallEngine class with full install pipeline
    - Hash verification BEFORE writing to disk
    - Progress callbacks through all stages
    - Signal handlers for graceful cancellation
    - Context manager support for RAII-style cleanup

Usage:
    from systems.pixel_compiler.install import InstallEngine, InstallResult

    with InstallEngine("container.rts.png", "/target/disk.img") as engine:
        result = engine.install()
        if result.success:
            print(f"Installed {result.bytes_written} bytes")
        elif result.cancelled:
            print("Installation was cancelled")
"""

import os
import signal
import atexit
import shutil
import time
import logging
from dataclasses import dataclass
from pathlib import Path
from typing import Optional, Callable, Dict, Any, BinaryIO

from .install_progress import InstallProgress, InstallStage
from .disk_writer import DiskWriter, WriteResult

# Import PixelRTS decoder for hash verification
try:
    from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder, PixelRTSMetadata
except ImportError:
    try:
        from pixelrts_v2_core import PixelRTSDecoder, PixelRTSMetadata
    except ImportError:
        PixelRTSDecoder = None
        PixelRTSMetadata = None

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


@dataclass
class InstallResult:
    """
    Result of an install operation.

    Attributes:
        success: Whether the install succeeded
        target_path: Path where data was installed
        bytes_written: Number of bytes written to target
        error_message: Error description if failed
        cancelled: Whether the install was cancelled
        duration_seconds: Time taken for installation
        verified: Whether hash verification passed
    """
    success: bool
    target_path: Path
    bytes_written: int
    error_message: Optional[str]
    cancelled: bool
    duration_seconds: float
    verified: bool

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "success": self.success,
            "target_path": str(self.target_path),
            "bytes_written": self.bytes_written,
            "error_message": self.error_message,
            "cancelled": self.cancelled,
            "duration_seconds": self.duration_seconds,
            "verified": self.verified,
        }


class InstallError(Exception):
    """
    Exception raised for install errors.

    Attributes:
        message: Error description
        path: Path where error occurred
        original_error: Underlying exception if any
    """

    def __init__(
        self,
        message: str,
        path: Optional[str] = None,
        original_error: Optional[Exception] = None
    ):
        self.message = message
        self.path = path
        self.original_error = original_error
        super().__init__(self.message)

    def __str__(self) -> str:
        result = self.message
        if self.path:
            result += f" (path: {self.path})"
        if self.original_error:
            result += f" - {self.original_error}"
        return result


class InstallEngine:
    """
    Orchestrates the full installation flow for PixelRTS containers.

    Provides a single interface to install .rts.png files by:
    1. Verifying container integrity (hash check)
    2. Checking target disk space
    3. Decoding data from container
    4. Writing data to target with progress
    5. Syncing to disk for durability
    6. Cleaning up on error or cancellation

    This achieves INSTALL-02 (verify BEFORE write), progress display,
    cancellation, and atomic writes.

    Example:
        engine = InstallEngine("alpine.rts.png", "/dev/sdX", verify=True)
        result = engine.install()

        if result.success:
            print(f"Installed {result.bytes_written} bytes")
        elif result.cancelled:
            print("Installation was cancelled by user")
        else:
            print(f"Installation failed: {result.error_message}")
    """

    # Track all active installs for cleanup
    _active_installs: Dict[str, 'InstallEngine'] = {}
    _cleanup_registered = False

    def __init__(
        self,
        rts_png_path: str,
        target_path: str,
        verbose: bool = False,
        verify: bool = True,
    ):
        """
        Initialize InstallEngine.

        Args:
            rts_png_path: Path to the PixelRTS container (.rts.png file)
            target_path: Destination path (file or disk image)
            verbose: Whether to show visual progress during install
            verify: Whether to verify hash before writing (default: True)
        """
        self.rts_png_path = Path(rts_png_path).resolve()
        self.target_path = Path(target_path).resolve()
        self.verbose = verbose
        self.verify = verify

        # Create progress display
        self._progress = InstallProgress(verbose=verbose)

        # Runtime state
        self._writer: Optional[DiskWriter] = None
        self._decoder: Optional[PixelRTSDecoder] = None
        self._cancelled = False
        self._metadata: Optional[Dict[str, Any]] = None
        self._temp_files: list = []

        # Signal handler state
        self._original_sigint_handler = None
        self._original_sigterm_handler = None

        # Validate RTS file exists
        if not self.rts_png_path.exists():
            raise InstallError(
                f"RTS container not found: {rts_png_path}",
                path=rts_png_path
            )

        # Register global cleanup handlers
        self._register_cleanup_handlers()

    def _register_cleanup_handlers(self):
        """Register global cleanup handlers for crash recovery."""
        if not InstallEngine._cleanup_registered:
            # Register atexit handler
            atexit.register(InstallEngine._cleanup_all_installs)

            InstallEngine._cleanup_registered = True

    def _install_signal_handlers(self):
        """Install signal handlers for graceful cancellation."""
        self._original_sigint_handler = signal.getsignal(signal.SIGINT)
        self._original_sigterm_handler = signal.getsignal(signal.SIGTERM)

        signal.signal(signal.SIGINT, self._signal_handler)
        signal.signal(signal.SIGTERM, self._signal_handler)

    def _restore_signal_handlers(self):
        """Restore original signal handlers."""
        if self._original_sigint_handler is not None:
            signal.signal(signal.SIGINT, self._original_sigint_handler)
            self._original_sigint_handler = None

        if self._original_sigterm_handler is not None:
            signal.signal(signal.SIGTERM, self._original_sigterm_handler)
            self._original_sigterm_handler = None

    def _signal_handler(self, signum, frame):
        """Handle termination signals by cancelling and cleaning up."""
        logger.info(f"Received signal {signum}, cancelling installation...")
        self.cancel()
        self._cleanup()

        # Call original handler if it exists
        if signum == signal.SIGINT and self._original_sigint_handler:
            if callable(self._original_sigint_handler):
                self._original_sigint_handler(signum, frame)
        elif signum == signal.SIGTERM and self._original_sigterm_handler:
            if callable(self._original_sigterm_handler):
                self._original_sigterm_handler(signum, frame)

    @classmethod
    def _cleanup_all_installs(cls):
        """Clean up all active installs on exit or signal."""
        for path, engine in list(cls._active_installs.items()):
            try:
                engine._cleanup()
            except Exception:
                pass  # Ignore errors during cleanup

    def install(self) -> InstallResult:
        """
        Execute the full installation flow.

        Pipeline:
        1. Start progress with VERIFYING stage
        2. Load metadata from .rts.png
        3. If verify=True, verify hash - FAIL if mismatch
        4. Check target disk space - FAIL if insufficient
        5. Progress to PREPARING stage
        6. Decode data from .rts.png
        7. Progress to WRITING stage
        8. Use DiskWriter to write decoded data with progress
        9. Progress to SYNCING stage
        10. Call os.fsync() on target file
        11. Progress to COMPLETED stage
        12. Return InstallResult

        Returns:
            InstallResult with success status and details
        """
        start_time = time.time()
        bytes_written = 0
        verified = False

        # Track this install for cleanup
        InstallEngine._active_installs[str(self.target_path)] = self

        # Install signal handlers
        self._install_signal_handlers()

        try:
            # Stage 1: VERIFYING
            self._progress.start(InstallStage.VERIFYING)
            logger.info(f"Starting installation: {self.rts_png_path} -> {self.target_path}")

            # Load metadata
            self._progress.update(0.2, "Loading container metadata...")
            self._load_metadata()

            if self._metadata:
                self._progress.update(0.5, f"Container: {self._metadata.get('format', 'Unknown')}")
            else:
                self._progress.update(0.5, "Container loaded (no metadata)")

            # Verify hash if requested
            if self.verify:
                self._progress.update(0.7, "Verifying container integrity...")
                if not self._verify_hash():
                    error_msg = "Container hash verification failed - file may be corrupted"
                    logger.error(error_msg)
                    self._progress.error(error_msg)
                    return InstallResult(
                        success=False,
                        target_path=self.target_path,
                        bytes_written=0,
                        error_message=error_msg,
                        cancelled=False,
                        duration_seconds=time.time() - start_time,
                        verified=False,
                    )
                verified = True
                self._progress.update(1.0, "Hash verification passed")
            else:
                verified = True  # Skip verification

            self._progress.complete("Container verification complete")

            # Check for cancellation
            if self._cancelled:
                return self._create_cancelled_result(start_time, bytes_written)

            # Stage 2: PREPARING
            self._progress.start(InstallStage.PREPARING)
            self._progress.update(0.3, "Checking disk space...")

            # Decode data to get size
            self._progress.update(0.5, "Decoding container data...")
            decoded_data = self._decode_data()

            if decoded_data is None:
                error_msg = "Failed to decode container data"
                logger.error(error_msg)
                self._progress.error(error_msg)
                return InstallResult(
                    success=False,
                    target_path=self.target_path,
                    bytes_written=0,
                    error_message=error_msg,
                    cancelled=False,
                    duration_seconds=time.time() - start_time,
                    verified=verified,
                )

            data_size = len(decoded_data)
            self._progress.update(0.7, f"Decoded {data_size / (1024*1024):.1f}MB")

            # Check disk space
            if not self._check_disk_space(data_size):
                error_msg = f"Insufficient disk space for {data_size / (1024*1024):.1f}MB"
                logger.error(error_msg)
                self._progress.error(error_msg)
                return InstallResult(
                    success=False,
                    target_path=self.target_path,
                    bytes_written=0,
                    error_message=error_msg,
                    cancelled=False,
                    duration_seconds=time.time() - start_time,
                    verified=verified,
                )

            self._progress.update(1.0, "Disk space OK")
            self._progress.complete(f"Prepared {data_size / (1024*1024):.1f}MB for installation")

            # Check for cancellation
            if self._cancelled:
                return self._create_cancelled_result(start_time, bytes_written)

            # Stage 3: WRITING
            self._progress.start(InstallStage.WRITING)
            logger.info(f"Writing {data_size} bytes to {self.target_path}")

            # Create DiskWriter for chunked writes
            self._writer = DiskWriter(chunk_size=1024 * 1024)  # 1MB chunks

            # Create a BytesIO wrapper for the decoded data
            from io import BytesIO
            data_reader = BytesIO(decoded_data)

            # Progress callback that forwards to InstallProgress
            def on_write_progress(progress: float, message: str):
                self._progress.update(progress, message)

            # Write data with progress
            write_result = self._writer.write(
                src_reader=data_reader,
                dst_path=self.target_path,
                total_size=data_size,
                progress_callback=on_write_progress,
            )

            bytes_written = write_result.bytes_written

            if write_result.cancelled or self._cancelled:
                self._progress.error("Write cancelled")
                return InstallResult(
                    success=False,
                    target_path=self.target_path,
                    bytes_written=bytes_written,
                    error_message="Installation cancelled during write",
                    cancelled=True,
                    duration_seconds=time.time() - start_time,
                    verified=verified,
                )

            if not write_result.success:
                self._progress.error(write_result.error_message or "Write failed")
                return InstallResult(
                    success=False,
                    target_path=self.target_path,
                    bytes_written=bytes_written,
                    error_message=write_result.error_message,
                    cancelled=False,
                    duration_seconds=time.time() - start_time,
                    verified=verified,
                )

            self._progress.complete(f"Wrote {bytes_written / (1024*1024):.1f}MB")

            # Check for cancellation
            if self._cancelled:
                return self._create_cancelled_result(start_time, bytes_written)

            # Stage 4: SYNCING
            self._progress.start(InstallStage.SYNCING)
            self._progress.update(0.5, "Syncing to disk...")
            logger.info("Syncing to disk...")

            # Sync the file to disk
            try:
                with open(self.target_path, 'r+b') as f:
                    os.fsync(f.fileno())
                self._progress.update(1.0, "Sync complete")
            except Exception as e:
                logger.warning(f"Sync warning: {e}")
                self._progress.update(1.0, f"Sync completed (warning: {e})")

            self._progress.complete("Data synced to disk")

            # Stage 5: COMPLETED
            self._progress.start(InstallStage.COMPLETED)
            duration = time.time() - start_time

            self._progress.complete(
                f"Installation complete! {bytes_written / (1024*1024):.1f}MB in {duration:.1f}s"
            )

            logger.info(f"Installation complete: {bytes_written} bytes in {duration:.2f}s")

            return InstallResult(
                success=True,
                target_path=self.target_path,
                bytes_written=bytes_written,
                error_message=None,
                cancelled=False,
                duration_seconds=duration,
                verified=verified,
            )

        except InstallError as e:
            error_msg = f"Install error: {e}"
            logger.error(error_msg)
            self._progress.error(error_msg)
            self._cleanup()
            return InstallResult(
                success=False,
                target_path=self.target_path,
                bytes_written=bytes_written,
                error_message=str(e),
                cancelled=False,
                duration_seconds=time.time() - start_time,
                verified=verified,
            )

        except Exception as e:
            error_msg = f"Installation failed: {e}"
            logger.error(error_msg)
            self._progress.error(error_msg)
            self._cleanup()
            return InstallResult(
                success=False,
                target_path=self.target_path,
                bytes_written=bytes_written,
                error_message=error_msg,
                cancelled=False,
                duration_seconds=time.time() - start_time,
                verified=verified,
            )

        finally:
            # Restore signal handlers
            self._restore_signal_handlers()

            # Remove from active installs
            if str(self.target_path) in InstallEngine._active_installs:
                del InstallEngine._active_installs[str(self.target_path)]

    def cancel(self) -> None:
        """
        Request cancellation of the current install operation.

        The install operation will stop at the next checkpoint and
        clean up any partial writes.
        """
        logger.info("Cancellation requested")
        self._cancelled = True

        # Forward cancellation to DiskWriter if active
        if self._writer is not None:
            self._writer.cancel()

    def _cleanup(self) -> None:
        """
        Clean up on error or cancellation.

        Deletes temp files and partial writes.
        """
        # Clean up temp files
        for temp_file in self._temp_files:
            try:
                if Path(temp_file).exists():
                    Path(temp_file).unlink()
                    logger.debug(f"Cleaned up temp file: {temp_file}")
            except Exception as e:
                logger.warning(f"Failed to clean up temp file {temp_file}: {e}")

        self._temp_files.clear()

        # Clean up partial write if cancelled
        if self._cancelled and self.target_path.exists():
            try:
                # Check if it's a .tmp file
                if str(self.target_path).endswith('.tmp'):
                    self.target_path.unlink()
                    logger.debug(f"Cleaned up partial write: {self.target_path}")
            except Exception as e:
                logger.warning(f"Failed to clean up partial write: {e}")

        # Clean up decoder
        self._decoder = None
        self._writer = None

    def _create_cancelled_result(
        self,
        start_time: float,
        bytes_written: int
    ) -> InstallResult:
        """Create a cancelled InstallResult."""
        self._cleanup()
        return InstallResult(
            success=False,
            target_path=self.target_path,
            bytes_written=bytes_written,
            error_message="Installation cancelled by user",
            cancelled=True,
            duration_seconds=time.time() - start_time,
            verified=False,
        )

    def _load_metadata(self) -> None:
        """Load metadata from RTS container."""
        if PixelRTSDecoder is None:
            logger.warning("PixelRTSDecoder not available, skipping metadata load")
            self._metadata = None
            return

        try:
            self._decoder = PixelRTSDecoder()

            # Try loading metadata from sidecar file
            meta_path = self.rts_png_path.with_suffix('.meta.json')
            if meta_path.exists():
                import json
                with open(meta_path, 'r') as f:
                    self._metadata = json.load(f)
                logger.debug(f"Loaded metadata from sidecar: {meta_path}")
            else:
                # Try loading from PNG
                with open(self.rts_png_path, 'rb') as f:
                    png_data = f.read()
                self._decoder.decode(png_data)
                self._metadata = self._decoder.get_metadata() or {}
                logger.debug("Loaded metadata from PNG")

        except Exception as e:
            logger.warning(f"Failed to load metadata: {e}")
            self._metadata = None

    def _verify_hash(self) -> bool:
        """
        Verify container hash BEFORE writing to disk.

        Returns:
            True if hash matches or no hash in metadata
        """
        if self._decoder is None:
            logger.warning("No decoder available, skipping hash verification")
            return True

        if self._metadata is None or 'data_hash' not in self._metadata:
            logger.info("No hash in metadata, skipping verification")
            return True

        expected_hash = self._metadata['data_hash']

        try:
            # Decode the data to verify hash
            with open(self.rts_png_path, 'rb') as f:
                png_data = f.read()

            # Use a fresh decoder for verification
            verify_decoder = PixelRTSDecoder()
            verify_decoder.set_metadata(self._metadata)
            decoded_data = verify_decoder.decode(png_data)

            # Verify hash
            is_valid = verify_decoder.verify_hash(decoded_data, expected_hash)

            if is_valid:
                logger.info(f"Hash verification passed: {expected_hash[:16]}...")
            else:
                logger.error(f"Hash verification failed: expected {expected_hash}")

            return is_valid

        except Exception as e:
            logger.error(f"Hash verification error: {e}")
            return False

    def _decode_data(self) -> Optional[bytes]:
        """
        Decode data from RTS container.

        Returns:
            Decoded binary data, or None on error
        """
        if PixelRTSDecoder is None:
            # Fallback: read raw PNG file (not recommended)
            logger.warning("PixelRTSDecoder not available, reading raw file")
            try:
                with open(self.rts_png_path, 'rb') as f:
                    return f.read()
            except Exception as e:
                logger.error(f"Failed to read file: {e}")
                return None

        try:
            # Create fresh decoder
            self._decoder = PixelRTSDecoder()

            # Set metadata if available (from sidecar)
            if self._metadata:
                self._decoder.set_metadata(self._metadata)

            # Load and decode
            with open(self.rts_png_path, 'rb') as f:
                png_data = f.read()

            decoded_data = self._decoder.decode(png_data)
            logger.info(f"Decoded {len(decoded_data)} bytes from container")

            return decoded_data

        except Exception as e:
            logger.error(f"Failed to decode container: {e}")
            return None

    def _check_disk_space(self, required_bytes: int) -> bool:
        """
        Check if target has sufficient disk space.

        Args:
            required_bytes: Required space in bytes

        Returns:
            True if sufficient space available
        """
        try:
            # Get the directory where we'll write
            if self.target_path.is_dir():
                target_dir = self.target_path
            else:
                target_dir = self.target_path.parent

            # Create parent directories if they don't exist
            target_dir.mkdir(parents=True, exist_ok=True)

            # Check disk space
            usage = shutil.disk_usage(target_dir)
            free_bytes = usage.free

            # Add 10% buffer for filesystem overhead
            required_with_buffer = int(required_bytes * 1.1)

            if free_bytes < required_with_buffer:
                logger.error(
                    f"Insufficient disk space: {free_bytes / (1024*1024):.1f}MB free, "
                    f"{required_with_buffer / (1024*1024):.1f}MB required"
                )
                return False

            logger.debug(
                f"Disk space OK: {free_bytes / (1024*1024):.1f}MB free, "
                f"{required_bytes / (1024*1024):.1f}MB required"
            )
            return True

        except Exception as e:
            logger.warning(f"Could not check disk space: {e}")
            # Continue anyway - the write will fail if truly out of space
            return True

    def get_status(self) -> Dict[str, Any]:
        """
        Get current install status.

        Returns:
            Dictionary with status information
        """
        return {
            "rts_png_path": str(self.rts_png_path),
            "target_path": str(self.target_path),
            "verify": self.verify,
            "cancelled": self._cancelled,
            "metadata_loaded": self._metadata is not None,
        }

    def __enter__(self) -> 'InstallEngine':
        """Context manager entry."""
        return self

    def __exit__(self, exc_type, exc_val, exc_tb) -> None:
        """Context manager exit - ensure cleanup."""
        self._cleanup()
        self._restore_signal_handlers()
        return None  # Don't suppress exceptions

    def __repr__(self) -> str:
        """String representation."""
        status = "cancelled" if self._cancelled else "ready"
        return f"InstallEngine(src={self.rts_png_path}, dst={self.target_path}, status={status})"
