#!/usr/bin/env python3
"""
CommittedFileBooter for vm-snapshot container boot.

Boots .rts.png files that contain vm-snapshot type containers by extracting
the embedded qcow2 disk and booting via QEMU with direct kernel boot.

This class handles the "boot from committed file" workflow, where a committed
.rts.png file (created by SnapshotExporter) can be booted directly without
going through the FUSE mount path used by BootBridge.

Key Features:
- Container type detection (vm-snapshot vs bootable)
- Metadata extraction from PNG tEXt chunks
- qcow2 disk extraction from PixelRTS container
- QEMU boot with disk persistence (snapshot=off)
- Automatic cleanup via context manager

Usage:
    # Context manager (recommended)
    with CommittedFileBooter("committed.rts.png") as booter:
        result = booter.boot(cmdline="console=ttyS0")
        if result.success:
            # VM is running with disk changes persisting to extracted qcow2
            pass

    # Manual lifecycle
    booter = CommittedFileBooter("committed.rts.png")
    result = booter.boot()
    try:
        # ... use VM ...
    finally:
        booter.stop()
"""

import logging
import shutil
import tempfile
from dataclasses import dataclass
from enum import Enum
from pathlib import Path
from typing import Any

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class CommittedBootError(Exception):
    """Exception for committed file boot errors."""
    pass


class ContainerType(Enum):
    """Types of containers that can be detected in .rts.png files."""
    BOOTABLE = "bootable"      # Standard bootable container (FUSE mount)
    VM_SNAPSHOT = "vm-snapshot"  # VM snapshot with embedded qcow2


@dataclass
class CommittedFileMetadata:
    """
    Metadata extracted from a committed .rts.png file.

    Attributes:
        container_type: Type of container (vm-snapshot or bootable)
        snapshot_tag: Tag of the snapshot if vm-snapshot type
        original_kernel: Path to original kernel (if stored during commit)
        original_initrd: Path to original initrd (if stored during commit)
        source_format: Source format of the disk (e.g., "qcow2")
        disk_size: Size of the embedded disk in bytes
        created_at: ISO timestamp of when the file was created
    """
    container_type: ContainerType
    snapshot_tag: str | None = None
    original_kernel: str | None = None
    original_initrd: str | None = None
    source_format: str | None = None
    disk_size: int | None = None
    created_at: str | None = None

    def to_dict(self) -> dict[str, Any]:
        """Convert to dictionary."""
        return {
            "container_type": self.container_type.value,
            "snapshot_tag": self.snapshot_tag,
            "original_kernel": self.original_kernel,
            "original_initrd": self.original_initrd,
            "source_format": self.source_format,
            "disk_size": self.disk_size,
            "created_at": self.created_at,
        }


# Import BootResult from boot_bridge (copy dataclass if import fails)
try:
    from .boot_bridge import BootResult
except ImportError:
    try:
        from systems.pixel_compiler.boot.boot_bridge import BootResult
    except ImportError:
        # Copy BootResult dataclass to avoid circular import
        @dataclass
        class BootResult:
            """Result of a boot operation."""
            success: bool
            process: Any | None = None
            mountpoint: Path | None = None
            vnc_port: int | None = None
            serial_socket: Path | None = None
            error_message: str | None = None
            pid: int | None = None

            def to_dict(self) -> dict[str, Any]:
                """Convert to dictionary."""
                return {
                    "success": self.success,
                    "mountpoint": str(self.mountpoint) if self.mountpoint else None,
                    "vnc_port": self.vnc_port,
                    "serial_socket": str(self.serial_socket) if self.serial_socket else None,
                    "error_message": self.error_message,
                    "pid": self.pid,
                }


class CommittedFileBooter:
    """
    Boots vm-snapshot type .rts.png files by extracting and booting the embedded qcow2.

    This class provides a dedicated boot path for committed files created by
    SnapshotExporter. Unlike BootBridge which uses FUSE mounting, this class:

    1. Detects container type from PNG metadata
    2. Extracts the embedded qcow2 disk to a temp file
    3. Boots QEMU with the extracted disk (changes persist to temp qcow2)
    4. Cleans up temp files on stop()

    For vm-snapshot containers:
    - The qcow2 IS the disk image
    - Boot with -drive file=qcow2,snapshot=off to persist changes
    - Kernel/initrd discovery from qcow2 if not in metadata

    Example:
        booter = CommittedFileBooter("committed.rts.png", memory="2G", cpus=2)
        result = booter.boot()

        if result.success:
            print(f"VM running on VNC :{result.vnc_port}")
            # ... interact with VM ...
            booter.stop()
        else:
            print(f"Boot failed: {result.error_message}")
    """

    def __init__(
        self,
        rts_png_path: str | Path,
        memory: str = "2G",
        cpus: int = 2,
        vnc_display: int = 0,
        verbose: bool = False,
        network_mode: Any | None = None,
        socket_config: Any | None = None,
    ):
        """
        Initialize CommittedFileBooter.

        Args:
            rts_png_path: Path to the committed .rts.png file
            memory: Memory allocation for QEMU (default: "2G")
            cpus: Number of CPU cores (default: 2)
            vnc_display: VNC display number (default: 0, port 5900)
            verbose: Whether to show verbose output (default: False)
            network_mode: Network mode for QEMU (NetworkMode enum, default: USER)
            socket_config: VirtualNetworkConfig for socket networking (optional)

        Raises:
            FileNotFoundError: If rts_png_path does not exist
        """
        self.rts_png_path = Path(rts_png_path).resolve()
        self.memory = memory
        self.cpus = cpus
        self.vnc_display = vnc_display
        self.verbose = verbose
        self.network_mode = network_mode
        self.socket_config = socket_config

        # Runtime state
        self._temp_dir: str | None = None
        self._extracted_qcow2: Path | None = None
        self._qemu: Any | None = None  # QemuBoot instance
        self._booted = False

        # Decoded state (populated by extract_qcow2)
        self._decoder: Any | None = None  # PixelRTSDecoder instance
        self._decoded_metadata: dict[str, Any] | None = None
        self._decoded_data: bytes | None = None

        # Validate file exists
        if not self.rts_png_path.exists():
            raise FileNotFoundError(f"Committed file not found: {rts_png_path}")

        logger.info(f"CommittedFileBooter initialized for {self.rts_png_path}")

    @staticmethod
    def detect_container_type(rts_png_path: str | Path) -> ContainerType:
        """
        Detect the container type from PNG metadata.

        Reads the PNG tEXt metadata to check for "type" field:
        - "vm-snapshot" -> ContainerType.VM_SNAPSHOT
        - Other or missing -> ContainerType.BOOTABLE

        Args:
            rts_png_path: Path to the .rts.png file

        Returns:
            ContainerType enum value

        Raises:
            ValueError: If the file is not a valid PNG
        """
        from PIL import Image

        rts_png_path = Path(rts_png_path)

        if not rts_png_path.exists():
            raise FileNotFoundError(f"File not found: {rts_png_path}")

        try:
            with Image.open(rts_png_path) as img:
                # Check for type in PNG tEXt metadata
                container_type_str = img.text.get("type", "bootable")

                if container_type_str == "vm-snapshot":
                    return ContainerType.VM_SNAPSHOT
                else:
                    return ContainerType.BOOTABLE

        except Exception as e:
            raise ValueError(f"Failed to read PNG metadata: {e}")

    @staticmethod
    def extract_metadata(rts_png_path: str | Path) -> CommittedFileMetadata:
        """
        Extract metadata from a committed .rts.png file.

        Reads PNG tEXt chunks to extract all available metadata including:
        - type: Container type
        - snapshot_tag: Snapshot identifier
        - source_format: Original disk format
        - original_kernel/initrd: If stored during commit
        - created_at: Creation timestamp
        - original_size: Disk size

        Args:
            rts_png_path: Path to the .rts.png file

        Returns:
            CommittedFileMetadata with extracted information

        Raises:
            ValueError: If the file is not a valid committed file
        """
        from PIL import Image

        rts_png_path = Path(rts_png_path)

        if not rts_png_path.exists():
            raise FileNotFoundError(f"File not found: {rts_png_path}")

        try:
            with Image.open(rts_png_path) as img:
                # Get container type
                container_type_str = img.text.get("type", "bootable")
                if container_type_str == "vm-snapshot":
                    container_type = ContainerType.VM_SNAPSHOT
                else:
                    container_type = ContainerType.BOOTABLE

                # Extract optional fields
                snapshot_tag = img.text.get("snapshot_tag")
                original_kernel = img.text.get("original_kernel")
                original_initrd = img.text.get("original_initrd")
                source_format = img.text.get("source_format", "qcow2")
                created_at = img.text.get("created_at")

                # Parse disk size
                disk_size = None
                original_size_str = img.text.get("original_size")
                if original_size_str:
                    try:
                        disk_size = int(original_size_str)
                    except ValueError:
                        logger.warning(f"Invalid original_size value: {original_size_str}")

                return CommittedFileMetadata(
                    container_type=container_type,
                    snapshot_tag=snapshot_tag,
                    original_kernel=original_kernel,
                    original_initrd=original_initrd,
                    source_format=source_format,
                    disk_size=disk_size,
                    created_at=created_at,
                )

        except Exception as e:
            raise ValueError(f"Failed to extract metadata: {e}")

    def extract_qcow2(self, rts_png_path: str | Path, output_dir: Path | None = None) -> Path:
        """
        Extract the qcow2 disk from a committed .rts.png file.

        Decodes the PNG using PixelRTSDecoder to get the qcow2 bytes,
        then writes to a temp file in the output directory.

        Args:
            rts_png_path: Path to the .rts.png file
            output_dir: Directory to write extracted file (uses temp dir if None)

        Returns:
            Path to the extracted qcow2 file

        Raises:
            RuntimeError: If extraction fails
        """
        # Import PixelRTSDecoder
        try:
            from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder
        except ImportError:
            try:
                from pixel_compiler.pixelrts_v2_core import PixelRTSDecoder
            except ImportError:
                raise RuntimeError("PixelRTSDecoder not available")

        rts_png_path = Path(rts_png_path)

        if not rts_png_path.exists():
            raise FileNotFoundError(f"File not found: {rts_png_path}")

        logger.info(f"Extracting qcow2 from {rts_png_path}")

        # Create output directory if specified
        if output_dir:
            output_dir = Path(output_dir)
            output_dir.mkdir(parents=True, exist_ok=True)
        else:
            # Use temp directory
            if not self._temp_dir:
                self._temp_dir = tempfile.mkdtemp(prefix="committed_boot_")
            output_dir = Path(self._temp_dir)

        try:
            # Read PNG data
            with open(rts_png_path, 'rb') as f:
                png_data = f.read()

            # Decode to get binary data
            decoder = PixelRTSDecoder()
            decoded_data = decoder.decode(png_data)

            # Store decoder and metadata for later extraction of kernel/initrd
            self._decoder = decoder
            self._decoded_metadata = decoder.get_metadata()
            self._decoded_data = decoded_data

            # Trim to disk_size bytes (combined data includes qcow2 + kernel + initrd)
            # disk_size in metadata indicates the size of the qcow2 portion
            if self._decoded_metadata and "disk_size" in self._decoded_metadata:
                disk_size = self._decoded_metadata["disk_size"]
                qcow2_data = decoded_data[:disk_size]
                logger.info(f"Trimmed qcow2 data to {disk_size} bytes (from {len(decoded_data)} total)")
            else:
                # No disk_size metadata - use all decoded data
                qcow2_data = decoded_data
                logger.info(f"No disk_size metadata, using full decoded data ({len(decoded_data)} bytes)")

            # Write to temp file
            output_path = output_dir / f"{rts_png_path.stem}.qcow2"
            with open(output_path, 'wb') as f:
                f.write(qcow2_data)

            logger.info(f"Extracted qcow2 to {output_path} ({len(qcow2_data)} bytes)")

            self._extracted_qcow2 = output_path
            return output_path

        except Exception as e:
            raise RuntimeError(f"Failed to extract qcow2: {e}")

    def _extract_kernel(self, output_dir: Path) -> Path | None:
        """
        Extract kernel bytes from committed file using offset metadata.

        The kernel is stored at a specific offset in the combined binary payload
        (after the qcow2 disk data). This method extracts those bytes to a temp file.

        Args:
            output_dir: Directory to write extracted kernel file

        Returns:
            Path to extracted kernel file, or None if no kernel stored

        Raises:
            CommittedBootError: If kernel hash verification fails
        """
        import hashlib

        if not self._decoded_data or not self._decoded_metadata:
            logger.warning("No decoded data available - call extract_qcow2 first")
            return None

        offsets = self._decoded_metadata.get("offsets", {})
        kernel_info = offsets.get("kernel")

        if not kernel_info:
            logger.info("No kernel stored in committed file")
            return None

        offset = kernel_info["offset"]
        size = kernel_info["size"]

        # Extract kernel bytes from combined data
        kernel_data = self._decoded_data[offset:offset + size]

        # Verify hash if present
        expected_hash = kernel_info.get("sha256")
        if expected_hash:
            actual_hash = hashlib.sha256(kernel_data).hexdigest()
            if actual_hash != expected_hash:
                raise CommittedBootError(
                    f"Kernel hash mismatch: expected {expected_hash}, got {actual_hash}"
                )
            logger.info(f"Kernel hash verified: {actual_hash[:16]}...")

        # Write to temp file
        kernel_path = output_dir / "kernel"
        with open(kernel_path, 'wb') as f:
            f.write(kernel_data)

        logger.info(f"Extracted kernel: {size} bytes to {kernel_path}")
        return kernel_path

    def _extract_initrd(self, output_dir: Path) -> Path | None:
        """
        Extract initrd bytes from committed file using offset metadata.

        The initrd is stored at a specific offset in the combined binary payload
        (after the qcow2 disk data and optionally after kernel). This method
        extracts those bytes to a temp file.

        Args:
            output_dir: Directory to write extracted initrd file

        Returns:
            Path to extracted initrd file, or None if no initrd stored

        Raises:
            CommittedBootError: If initrd hash verification fails
        """
        import hashlib

        if not self._decoded_data or not self._decoded_metadata:
            logger.warning("No decoded data available - call extract_qcow2 first")
            return None

        offsets = self._decoded_metadata.get("offsets", {})
        initrd_info = offsets.get("initrd")

        if not initrd_info:
            logger.info("No initrd stored in committed file")
            return None

        offset = initrd_info["offset"]
        size = initrd_info["size"]

        # Extract initrd bytes from combined data
        initrd_data = self._decoded_data[offset:offset + size]

        # Verify hash if present
        expected_hash = initrd_info.get("sha256")
        if expected_hash:
            actual_hash = hashlib.sha256(initrd_data).hexdigest()
            if actual_hash != expected_hash:
                raise CommittedBootError(
                    f"Initrd hash mismatch: expected {expected_hash}, got {actual_hash}"
                )
            logger.info(f"Initrd hash verified: {actual_hash[:16]}...")

        # Write to temp file
        initrd_path = output_dir / "initrd"
        with open(initrd_path, 'wb') as f:
            f.write(initrd_data)

        logger.info(f"Extracted initrd: {size} bytes to {initrd_path}")
        return initrd_path

    def boot(
        self,
        cmdline: str | None = None,
        extra_qemu_args: list[str] | None = None,
    ) -> BootResult:
        """
        Boot the committed .rts.png file.

        This method:
        1. Creates temp directory for extraction
        2. Extracts qcow2 disk to temp file
        3. Detects or extracts kernel/initrd (from metadata or qcow2)
        4. Starts QEMU with -kernel, -initrd, and -drive file=qcow2
        5. Returns BootResult with process info

        For vm-snapshot containers, disk changes persist to the extracted qcow2
        temp file (not the original .rts.png, which is read-only).

        Args:
            cmdline: Optional kernel command line parameters
            extra_qemu_args: Optional extra QEMU arguments

        Returns:
            BootResult with success status and access details
        """
        logger.info(f"Booting committed file: {self.rts_png_path}")

        try:
            # Step 1: Detect container type
            container_type = self.detect_container_type(self.rts_png_path)
            logger.info(f"Container type: {container_type.value}")

            if container_type != ContainerType.VM_SNAPSHOT:
                error_msg = f"Not a vm-snapshot container: {container_type.value}"
                logger.error(error_msg)
                return BootResult(
                    success=False,
                    error_message=error_msg,
                )

            # Step 2: Extract metadata
            metadata = self.extract_metadata(self.rts_png_path)
            logger.info(f"Metadata: {metadata.to_dict()}")

            # Step 3: Create temp directory for extraction
            if not self._temp_dir:
                self._temp_dir = tempfile.mkdtemp(prefix="committed_boot_")
                logger.info(f"Created temp directory: {self._temp_dir}")

            # Step 4: Extract qcow2 disk
            if not self._extracted_qcow2:
                self.extract_qcow2(self.rts_png_path, Path(self._temp_dir))

            qcow2_path = self._extracted_qcow2

            # Step 5: Import QemuBoot and related classes
            try:
                from systems.pixel_compiler.integration.qemu_boot import (
                    NetworkMode,
                    QemuBoot,
                    QemuConfig,
                    VMStatus,
                )
            except ImportError:
                try:
                    from pixel_compiler.integration.qemu_boot import (
                        NetworkMode,
                        QemuBoot,
                        QemuConfig,
                        VMStatus,
                    )
                except ImportError:
                    raise RuntimeError("QemuBoot not available")

            # Step 6: Extract kernel/initrd from committed file
            # The extract_qcow2() call above populates _decoded_data and _decoded_metadata
            # Now use those to extract kernel/initrd from the binary payload
            kernel_path = self._extract_kernel(Path(self._temp_dir))
            initrd_path = self._extract_initrd(Path(self._temp_dir))

            # Log warnings if kernel/initrd not available
            if not kernel_path:
                logger.warning(
                    "No kernel in committed file. Boot may fail or use disk bootloader."
                )
            if not initrd_path:
                logger.info("No initrd in committed file. Boot may use kernel-only mode.")

            # Step 7: Create QEMU configuration
            qemu_config = QemuConfig(
                memory=self.memory,
                cpus=self.cpus,
                vnc_display=self.vnc_display,
                vnc_enabled=True,
                serial_enabled=True,
                monitor_enabled=True,
                enable_kvm=True,
                network_mode=self.network_mode if self.network_mode else NetworkMode.USER,
                socket_config=self.socket_config,
            )

            # Add extra QEMU args if provided
            if extra_qemu_args:
                qemu_config.extra_args.extend(extra_qemu_args)

            # Add the qcow2 as a drive with snapshot=off to persist changes
            qemu_config.drives.append({
                "file": str(qcow2_path),
                "format": "qcow2",
                "interface": "virtio",
                "snapshot": False,  # Changes persist to temp qcow2
            })

            # Step 8: Create QemuBoot instance
            self._qemu = QemuBoot(
                image_path=qcow2_path,
                memory=self.memory,
                cpus=self.cpus,
                config=qemu_config,
            )

            # Step 9: Start QEMU
            logger.info("Starting QEMU...")

            if kernel_path:
                process = self._qemu.boot(
                    kernel=kernel_path,
                    initrd=initrd_path,
                    cmdline=cmdline or "console=ttyS0 root=/dev/vda1",
                )
            else:
                # Boot from disk (BIOS/bootloader mode)
                process = self._qemu.boot(
                    cmdline=cmdline,
                )

            self._booted = True

            # Get status
            status = self._qemu.get_status()

            logger.info(f"QEMU started with PID {process.pid}")

            return BootResult(
                success=True,
                process=process,
                vnc_port=status.get("vnc_port"),
                serial_socket=Path(status["serial_socket"]) if status.get("serial_socket") else None,
                pid=process.pid,
            )

        except FileNotFoundError as e:
            error_msg = f"File not found: {e}"
            logger.error(error_msg)
            self._cleanup()
            return BootResult(
                success=False,
                error_message=error_msg,
            )

        except RuntimeError as e:
            error_msg = f"Runtime error: {e}"
            logger.error(error_msg)
            self._cleanup()
            return BootResult(
                success=False,
                error_message=error_msg,
            )

        except Exception as e:
            error_msg = f"Boot failed: {e}"
            logger.error(error_msg)
            self._cleanup()
            return BootResult(
                success=False,
                error_message=error_msg,
            )

    def stop(self) -> None:
        """
        Stop QEMU and clean up temp files.

        Safe to call multiple times. Handles cleanup in proper order:
        1. Stop QEMU process
        2. Remove temp directory and extracted files
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

        # Clean up temp directory
        if self._temp_dir:
            try:
                logger.info(f"Cleaning up temp directory: {self._temp_dir}")
                shutil.rmtree(self._temp_dir, ignore_errors=True)
            except Exception as e:
                logger.warning(f"Error cleaning up temp directory: {e}")
            finally:
                self._temp_dir = None
                self._extracted_qcow2 = None

    def get_status(self) -> dict[str, Any]:
        """
        Get current boot status.

        Returns:
            Dictionary with:
            - booted: Whether QEMU is running
            - qemu_status: QEMU status dict if booted
            - rts_png_path: Path to committed file
            - extracted_qcow2: Path to extracted qcow2 if extracted
        """
        status = {
            "booted": self._booted,
            "rts_png_path": str(self.rts_png_path),
            "extracted_qcow2": str(self._extracted_qcow2) if self._extracted_qcow2 else None,
            "memory": self.memory,
            "cpus": self.cpus,
            "vnc_display": self.vnc_display,
        }

        if self._qemu is not None:
            status["qemu_status"] = self._qemu.get_status()

        return status

    def __enter__(self) -> 'CommittedFileBooter':
        """Context manager entry."""
        return self

    def __exit__(self, exc_type, exc_val, exc_tb) -> None:
        """Context manager exit - ensure cleanup."""
        self._cleanup()
        return None  # Don't suppress exceptions

    def __repr__(self) -> str:
        """String representation."""
        status = "booted" if self._booted else "idle"
        return f"CommittedFileBooter(path={self.rts_png_path}, memory={self.memory}, cpus={self.cpus}, status={status})"
