#!/usr/bin/env python3
"""
QEMU Integration Module for PixelRTS.

Provides comprehensive QEMU boot integration for running RTS cartridges
and PixelRTS images in virtualized environments.

Features:
- Multiple architecture support (x86_64, aarch64)
- Direct kernel boot and BIOS boot modes
- VNC integration for headless operation
- Cloud-init configuration support
- Serial console access
- Screenshot capture and keyboard input

Usage:
    from systems.pixel_compiler.integration.qemu_boot import QemuBoot

    # Basic usage
    qemu = QemuBoot("os.rts.png", memory="2G", cpus=4)
    qemu.prepare_boot()
    process = qemu.boot()

    # With kernel/initrd
    process = qemu.boot(kernel=Path("vmlinuz"), initrd=Path("initrd.img"))

    # Stop VM
    qemu.stop()

    # Get status
    status = qemu.get_status()

    # Take screenshot
    qemu.take_screenshot(Path("screen.png"))

    # Send keyboard input
    qemu.send_keys("ls -la\\n")

    # Connect to serial console
    sock = qemu.connect_serial()
"""

import os
import sys
import json
import time
import shutil
import subprocess
import tempfile
import signal
import socket
import threading
from pathlib import Path
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any, Union, Tuple, IO
from datetime import datetime
from enum import Enum, auto
from collections import defaultdict
import logging
import platform

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


# ============================================================================
# Enums and Data Classes
# ============================================================================

class QemuArchitecture(Enum):
    """Supported QEMU architectures."""
    X86_64 = "x86_64"
    AARCH64 = "aarch64"
    RISCV64 = "riscv64"
    PPC64 = "ppc64"
    ARM = "arm"

    @property
    def qemu_binary(self) -> str:
        """Get QEMU binary name for this architecture."""
        return f"qemu-system-{self.value}"

    @property
    def default_machine(self) -> str:
        """Get default machine type for this architecture."""
        machine_map = {
            QemuArchitecture.X86_64: "q35",
            QemuArchitecture.AARCH64: "virt",
            QemuArchitecture.RISCV64: "virt",
            QemuArchitecture.PPC64: "pseries",
            QemuArchitecture.ARM: "virt",
        }
        return machine_map.get(self, "pc")

    @property
    def default_cpu(self) -> str:
        """Get default CPU type for this architecture."""
        cpu_map = {
            QemuArchitecture.X86_64: "qemu64",
            QemuArchitecture.AARCH64: "cortex-a57",
            QemuArchitecture.RISCV64: "rv64",
            QemuArchitecture.PPC64: "power9",
            QemuArchitecture.ARM: "cortex-a15",
        }
        return cpu_map.get(self, "default")


class BootMode(Enum):
    """QEMU boot modes."""
    DIRECT_KERNEL = "direct_kernel"  # -kernel / -initrd direct boot
    BIOS = "bios"                    # Standard BIOS boot from disk/ISO
    UEFI = "uefi"                    # UEFI boot with OVMF
    PXE = "pxe"                      # Network boot


class VMStatus(Enum):
    """VM status states."""
    STOPPED = "stopped"
    STARTING = "starting"
    RUNNING = "running"
    PAUSED = "paused"
    SHUTTING_DOWN = "shutting_down"
    ERROR = "error"


class DriveInterface(Enum):
    """Disk drive interface types."""
    IDE = "ide"
    SCSI = "scsi"
    VIRTIO = "virtio"
    SD = "sd"
    NVME = "nvme"


class NetworkMode(Enum):
    """Network configuration modes."""
    NONE = "none"
    USER = "user"
    TAP = "tap"
    BRIDGE = "bridge"


@dataclass
class QemuConfig:
    """QEMU configuration settings."""
    memory: str = "1G"
    cpus: int = 2
    architecture: QemuArchitecture = QemuArchitecture.X86_64
    boot_mode: BootMode = BootMode.DIRECT_KERNEL
    machine: Optional[str] = None
    cpu: Optional[str] = None
    enable_kvm: bool = True
    vnc_display: int = 0
    vnc_enabled: bool = True
    serial_enabled: bool = True
    monitor_enabled: bool = True
    network_mode: NetworkMode = NetworkMode.USER
    network_port_forward: Dict[int, int] = field(default_factory=dict)
    drives: List[Dict[str, Any]] = field(default_factory=list)
    extra_args: List[str] = field(default_factory=list)

    def __post_init__(self):
        """Set defaults based on architecture."""
        if self.machine is None:
            self.machine = self.architecture.default_machine
        if self.cpu is None:
            self.cpu = self.architecture.default_cpu

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "memory": self.memory,
            "cpus": self.cpus,
            "architecture": self.architecture.value,
            "boot_mode": self.boot_mode.value,
            "machine": self.machine,
            "cpu": self.cpu,
            "enable_kvm": self.enable_kvm,
            "vnc_display": self.vnc_display,
            "vnc_enabled": self.vnc_enabled,
            "serial_enabled": self.serial_enabled,
            "monitor_enabled": self.monitor_enabled,
            "network_mode": self.network_mode.value,
            "network_port_forward": self.network_port_forward,
            "drives": self.drives,
            "extra_args": self.extra_args,
        }


@dataclass
class CloudInitConfig:
    """Cloud-init configuration for VM customization."""
    hostname: str = "pixelrts-vm"
    username: str = "pixelrts"
    password: Optional[str] = None
    ssh_authorized_keys: List[str] = field(default_factory=list)
    packages: List[str] = field(default_factory=list)
    write_files: List[Dict[str, str]] = field(default_factory=list)
    run_commands: List[str] = field(default_factory=list)
    timezone: str = "UTC"
    locale: str = "en_US.UTF-8"

    def to_dict(self) -> Dict[str, Any]:
        """Convert to cloud-config dictionary."""
        config = {
            "hostname": self.hostname,
            "fqdn": self.hostname,
            "manage_etc_hosts": True,
            "timezone": self.timezone,
            "locale": self.locale,
        }

        if self.username:
            users = [{"name": self.username, "sudo": "ALL=(ALL) NOPASSWD:ALL"}]
            if self.password:
                users[0]["passwd"] = self.password
                users[0]["lock_passwd"] = False
            if self.ssh_authorized_keys:
                users[0]["ssh_authorized_keys"] = self.ssh_authorized_keys
            config["users"] = users

        if self.packages:
            config["packages"] = self.packages

        if self.write_files:
            config["write_files"] = self.write_files

        if self.run_commands:
            config["runcmd"] = self.run_commands

        return config

    def generate_user_data(self) -> str:
        """Generate cloud-init user-data content."""
        config = self.to_dict()
        lines = ["#cloud-config"]
        lines.append(json.dumps(config, indent=2))
        return "\n".join(lines)

    def generate_meta_data(self) -> str:
        """Generate cloud-init meta-data content."""
        return f"instance-id: {self.hostname}\nlocal-hostname: {self.hostname}\n"


@dataclass
class DriveConfig:
    """Disk drive configuration."""
    path: Path
    interface: DriveInterface = DriveInterface.VIRTIO
    media: str = "disk"  # disk or cdrom
    format: str = "raw"
    boot_index: Optional[int] = None
    read_only: bool = False

    def to_qemu_args(self, index: int) -> List[str]:
        """Convert to QEMU command-line arguments."""
        drive_id = f"drive{index}"
        args = [
            "-drive",
            f"file={self.path},format={self.format},if={self.interface.value},media={self.media},id={drive_id}"
        ]

        if self.read_only:
            args[-1] += ",readonly=on"

        if self.boot_index is not None:
            args[-1] += f",bootindex={self.boot_index}"

        return args


@dataclass
class VMInfo:
    """Information about a running VM."""
    pid: Optional[int]
    status: VMStatus
    architecture: QemuArchitecture
    memory: str
    cpus: int
    vnc_port: Optional[int]
    serial_socket: Optional[Path]
    monitor_socket: Optional[Path]
    start_time: Optional[datetime]
    uptime_seconds: float = 0.0
    error_message: Optional[str] = None

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "pid": self.pid,
            "status": self.status.value,
            "architecture": self.architecture.value,
            "memory": self.memory,
            "cpus": self.cpus,
            "vnc_port": self.vnc_port,
            "serial_socket": str(self.serial_socket) if self.serial_socket else None,
            "monitor_socket": str(self.monitor_socket) if self.monitor_socket else None,
            "start_time": self.start_time.isoformat() if self.start_time else None,
            "uptime_seconds": self.uptime_seconds,
            "error_message": self.error_message,
        }


# ============================================================================
# QEMU Boot Class
# ============================================================================

class QemuBoot:
    """
    QEMU boot integration for PixelRTS.

    Provides comprehensive QEMU management including:
    - Multiple architecture support
    - Direct kernel boot and BIOS boot modes
    - VNC integration for headless operation
    - Cloud-init configuration
    - Serial console access
    - Screenshot capture and keyboard input

    Example:
        qemu = QemuBoot("os.rts.png", memory="2G", cpus=4)
        prepared_image = qemu.prepare_boot()
        process = qemu.boot(kernel=Path("vmlinuz"))
        status = qemu.get_status()
        qemu.stop()
    """

    # Default paths
    DEFAULT_QEMU_PATHS = {
        QemuArchitecture.X86_64: ["/usr/bin/qemu-system-x86_64", "/usr/local/bin/qemu-system-x86_64"],
        QemuArchitecture.AARCH64: ["/usr/bin/qemu-system-aarch64", "/usr/local/bin/qemu-system-aarch64"],
        QemuArchitecture.RISCV64: ["/usr/bin/qemu-system-riscv64", "/usr/local/bin/qemu-system-riscv64"],
        QemuArchitecture.PPC64: ["/usr/bin/qemu-system-ppc64", "/usr/local/bin/qemu-system-ppc64"],
        QemuArchitecture.ARM: ["/usr/bin/qemu-system-arm", "/usr/local/bin/qemu-system-arm"],
    }

    # Default UEFI firmware paths
    OVMF_PATHS = [
        "/usr/share/OVMF/OVMF_CODE.fd",
        "/usr/share/OVMF/OVMF_CODE_64.fd",
        "/usr/share/qemu/OVMF.fd",
    ]

    def __init__(
        self,
        image_path: Union[str, Path],
        memory: str = "1G",
        cpus: int = 2,
        architecture: QemuArchitecture = QemuArchitecture.X86_64,
        config: Optional[QemuConfig] = None,
        temp_dir: Optional[Path] = None,
    ):
        """
        Initialize QEMU boot manager.

        Args:
            image_path: Path to disk image, ISO, or RTS cartridge
            memory: Memory allocation (e.g., "1G", "512M")
            cpus: Number of CPU cores
            architecture: Target CPU architecture
            config: Optional QEMU configuration
            temp_dir: Temporary directory for runtime files
        """
        self.image_path = Path(image_path)
        self.temp_dir = Path(temp_dir) if temp_dir else Path(tempfile.mkdtemp(prefix="qemu_boot_"))

        # Create config from parameters or use provided config
        if config:
            self.config = config
            self.config.memory = memory
            self.config.cpus = cpus
            self.config.architecture = architecture
        else:
            self.config = QemuConfig(
                memory=memory,
                cpus=cpus,
                architecture=architecture,
            )

        # Runtime state
        self._process: Optional[subprocess.Popen] = None
        self._start_time: Optional[datetime] = None
        self._serial_socket: Optional[Path] = None
        self._monitor_socket: Optional[Path] = None
        self._prepared_image: Optional[Path] = None
        self._cloud_init_iso: Optional[Path] = None

        # Ensure temp directory exists
        self.temp_dir.mkdir(parents=True, exist_ok=True)

        # Find QEMU binary
        self._qemu_binary = self._find_qemu_binary()

        # Check for KVM support
        self._kvm_available = self._check_kvm()

    def _find_qemu_binary(self) -> Path:
        """Find QEMU binary for configured architecture."""
        paths = self.DEFAULT_QEMU_PATHS.get(self.config.architecture, [])

        for path in paths:
            if os.path.exists(path):
                return Path(path)

        # Try to find in PATH
        binary_name = self.config.architecture.qemu_binary
        found = shutil.which(binary_name)
        if found:
            return Path(found)

        raise FileNotFoundError(
            f"QEMU binary not found for architecture {self.config.architecture.value}. "
            f"Please install qemu-system-{self.config.architecture.value}"
        )

    def _check_kvm(self) -> bool:
        """Check if KVM is available."""
        return os.path.exists("/dev/kvm") and os.access("/dev/kvm", os.R_OK | os.W_OK)

    def prepare_boot(self) -> Path:
        """
        Prepare image for QEMU boot.

        Converts RTS images to raw format if needed and prepares
        any necessary boot files.

        Returns:
            Path to prepared bootable image
        """
        logger.info(f"Preparing boot for {self.image_path}")

        # Check if image exists
        if not self.image_path.exists():
            raise FileNotFoundError(f"Image not found: {self.image_path}")

        # Determine image type and convert if needed
        image_suffix = self.image_path.suffix.lower()

        if image_suffix == ".rts" or image_suffix.endswith(".rts"):
            # Convert RTS to raw image
            self._prepared_image = self._convert_rts_to_raw(self.image_path)
        elif image_suffix in (".png",) and ".rts" in str(self.image_path):
            # PixelRTS image - convert to raw
            self._prepared_image = self._convert_pixelrts_to_raw(self.image_path)
        elif image_suffix in (".iso", ".img", ".qcow2", ".raw"):
            # Already in supported format
            self._prepared_image = self.image_path
        else:
            # Assume raw format, copy to temp dir
            self._prepared_image = self.temp_dir / f"boot_image{image_suffix}"
            shutil.copy2(self.image_path, self._prepared_image)

        logger.info(f"Prepared image: {self._prepared_image}")
        return self._prepared_image

    def _convert_rts_to_raw(self, rts_path: Path) -> Path:
        """Convert RTS cartridge to raw disk image."""
        output_path = self.temp_dir / "boot_image.raw"

        # Check for metadata
        meta_path = rts_path.with_suffix(".rts.meta.json")
        if meta_path.exists():
            with open(meta_path, 'r') as f:
                metadata = json.load(f)
            original_size = metadata.get('payload', {}).get('size', 0)
        else:
            original_size = 0

        # Simple byte copy for now (RTS is already raw bytes)
        # In production, this would decode the RTS format
        shutil.copy2(rts_path, output_path)

        logger.info(f"Converted RTS to raw: {output_path}")
        return output_path

    def _convert_pixelrts_to_raw(self, png_path: Path) -> Path:
        """Convert PixelRTS PNG to raw disk image."""
        output_path = self.temp_dir / "boot_image.raw"

        # Try to use pixelrts_v2_converter if available
        try:
            # Import and use the converter
            sys.path.insert(0, str(Path(__file__).parent.parent))
            from pixelrts_v2_converter import PixelRTSConverter

            converter = PixelRTSConverter()
            data = converter.decode(str(png_path))

            with open(output_path, 'wb') as f:
                f.write(data)

            logger.info(f"Decoded PixelRTS to raw: {output_path}")
            return output_path

        except ImportError:
            logger.warning("PixelRTS converter not available, using raw copy")

        # Fallback: simple copy
        shutil.copy2(png_path, output_path)
        return output_path

    def boot(
        self,
        kernel: Optional[Path] = None,
        initrd: Optional[Path] = None,
        cmdline: Optional[str] = None,
        cloud_init: Optional[CloudInitConfig] = None,
        blocking: bool = False,
    ) -> subprocess.Popen:
        """
        Start QEMU process.

        Args:
            kernel: Path to kernel file for direct boot
            initrd: Path to initrd/initramfs file
            cmdline: Kernel command line parameters
            cloud_init: Cloud-init configuration
            blocking: If True, wait for VM to exit

        Returns:
            subprocess.Popen object for the QEMU process
        """
        if self._process and self._process.poll() is None:
            raise RuntimeError("VM is already running")

        logger.info("Starting QEMU boot...")

        # Prepare image if not done
        if not self._prepared_image:
            self.prepare_boot()

        # Build command
        cmd = self._build_command(kernel, initrd, cmdline, cloud_init)

        logger.info(f"Executing: {' '.join(cmd)}")

        # Update status
        self._start_time = datetime.now()

        try:
            # Start QEMU process
            self._process = subprocess.Popen(
                cmd,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                stdin=subprocess.PIPE,
            )

            logger.info(f"QEMU started with PID {self._process.pid}")

            if blocking:
                self._process.wait()

            return self._process

        except Exception as e:
            logger.error(f"Failed to start QEMU: {e}")
            raise

    def _build_command(
        self,
        kernel: Optional[Path],
        initrd: Optional[Path],
        cmdline: Optional[str],
        cloud_init: Optional[CloudInitConfig],
    ) -> List[str]:
        """Build QEMU command-line arguments."""
        cmd = [str(self._qemu_binary)]

        # Architecture-specific machine type
        cmd.extend(["-machine", self.config.machine or self.config.architecture.default_machine])

        # CPU configuration
        cmd.extend(["-cpu", self.config.cpu or self.config.architecture.default_cpu])
        cmd.extend(["-smp", str(self.config.cpus)])

        # Memory
        cmd.extend(["-m", self.config.memory])

        # KVM acceleration
        if self.config.enable_kvm and self._kvm_available:
            cmd.append("-enable-kvm")

        # Boot mode specific configuration
        if kernel and self.config.boot_mode == BootMode.DIRECT_KERNEL:
            # Direct kernel boot
            cmd.extend(["-kernel", str(kernel)])

            if initrd:
                cmd.extend(["-initrd", str(initrd)])

            # Kernel command line
            default_cmdline = "console=ttyS0 quiet"
            if cmdline:
                default_cmdline = f"{default_cmdline} {cmdline}"
            cmd.extend(["-append", default_cmdline])

        elif self.config.boot_mode == BootMode.UEFI:
            # UEFI boot with OVMF
            ovmf_path = self._find_ovmf()
            if ovmf_path:
                cmd.extend(["-drive", f"if=pflash,format=raw,readonly=on,file={ovmf_path}"])

        # Drive configuration
        if self._prepared_image:
            drive_interface = DriveInterface.VIRTIO
            media_type = "cdrom" if self._prepared_image.suffix == ".iso" else "disk"

            cmd.extend([
                "-drive",
                f"file={self._prepared_image},format=raw,if={drive_interface.value},media={media_type}"
            ])

        # Cloud-init ISO
        if cloud_init:
            cloud_init_iso = self._create_cloud_init_iso(cloud_init)
            cmd.extend([
                "-drive",
                f"file={cloud_init_iso},format=raw,if=virtio,media=cdrom"
            ])

        # VNC configuration
        if self.config.vnc_enabled:
            vnc_port = 5900 + self.config.vnc_display
            cmd.extend(["-vnc", f":{self.config.vnc_display}"])
            logger.info(f"VNC available on port {vnc_port}")

        # Serial console
        if self.config.serial_enabled:
            self._serial_socket = self.temp_dir / "serial.sock"
            cmd.extend(["-serial", f"unix:{self._serial_socket},server,nowait"])

        # Monitor
        if self.config.monitor_enabled:
            self._monitor_socket = self.temp_dir / "monitor.sock"
            cmd.extend(["-monitor", f"unix:{self._monitor_socket},server,nowait"])

        # Network configuration
        cmd.extend(self._build_network_args())

        # Extra arguments
        cmd.extend(self.config.extra_args)

        return cmd

    def _find_ovmf(self) -> Optional[Path]:
        """Find OVMF UEFI firmware."""
        for path in self.OVMF_PATHS:
            if os.path.exists(path):
                return Path(path)
        return None

    def _build_network_args(self) -> List[str]:
        """Build network configuration arguments."""
        args = []

        if self.config.network_mode == NetworkMode.NONE:
            args.append("-nic")
            args.append("none")
        elif self.config.network_mode == NetworkMode.USER:
            # User-mode networking with port forwarding
            net_config = "user"

            # Add port forwards
            for host_port, guest_port in self.config.network_port_forward.items():
                net_config += f",hostfwd=tcp::{host_port}-:{guest_port}"

            args.append("-nic")
            args.append(net_config)
        elif self.config.network_mode == NetworkMode.TAP:
            args.append("-nic")
            args.append("tap,ifname=tap0,script=no,downscript=no")
        elif self.config.network_mode == NetworkMode.BRIDGE:
            args.append("-nic")
            args.append("bridge,br=br0")

        return args

    def _create_cloud_init_iso(self, config: CloudInitConfig) -> Path:
        """Create cloud-init ISO image."""
        iso_path = self.temp_dir / "cloud-init.iso"

        # Create temporary directory for cloud-init files
        ci_dir = self.temp_dir / "cloud-init"
        ci_dir.mkdir(exist_ok=True)

        # Write user-data
        user_data_path = ci_dir / "user-data"
        with open(user_data_path, 'w') as f:
            f.write(config.generate_user_data())

        # Write meta-data
        meta_data_path = ci_dir / "meta-data"
        with open(meta_data_path, 'w') as f:
            f.write(config.generate_meta_data())

        # Create ISO using genisoimage or mkisofs
        iso_tools = ["genisoimage", "mkisofs", "xorrisofs"]
        iso_tool = None

        for tool in iso_tools:
            if shutil.which(tool):
                iso_tool = tool
                break

        if iso_tool:
            cmd = [
                iso_tool,
                "-output", str(iso_path),
                "-volid", "cidata",
                "-joliet",
                "-rock",
                str(ci_dir)
            ]

            result = subprocess.run(cmd, capture_output=True)

            if result.returncode == 0:
                self._cloud_init_iso = iso_path
                return iso_path

        # Fallback: Create a minimal seed image
        logger.warning("ISO creation tools not available, creating minimal seed")
        return self._create_minimal_seed(config, iso_path)

    def _create_minimal_seed(self, config: CloudInitConfig, output_path: Path) -> Path:
        """Create minimal cloud-init seed without external tools."""
        # Create a simple FAT filesystem image
        # This is a minimal implementation
        with open(output_path, 'wb') as f:
            # Write user-data and meta-data as raw content
            # In production, this would create a proper FAT/ISO image
            f.write(b"#cloud-init seed\n")
            f.write(config.generate_user_data().encode())
            f.write(b"\n---\n")
            f.write(config.generate_meta_data().encode())

        self._cloud_init_iso = output_path
        return output_path

    def stop(self) -> bool:
        """
        Stop the QEMU instance.

        Returns:
            True if VM was stopped successfully
        """
        if not self._process:
            logger.info("No VM process to stop")
            return True

        if self._process.poll() is not None:
            logger.info(f"VM already stopped (exit code: {self._process.returncode})")
            return True

        logger.info(f"Stopping QEMU process {self._process.pid}")

        try:
            # Try graceful shutdown first
            self._process.terminate()

            # Wait up to 10 seconds for graceful shutdown
            try:
                self._process.wait(timeout=10)
                logger.info("VM stopped gracefully")
                return True
            except subprocess.TimeoutExpired:
                # Force kill
                logger.warning("VM did not stop gracefully, forcing termination")
                self._process.kill()
                self._process.wait(timeout=5)
                logger.info("VM killed")
                return True

        except Exception as e:
            logger.error(f"Error stopping VM: {e}")
            return False

        finally:
            self._process = None
            self._start_time = None

    def get_status(self) -> Dict[str, Any]:
        """
        Get VM status information.

        Returns:
            Dictionary with VM status information
        """
        status = VMStatus.STOPPED
        pid = None
        uptime = 0.0

        if self._process:
            pid = self._process.pid
            poll_result = self._process.poll()

            if poll_result is None:
                status = VMStatus.RUNNING
                if self._start_time:
                    uptime = (datetime.now() - self._start_time).total_seconds()
            elif poll_result == 0:
                status = VMStatus.STOPPED
            else:
                status = VMStatus.ERROR

        vnc_port = None
        if self.config.vnc_enabled and status == VMStatus.RUNNING:
            vnc_port = 5900 + self.config.vnc_display

        info = VMInfo(
            pid=pid,
            status=status,
            architecture=self.config.architecture,
            memory=self.config.memory,
            cpus=self.config.cpus,
            vnc_port=vnc_port,
            serial_socket=self._serial_socket,
            monitor_socket=self._monitor_socket,
            start_time=self._start_time,
            uptime_seconds=uptime,
        )

        return info.to_dict()

    def take_screenshot(self, output: Path) -> bool:
        """
        Capture VM screen to file.

        Uses QEMU monitor command to save screen as PPM,
        then converts to PNG if possible.

        Args:
            output: Path to save screenshot

        Returns:
            True if screenshot was captured successfully
        """
        if not self._monitor_socket or not self._monitor_socket.exists():
            logger.error("Monitor socket not available")
            return False

        if self._process is None or self._process.poll() is not None:
            logger.error("VM is not running")
            return False

        try:
            # Connect to monitor socket
            sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
            sock.connect(str(self._monitor_socket))
            sock.settimeout(5.0)

            # Send screendump command
            ppm_path = self.temp_dir / "screen.ppm"
            sock.send(f"screendump {ppm_path}\n".encode())

            # Wait for response
            time.sleep(0.5)
            sock.close()

            # Check if PPM was created
            if not ppm_path.exists():
                logger.error("Screenshot capture failed")
                return False

            # Try to convert to PNG using PIL or imagemagick
            try:
                from PIL import Image
                img = Image.open(ppm_path)
                img.save(output)
                logger.info(f"Screenshot saved to {output}")
                return True
            except ImportError:
                # Try imagemagick
                if shutil.which("convert"):
                    subprocess.run(["convert", str(ppm_path), str(output)], check=True)
                    logger.info(f"Screenshot saved to {output}")
                    return True

                # Fallback: just copy PPM
                shutil.copy2(ppm_path, output)
                logger.info(f"Screenshot saved as PPM to {output}")
                return True

        except Exception as e:
            logger.error(f"Screenshot failed: {e}")
            return False

    def send_keys(self, keys: str) -> bool:
        """
        Send keyboard input to VM.

        Uses QEMU monitor sendkey command.

        Args:
            keys: Key sequence to send (e.g., "ls -la\\n")

        Returns:
            True if keys were sent successfully
        """
        if not self._monitor_socket or not self._monitor_socket.exists():
            logger.error("Monitor socket not available")
            return False

        if self._process is None or self._process.poll() is not None:
            logger.error("VM is not running")
            return False

        try:
            sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
            sock.connect(str(self._monitor_socket))
            sock.settimeout(5.0)

            # Convert key string to sendkey commands
            key_sequence = self._parse_key_sequence(keys)

            for key in key_sequence:
                sock.send(f"sendkey {key}\n".encode())
                time.sleep(0.02)  # Small delay between keys

            sock.close()
            logger.info(f"Sent keys: {keys}")
            return True

        except Exception as e:
            logger.error(f"Failed to send keys: {e}")
            return False

    def _parse_key_sequence(self, keys: str) -> List[str]:
        """Parse key sequence into QEMU sendkey format."""
        result = []
        i = 0

        while i < len(keys):
            char = keys[i]

            if char == '\\':
                # Escape sequence
                if i + 1 < len(keys):
                    next_char = keys[i + 1]
                    if next_char == 'n':
                        result.append("ret")
                        i += 2
                        continue
                    elif next_char == 't':
                        result.append("tab")
                        i += 2
                        continue
                    elif next_char == '\\':
                        result.append("backslash")
                        i += 2
                        continue

            # Map common characters
            char_map = {
                ' ': 'spc',
                '\n': 'ret',
                '\t': 'tab',
                '-': 'minus',
                '=': 'equal',
                '[': 'bracket_left',
                ']': 'bracket_right',
                ';': 'semicolon',
                "'": 'apostrophe',
                ',': 'comma',
                '.': 'dot',
                '/': 'slash',
            }

            if char in char_map:
                result.append(char_map[char])
            elif char.isupper():
                result.append(f"shift-{char.lower()}")
            elif char.isalpha():
                result.append(char.lower())
            else:
                result.append(char)

            i += 1

        return result

    def connect_serial(self) -> socket.socket:
        """
        Connect to serial console.

        Returns:
            Socket connected to serial console

        Raises:
            RuntimeError: If VM is not running or serial not configured
        """
        if not self._serial_socket or not self._serial_socket.exists():
            raise RuntimeError("Serial socket not available")

        if self._process is None or self._process.poll() is not None:
            raise RuntimeError("VM is not running")

        sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        sock.connect(str(self._serial_socket))
        sock.setblocking(False)

        return sock

    def send_monitor_command(self, command: str) -> str:
        """
        Send command to QEMU monitor and get response.

        Args:
            command: QEMU monitor command

        Returns:
            Command output
        """
        if not self._monitor_socket or not self._monitor_socket.exists():
            raise RuntimeError("Monitor socket not available")

        if self._process is None or self._process.poll() is not None:
            raise RuntimeError("VM is not running")

        sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        sock.connect(str(self._monitor_socket))
        sock.settimeout(5.0)

        # Send command
        sock.send(f"{command}\n".encode())

        # Read response
        response = b""
        sock.setblocking(False)

        try:
            while True:
                chunk = sock.recv(4096)
                if not chunk:
                    break
                response += chunk
        except BlockingIOError:
            pass

        sock.close()
        return response.decode('utf-8', errors='replace')

    def mouse_move(self, x: int, y: int) -> bool:
        """
        Move mouse to coordinates.
        Note: Requires absolute pointer device like -device usb-tablet.
        
        Args:
            x: X coordinate (usually 0-32767 for absolute)
            y: Y coordinate (usually 0-32767 for absolute)
            
        Returns:
            True if successful
        """
        result = self.send_monitor_command(f"mouse_move {x} {y}")
        return "error" not in result.lower()

    def mouse_click(self, button: int = 1) -> bool:
        """
        Perform a mouse click.
        
        Args:
            button: Button bits (1=left, 2=middle, 4=right)
            
        Returns:
            True if successful
        """
        # Press button
        self.send_monitor_command(f"mouse_button {button}")
        time.sleep(0.05)
        # Release button
        self.send_monitor_command("mouse_button 0")
        return True

    def add_drive(
        self,
        path: Path,
        interface: DriveInterface = DriveInterface.VIRTIO,
        media: str = "disk",
        read_only: bool = False,
    ) -> None:
        """
        Add additional drive to VM configuration.

        Args:
            path: Path to disk image
            interface: Drive interface type
            media: Media type (disk or cdrom)
            read_only: Whether drive is read-only
        """
        self.config.drives.append({
            "path": str(path),
            "interface": interface.value,
            "media": media,
            "read_only": read_only,
        })

    def add_port_forward(self, host_port: int, guest_port: int) -> None:
        """
        Add network port forwarding.

        Args:
            host_port: Port on host machine
            guest_port: Port inside VM
        """
        self.config.network_port_forward[host_port] = guest_port

    def cleanup(self) -> None:
        """Clean up temporary files."""
        # Stop VM if running
        if self._process and self._process.poll() is None:
            self.stop()

        # Remove temporary files
        if self.temp_dir.exists():
            try:
                shutil.rmtree(self.temp_dir)
                logger.info(f"Cleaned up temp directory: {self.temp_dir}")
            except Exception as e:
                logger.warning(f"Failed to cleanup temp directory: {e}")

    def __enter__(self):
        """Context manager entry."""
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        """Context manager exit."""
        self.cleanup()
        return False


# ============================================================================
# Utility Functions
# ============================================================================

def detect_architecture() -> QemuArchitecture:
    """Detect host architecture and return corresponding QEMU architecture."""
    machine = platform.machine().lower()

    arch_map = {
        "x86_64": QemuArchitecture.X86_64,
        "amd64": QemuArchitecture.X86_64,
        "aarch64": QemuArchitecture.AARCH64,
        "arm64": QemuArchitecture.AARCH64,
        "riscv64": QemuArchitecture.RISCV64,
        "ppc64le": QemuArchitecture.PPC64,
        "ppc64": QemuArchitecture.PPC64,
        "arm": QemuArchitecture.ARM,
    }

    return arch_map.get(machine, QemuArchitecture.X86_64)


def list_available_qemu_binaries() -> Dict[QemuArchitecture, Optional[Path]]:
    """List available QEMU binaries on the system."""
    available = {}

    for arch in QemuArchitecture:
        binary_name = arch.qemu_binary
        found = shutil.which(binary_name)
        available[arch] = Path(found) if found else None

    return available


# ============================================================================
# CLI Interface
# ============================================================================

def main():
    """Command-line interface for QEMU boot."""
    import argparse

    parser = argparse.ArgumentParser(
        description="QEMU Boot Integration for PixelRTS"
    )
    parser.add_argument(
        "image",
        help="Path to disk image, ISO, or RTS cartridge"
    )
    parser.add_argument(
        "--memory", "-m",
        default="1G",
        help="Memory allocation (default: 1G)"
    )
    parser.add_argument(
        "--cpus", "-c",
        type=int,
        default=2,
        help="Number of CPU cores (default: 2)"
    )
    parser.add_argument(
        "--arch", "-a",
        choices=[a.value for a in QemuArchitecture],
        default="x86_64",
        help="Target architecture (default: x86_64)"
    )
    parser.add_argument(
        "--kernel", "-k",
        help="Kernel file for direct boot"
    )
    parser.add_argument(
        "--initrd", "-i",
        help="Initrd/initramfs file"
    )
    parser.add_argument(
        "--cmdline",
        help="Kernel command line parameters"
    )
    parser.add_argument(
        "--vnc",
        type=int,
        default=0,
        help="VNC display number (default: 0)"
    )
    parser.add_argument(
        "--no-vnc",
        action="store_true",
        help="Disable VNC"
    )
    parser.add_argument(
        "--no-kvm",
        action="store_true",
        help="Disable KVM acceleration"
    )
    parser.add_argument(
        "--cloud-init",
        help="Cloud-init configuration JSON file"
    )
    parser.add_argument(
        "--port-forward",
        action="append",
        metavar="HOST:GUEST",
        help="Port forwarding (can be specified multiple times)"
    )
    parser.add_argument(
        "--screenshot",
        help="Take screenshot after boot (path to save)"
    )
    parser.add_argument(
        "--timeout",
        type=int,
        default=0,
        help="Auto-stop after N seconds (0 = no timeout)"
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Show command without executing"
    )

    args = parser.parse_args()

    # Build configuration
    arch = QemuArchitecture(args.arch)
    config = QemuConfig(
        memory=args.memory,
        cpus=args.cpus,
        architecture=arch,
        vnc_display=args.vnc,
        vnc_enabled=not args.no_vnc,
        enable_kvm=not args.no_kvm,
    )

    # Parse port forwards
    if args.port_forward:
        for pf in args.port_forward:
            host, guest = pf.split(":")
            config.network_port_forward[int(host)] = int(guest)

    # Create QEMU boot instance
    try:
        qemu = QemuBoot(
            image_path=args.image,
            memory=args.memory,
            cpus=args.cpus,
            architecture=arch,
            config=config,
        )

        # Prepare boot
        qemu.prepare_boot()

        # Load cloud-init config if provided
        cloud_init = None
        if args.cloud_init:
            with open(args.cloud_init, 'r') as f:
                ci_data = json.load(f)
            cloud_init = CloudInitConfig(**ci_data)

        # Handle dry run
        if args.dry_run:
            kernel = Path(args.kernel) if args.kernel else None
            initrd = Path(args.initrd) if args.initrd else None
            cmd = qemu._build_command(kernel, initrd, args.cmdline, cloud_init)
            print("Command:")
            print(" ".join(cmd))
            return 0

        # Start VM
        kernel = Path(args.kernel) if args.kernel else None
        initrd = Path(args.initrd) if args.initrd else None
        process = qemu.boot(
            kernel=kernel,
            initrd=initrd,
            cmdline=args.cmdline,
            cloud_init=cloud_init,
        )

        # Print status
        status = qemu.get_status()
        print(f"VM started:")
        print(f"  PID: {status['pid']}")
        if status['vnc_port']:
            print(f"  VNC: localhost:{status['vnc_port']}")
        if status['serial_socket']:
            print(f"  Serial: {status['serial_socket']}")

        # Take screenshot if requested
        if args.screenshot:
            time.sleep(5)  # Wait for boot
            if qemu.take_screenshot(Path(args.screenshot)):
                print(f"  Screenshot: {args.screenshot}")

        # Handle timeout
        if args.timeout > 0:
            time.sleep(args.timeout)
            qemu.stop()
            print(f"VM stopped after {args.timeout} seconds")
        else:
            # Wait for VM to exit
            process.wait()

    except KeyboardInterrupt:
        print("\nStopping VM...")
        qemu.stop()
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1
    finally:
        if 'qemu' in locals():
            qemu.cleanup()

    return 0


# ============================================================================
# Backward Compatibility Aliases
# ============================================================================

class QemuBootError(Exception):
    """Exception raised for QEMU boot errors."""
    pass


class QemuBootConfig(QemuConfig):
    """Alias for QemuConfig for backward compatibility."""
    pass


class QemuMachineConfig:
    """
    Machine-specific configuration (for backward compatibility).
    Use QemuConfig directly for new code.
    """
    def __init__(
        self,
        machine: str = "q35",
        cpu: str = "qemu64",
        memory: str = "1G",
        cpus: int = 2,
    ):
        self.machine = machine
        self.cpu = cpu
        self.memory = memory
        self.cpus = cpus


class QemuDiskConfig:
    """
    Disk configuration (for backward compatibility).
    Use DriveConfig directly for new code.
    """
    def __init__(
        self,
        path: str,
        interface: str = "virtio",
        media: str = "disk",
        format: str = "raw",
        read_only: bool = False,
    ):
        self.path = Path(path)
        self.interface = interface
        self.media = media
        self.format = format
        self.read_only = read_only


class QemuNetworkConfig:
    """
    Network configuration (for backward compatibility).
    Use NetworkMode enum and QemuConfig for new code.
    """
    def __init__(
        self,
        mode: str = "user",
        port_forwards: Optional[Dict[int, int]] = None,
    ):
        self.mode = mode
        self.port_forwards = port_forwards or {}


if __name__ == "__main__":
    sys.exit(main())
