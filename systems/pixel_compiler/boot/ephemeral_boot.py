#!/usr/bin/env python3
"""
EphemeralBooter for temporary container boot.

Boots .rts.png files in ephemeral mode where all changes are discarded on exit.
This is achieved by copying the source file to a temp location before boot,
ensuring the original file remains untouched.

Key Features:
- Temp file management with automatic cleanup
- Works with both bootable and vm-snapshot container types
- Context manager support for RAII-style cleanup
- Preserves original path for commit operations

Usage:
    # Context manager (recommended)
    with EphemeralBooter("alpine.rts.png", memory="2G", cpus=2) as booter:
        result = booter.boot(cmdline="console=ttyS0")
        if result.success:
            # VM is running, changes go to temp copy
            # Original file unchanged
            pass

    # Manual lifecycle
    booter = EphemeralBooter("alpine.rts.png")
    result = booter.boot()
    try:
        # ... use VM ...
    finally:
        booter.stop()  # Cleans up temp file, original unchanged
"""

import atexit
import logging
import tempfile
import shutil
from pathlib import Path
from typing import Optional, Any, Dict, Union, List

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class EphemeralBootError(Exception):
    """Exception for ephemeral boot errors."""
    pass


# Import BootResult from boot_bridge
try:
    from .boot_bridge import BootResult
except ImportError:
    try:
        from systems.pixel_compiler.boot.boot_bridge import BootResult
    except ImportError:
        from dataclasses import dataclass

        @dataclass
        class BootResult:
            """Result of a boot operation."""
            success: bool
            process: Optional[Any] = None
            mountpoint: Optional[Path] = None
            vnc_port: Optional[int] = None
            serial_socket: Optional[Path] = None
            error_message: Optional[str] = None
            pid: Optional[int] = None

            def to_dict(self) -> Dict[str, Any]:
                """Convert to dictionary."""
                return {
                    "success": self.success,
                    "mountpoint": str(self.mountpoint) if self.mountpoint else None,
                    "vnc_port": self.vnc_port,
                    "serial_socket": str(self.serial_socket) if self.serial_socket else None,
                    "error_message": self.error_message,
                    "pid": self.pid,
                }


class EphemeralBooter:
    """
    Wraps BootBridge/CommittedFileBooter with temp file management for ephemeral boot.

    This class enables ephemeral boot mode where:
    1. Source file is copied to a temp location on init
    2. All boot operations use the temp copy
    3. Original file remains unchanged
    4. Temp files are cleaned up on stop() or context exit

    The class automatically detects container type (bootable vs vm-snapshot) and
    delegates to the appropriate inner booter (BootBridge for bootable,
    CommittedFileBooter for vm-snapshot).

    Example:
        booter = EphemeralBooter("alpine.rts.png", memory="2G", cpus=2)
        result = booter.boot()

        if result.success:
            print(f"VM running on VNC :{result.vnc_port}")
            # Original file at booter.original_path is unchanged
            booter.stop()  # Discards all changes
        else:
            print(f"Boot failed: {result.error_message}")
    """

    def __init__(
        self,
        rts_png_path: Union[str, Path],
        memory: str = "2G",
        cpus: int = 2,
        vnc_display: int = 0,
        verbose: bool = False,
        network_mode: Optional[Any] = None,
        socket_config: Optional[Any] = None,
    ):
        """
        Initialize EphemeralBooter.

        Creates a temp copy of the source file for ephemeral boot operations.
        The original file is never modified.

        Args:
            rts_png_path: Path to the PixelRTS container (.rts.png file)
            memory: Memory allocation for QEMU (default: "2G")
            cpus: Number of CPU cores (default: 2)
            vnc_display: VNC display number (default: 0, port 5900)
            verbose: Whether to show verbose output (default: False)
            network_mode: Network mode for QEMU (NetworkMode enum, default: USER)
            socket_config: VirtualNetworkConfig for socket networking (optional)

        Raises:
            FileNotFoundError: If rts_png_path does not exist
            EphemeralBootError: If temp file creation fails
        """
        self._original_path = Path(rts_png_path).resolve()
        self.memory = memory
        self.cpus = cpus
        self.vnc_display = vnc_display
        self.verbose = verbose
        self.network_mode = network_mode
        self.socket_config = socket_config

        # Validate file exists
        if not self._original_path.exists():
            raise FileNotFoundError(f"RTS container not found: {rts_png_path}")

        # Create temp directory and copy source file
        try:
            self._temp_dir = tempfile.mkdtemp(prefix="pixelrts-ephemeral-")
            temp_file_name = self._original_path.name
            self._temp_path = Path(self._temp_dir) / temp_file_name

            # Copy source file to temp location
            shutil.copy2(self._original_path, self._temp_path)
            logger.info(f"Created ephemeral copy: {self._temp_path}")
            logger.info(f"Original preserved at: {self._original_path}")

        except Exception as e:
            # Clean up temp dir if copy failed
            if hasattr(self, '_temp_dir') and self._temp_dir:
                shutil.rmtree(self._temp_dir, ignore_errors=True)
            raise EphemeralBootError(f"Failed to create temp copy: {e}")

        # Runtime state
        self._inner_booter: Optional[Any] = None
        self._booted = False
        self._cleaned_up = False

        # Detect container type and create appropriate inner booter
        self._container_type = self._detect_container_type()
        self._create_inner_booter()

        # Mark as ephemeral
        self.is_ephemeral = True

        # Register cleanup with atexit for crash/process exit handling
        atexit.register(self._cleanup_temp_dir)

        logger.info(f"EphemeralBooter initialized for {self._original_path}")
        logger.info(f"Container type: {self._container_type.value}")

    def _detect_container_type(self) -> Any:
        """
        Detect the container type from PNG metadata.

        Returns:
            ContainerType enum value
        """
        try:
            from .committed_boot import CommittedFileBooter, ContainerType
            return CommittedFileBooter.detect_container_type(self._temp_path)
        except ImportError:
            try:
                from systems.pixel_compiler.boot.committed_boot import (
                    CommittedFileBooter, ContainerType
                )
                return CommittedFileBooter.detect_container_type(self._temp_path)
            except ImportError:
                # Default to bootable if detection unavailable
                logger.warning("ContainerType detection unavailable, defaulting to bootable")
                return ContainerType.BOOTABLE

    def _create_inner_booter(self) -> None:
        """Create the appropriate inner booter based on container type."""
        try:
            from .committed_boot import CommittedFileBooter, ContainerType
            from .boot_bridge import BootBridge
        except ImportError:
            try:
                from systems.pixel_compiler.boot.committed_boot import (
                    CommittedFileBooter, ContainerType
                )
                from systems.pixel_compiler.boot.boot_bridge import BootBridge
            except ImportError:
                raise EphemeralBootError("Required boot modules not available")

        if self._container_type == ContainerType.VM_SNAPSHOT:
            # Use CommittedFileBooter for vm-snapshot type
            self._inner_booter = CommittedFileBooter(
                self._temp_path,
                memory=self.memory,
                cpus=self.cpus,
                vnc_display=self.vnc_display,
                verbose=self.verbose,
                network_mode=self.network_mode,
                socket_config=self.socket_config,
            )
            logger.info("Using CommittedFileBooter for vm-snapshot container")
        else:
            # Use BootBridge for bootable type
            self._inner_booter = BootBridge(
                self._temp_path,
                memory=self.memory,
                cpus=self.cpus,
                vnc_display=self.vnc_display,
                verbose=self.verbose,
                network_mode=self.network_mode,
                socket_config=self.socket_config,
            )
            logger.info("Using BootBridge for bootable container")

    def boot(
        self,
        cmdline: Optional[str] = None,
        extra_qemu_args: Optional[List[str]] = None,
    ) -> BootResult:
        """
        Boot the PixelRTS container in ephemeral mode.

        Delegates to the inner booter's boot() method. All changes are
        made to the temp copy, not the original file.

        Args:
            cmdline: Optional kernel command line parameters
            extra_qemu_args: Optional extra QEMU arguments

        Returns:
            BootResult with success status and access details
        """
        if self._cleaned_up:
            return BootResult(
                success=False,
                error_message="EphemeralBooter has been cleaned up",
            )

        if self._inner_booter is None:
            return BootResult(
                success=False,
                error_message="Inner booter not initialized",
            )

        logger.info(f"Booting ephemeral copy: {self._temp_path}")

        try:
            result = self._inner_booter.boot(
                cmdline=cmdline,
                extra_qemu_args=extra_qemu_args,
            )

            if result.success:
                self._booted = True
                logger.info(f"Ephemeral boot successful, PID: {result.pid}")
            else:
                # Boot failed - clean up temp directory immediately
                logger.error(f"Ephemeral boot failed: {result.error_message}")
                self._cleanup_temp_dir()

            return result

        except Exception as e:
            error_msg = f"Ephemeral boot failed: {e}"
            logger.error(error_msg)
            self._cleanup_temp_dir()
            return BootResult(
                success=False,
                error_message=error_msg,
            )

    def stop(self) -> None:
        """
        Stop the VM and clean up temp files.

        Safe to call multiple times. Handles cleanup in proper order:
        1. Stop inner booter (which stops QEMU)
        2. Remove temp directory
        """
        self._cleanup()

    def _cleanup(self) -> None:
        """Internal cleanup method."""
        if self._cleaned_up:
            return

        # Stop inner booter first
        if self._inner_booter is not None:
            try:
                logger.info("Stopping inner booter...")
                self._inner_booter.stop()
            except Exception as e:
                logger.warning(f"Error stopping inner booter: {e}")
            finally:
                self._inner_booter = None
                self._booted = False

        # Clean up temp directory
        self._cleanup_temp_dir()

        # Unregister from atexit since we've cleaned up explicitly
        atexit.unregister(self._cleanup_temp_dir)

        self._cleaned_up = True

    def _cleanup_temp_dir(self) -> None:
        """Remove the temp directory and all its contents."""
        if self._temp_dir:
            try:
                logger.info(f"Cleaning up temp directory: {self._temp_dir}")
                shutil.rmtree(self._temp_dir, ignore_errors=True)
            except Exception as e:
                logger.warning(f"Error cleaning up temp directory: {e}")
            finally:
                self._temp_dir = None
                self._temp_path = None

    def get_status(self) -> Dict[str, Any]:
        """
        Get current boot status.

        Returns:
            Dictionary with:
            - ephemeral: Always True for EphemeralBooter
            - booted: Whether VM is running
            - original_path: Path to original source file
            - temp_path: Path to temp copy (None if cleaned up)
            - inner_status: Status dict from inner booter
        """
        status: Dict[str, Any] = {
            "ephemeral": True,
            "booted": self._booted,
            "original_path": str(self._original_path),
            "temp_path": str(self._temp_path) if self._temp_path else None,
            "container_type": self._container_type.value if self._container_type else None,
            "memory": self.memory,
            "cpus": self.cpus,
            "vnc_display": self.vnc_display,
        }

        if self._inner_booter is not None:
            try:
                status["inner_status"] = self._inner_booter.get_status()
            except Exception as e:
                status["inner_status_error"] = str(e)

        return status

    @property
    def original_path(self) -> Path:
        """
        Get the path to the original source file.

        This is useful for commit operations that need to reference the
        original file location.

        Returns:
            Path to the original source file
        """
        return self._original_path

    def __enter__(self) -> 'EphemeralBooter':
        """Context manager entry."""
        return self

    def __exit__(self, exc_type, exc_val, exc_tb) -> None:
        """Context manager exit - ensure cleanup."""
        self._cleanup()
        return None  # Don't suppress exceptions

    def __repr__(self) -> str:
        """String representation."""
        status = "booted" if self._booted else ("cleaned" if self._cleaned_up else "idle")
        return (
            f"EphemeralBooter(original={self._original_path}, "
            f"memory={self.memory}, cpus={self.cpus}, status={status})"
        )
