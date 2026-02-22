"""
Boot Bridge for PixelRTS

Provides unified boot interface that orchestrates FUSE mount and QEMU boot
in a single call. This is the core integration layer for booting .rts.png files.

Key Features:
    - Single boot() call to mount FUSE and start QEMU
    - Automatic kernel/initrd discovery from mounted filesystem
    - Context manager support for RAII-style cleanup
    - KVM acceleration for minimal overhead (<10%)
    - Direct streaming from FUSE (no intermediate files)

Usage:
    # Context manager (recommended)
    with BootBridge("alpine.rts.png", memory="2G", cpus=2) as bridge:
        result = bridge.boot(cmdline="console=ttyS0")
        if result.success:
            # VM is running
            status = bridge.get_status()

    # Manual lifecycle
    bridge = BootBridge("alpine.rts.png")
    result = bridge.boot()
    try:
        # ... use VM ...
    finally:
        bridge.stop()
"""

import os
import logging
from dataclasses import dataclass, field
from pathlib import Path
from typing import Optional, Dict, Any, List, Union

from .mount_helper import MountHelper, MountError
from .boot_progress import BootProgress, ProgressStage

# Import QemuBoot from integration module
try:
    from systems.pixel_compiler.integration.qemu_boot import (
        QemuBoot,
        QemuConfig,
        VMStatus,
    )
except ImportError:
    try:
        from pixel_compiler.integration.qemu_boot import (
            QemuBoot,
            QemuConfig,
            VMStatus,
        )
    except ImportError:
        QemuBoot = None
        QemuConfig = None
        VMStatus = None

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


@dataclass
class BootResult:
    """
    Result of a boot operation.

    Attributes:
        success: Whether the boot succeeded
        process: QEMU subprocess.Popen object if boot succeeded
        mountpoint: Path to the FUSE mountpoint
        vnc_port: VNC port number for display access (5900 + display)
        serial_socket: Path to serial console socket
        error_message: Error description if boot failed
        pid: QEMU process ID if running
    """
    success: bool
    process: Optional[Any] = None  # subprocess.Popen when available
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


class BootBridge:
    """
    Orchestrates FUSE mount + QEMU boot for PixelRTS containers.

    Provides a single interface to boot .rts.png files by:
    1. Mounting the FUSE filesystem to access container contents
    2. Discovering kernel/initrd files from the mount
    3. Starting QEMU with direct kernel boot (streaming from FUSE)
    4. Cleaning up both FUSE and QEMU on exit

    This achieves DIRECT-01 (no manual extraction), DIRECT-02 (FUSE presents
    kernel/initrd for boot), and DIRECT-03 (<10% overhead via KVM + streaming).

    Example:
        bridge = BootBridge("alpine.rts.png", memory="2G", cpus=2)
        result = bridge.boot(cmdline="console=ttyS0")

        if result.success:
            print(f"VM running on VNC :{result.vnc_port}")
            # ... interact with VM ...
            bridge.stop()
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
    ):
        """
        Initialize BootBridge.

        Args:
            rts_png_path: Path to the PixelRTS container (.rts.png file)
            memory: Memory allocation for QEMU (default: "2G")
            cpus: Number of CPU cores (default: 2)
            vnc_display: VNC display number (default: 0, port 5900)
            verbose: Whether to show visual progress during boot (default: False)
        """
        self.rts_png_path = Path(rts_png_path).resolve()
        self.memory = memory
        self.cpus = cpus
        self.vnc_display = vnc_display
        self.verbose = verbose

        # Create progress display
        self._progress = BootProgress(verbose=verbose)

        # Runtime state
        self._mount_helper: Optional[MountHelper] = None
        self._qemu: Optional[QemuBoot] = None
        self._mounted = False
        self._booted = False

        # Validate RTS file exists
        if not self.rts_png_path.exists():
            raise MountError(f"RTS container not found: {rts_png_path}")

        # Check QEMU availability
        if QemuBoot is None:
            raise ImportError(
                "QemuBoot not available. Ensure systems.pixel_compiler.integration.qemu_boot "
                "is importable."
            )

    def boot(
        self,
        cmdline: Optional[str] = None,
        extra_qemu_args: Optional[List[str]] = None,
    ) -> BootResult:
        """
        Boot the PixelRTS container.

        This orchestrates the full boot pipeline:
        1. Mount FUSE filesystem to access container contents
        2. Discover kernel/initrd from mounted filesystem
        3. Start QEMU with direct kernel boot
        4. Return result with process info and access details

        Args:
            cmdline: Optional kernel command line parameters
            extra_qemu_args: Optional extra QEMU arguments

        Returns:
            BootResult with success status and access details
        """
        logger.info(f"Booting {self.rts_png_path}")

        try:
            # Stage 1: Parse metadata (validate RTS file)
            self._progress.start(ProgressStage.PARSING_METADATA)
            self._progress.update(1.0, "Validating RTS container")
            self._progress.complete(f"Validated: {self.rts_png_path.name}")

            # Stage 2: Mount FUSE filesystem
            self._progress.start(ProgressStage.MOUNTING_FUSE)
            self._progress.update(0.1, "Initializing FUSE mount...")
            logger.info("Mounting FUSE filesystem...")
            self._mount_helper = MountHelper(str(self.rts_png_path))
            mountpoint = self._mount_helper.mount()
            self._progress.update(0.9, f"Mountpoint: {mountpoint}")
            self._mounted = True
            self._progress.complete(f"Mounted at {mountpoint}")
            logger.info(f"Mounted at {mountpoint}")

            # Stage 3: Discover kernel/initrd
            self._progress.start(ProgressStage.DISCOVERING_BOOT_FILES)
            self._progress.update(0.3, "Scanning for boot files...")
            logger.info("Discovering boot files...")
            kernel_path, initrd_path = self._mount_helper.discover_boot_files()

            if kernel_path is None:
                error_msg = "No kernel found in container"
                logger.error(error_msg)
                self._progress.error(error_msg)
                return BootResult(
                    success=False,
                    mountpoint=mountpoint,
                    error_message=error_msg,
                )

            self._progress.update(0.8, f"Found kernel: {Path(kernel_path).name}")
            self._progress.complete(f"kernel: {Path(kernel_path).name}" +
                                   (f", initrd: {Path(initrd_path).name}" if initrd_path else ""))
            logger.info(f"Found kernel: {kernel_path}")
            if initrd_path:
                logger.info(f"Found initrd: {initrd_path}")

            # Stage 4: Prepare kernel
            self._progress.start(ProgressStage.LOADING_KERNEL)
            self._progress.update(1.0, f"Kernel ready: {Path(kernel_path).name}")
            self._progress.complete("Kernel path prepared")

            # Stage 5: Prepare initrd (if present)
            if initrd_path:
                self._progress.start(ProgressStage.LOADING_INITRD)
                self._progress.update(1.0, f"Initrd ready: {Path(initrd_path).name}")
                self._progress.complete("Initrd path prepared")

            # Create QEMU configuration (no progress bar for this fast operation)
            qemu_config = QemuConfig(
                memory=self.memory,
                cpus=self.cpus,
                vnc_display=self.vnc_display,
                vnc_enabled=True,
                serial_enabled=True,
                monitor_enabled=True,
                enable_kvm=True,  # DIRECT-03: KVM for <10% overhead
            )

            # Add extra QEMU args if provided
            if extra_qemu_args:
                qemu_config.extra_args.extend(extra_qemu_args)

            # Create QemuBoot instance
            # Note: We don't use prepare_boot() since we're using direct kernel boot
            # from the FUSE mountpoint - no intermediate files needed (DIRECT-03)
            self._qemu = QemuBoot(
                image_path=self.rts_png_path,  # For metadata/reference
                memory=self.memory,
                cpus=self.cpus,
                config=qemu_config,
            )

            # Stage 6: Start QEMU
            self._progress.start(ProgressStage.STARTING_QEMU)
            self._progress.update(0.2, "Launching QEMU process...")
            logger.info("Starting QEMU...")
            process = self._qemu.boot(
                kernel=Path(kernel_path),
                initrd=Path(initrd_path) if initrd_path else None,
                cmdline=cmdline,
            )
            self._booted = True
            self._progress.update(0.9, f"QEMU PID: {process.pid}")

            # Get access details
            status = self._qemu.get_status()

            self._progress.complete(f"QEMU running on PID {process.pid}")
            logger.info(f"QEMU started with PID {process.pid}")

            # Stage 7: Boot complete
            self._progress.start(ProgressStage.BOOT_COMPLETE)
            vnc_info = f"VNC :{status.get('vnc_port', 5900)}" if status.get('vnc_port') else ""
            self._progress.complete(f"Boot successful! {vnc_info}")

            return BootResult(
                success=True,
                process=process,
                mountpoint=mountpoint,
                vnc_port=status.get("vnc_port"),
                serial_socket=Path(status["serial_socket"]) if status.get("serial_socket") else None,
                pid=process.pid,
            )

        except MountError as e:
            error_msg = f"Mount error: {e}"
            logger.error(error_msg)
            self._progress.error(error_msg)
            self._cleanup()
            return BootResult(
                success=False,
                mountpoint=self._mount_helper.get_mountpoint() if self._mount_helper else None,
                error_message=error_msg,
            )

        except FileNotFoundError as e:
            error_msg = f"Boot file not found: {e}"
            logger.error(error_msg)
            self._progress.error(error_msg)
            self._cleanup()
            return BootResult(
                success=False,
                mountpoint=self._mount_helper.get_mountpoint() if self._mount_helper else None,
                error_message=error_msg,
            )

        except Exception as e:
            error_msg = f"Boot failed: {e}"
            logger.error(error_msg)
            self._progress.error(error_msg)
            self._cleanup()
            return BootResult(
                success=False,
                mountpoint=self._mount_helper.get_mountpoint() if self._mount_helper else None,
                error_message=error_msg,
            )

    def stop(self) -> None:
        """
        Stop QEMU and unmount FUSE filesystem.

        Safe to call multiple times. Handles cleanup in proper order:
        1. Stop QEMU process
        2. Unmount FUSE filesystem
        """
        self._cleanup()

    def _cleanup(self) -> None:
        """Internal cleanup method."""
        # Stop QEMU first
        if self._qemu is not None:
            try:
                logger.info("Stopping QEMU...")
                self._qemu.stop()
            except Exception as e:
                logger.warning(f"Error stopping QEMU: {e}")
            finally:
                self._qemu = None
                self._booted = False

        # Unmount FUSE
        if self._mount_helper is not None and self._mounted:
            try:
                logger.info("Unmounting FUSE...")
                self._mount_helper.unmount()
            except Exception as e:
                logger.warning(f"Error unmounting FUSE: {e}")
            finally:
                self._mount_helper = None
                self._mounted = False

    def get_status(self) -> Dict[str, Any]:
        """
        Get current boot status.

        Returns:
            Dictionary with:
            - mounted: Whether FUSE is mounted
            - booted: Whether QEMU is running
            - qemu_status: QEMU status dict if booted
            - mountpoint: Current mountpoint if mounted
            - rts_png_path: Path to RTS container
        """
        status = {
            "mounted": self._mounted,
            "booted": self._booted,
            "mountpoint": str(self._mount_helper.get_mountpoint()) if self._mounted and self._mount_helper else None,
            "rts_png_path": str(self.rts_png_path),
            "memory": self.memory,
            "cpus": self.cpus,
            "vnc_display": self.vnc_display,
        }

        if self._qemu is not None:
            status["qemu_status"] = self._qemu.get_status()

        return status

    def __enter__(self) -> 'BootBridge':
        """Context manager entry."""
        return self

    def __exit__(self, exc_type, exc_val, exc_tb) -> None:
        """Context manager exit - ensure cleanup."""
        self._cleanup()
        return None  # Don't suppress exceptions

    def __repr__(self) -> str:
        """String representation."""
        status = "booted" if self._booted else ("mounted" if self._mounted else "idle")
        return f"BootBridge(path={self.rts_png_path}, memory={self.memory}, cpus={self.cpus}, status={status})"
