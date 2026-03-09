"""
PixelRTS Unified Server

Orchestrates all network boot services (DHCP proxy, TFTP server, NBD server)
for serving PixelRTS containers over the network.

Key Features:
    - Zero-config operation with auto-detection
    - Single command to start all services
    - Rich terminal output with progress display
    - Graceful shutdown with Ctrl+C
    - Validates container before starting services

Usage:
    server = PixelRTSServer("container.rts.png")
    await server.run()  # Blocking until Ctrl+C
"""

import asyncio
import os
import signal
import socket
import subprocess
import tempfile
import logging
import shutil
from dataclasses import dataclass, field
from pathlib import Path
from typing import Optional, Dict, Any, List, Tuple

logger = logging.getLogger(__name__)

# Service ports
DHCP_PROXY_PORT = 4011
TFTP_PORT = 69
NBD_PORT = 10809
HTTP_PORT = 8080


@dataclass
class NetworkConfig:
    """Detected network configuration."""
    interface: str = ""
    ip_address: str = ""
    subnet: str = ""
    gateway: str = ""

    def __repr__(self) -> str:
        return f"NetworkConfig(interface={self.interface}, ip={self.ip_address})"


@dataclass
class ServerStatus:
    """Status of server services."""
    dhcp_running: bool = False
    tftp_running: bool = False
    nbd_running: bool = False
    http_running: bool = False
    delta_enabled: bool = False
    clients_served: int = 0
    bytes_transferred: int = 0
    errors: List[str] = field(default_factory=list)


class PixelRTSServer:
    """
    Unified server orchestrating all network boot services.

    This class coordinates:
    - DHCP Proxy (port 4011) for PXE boot responses
    - TFTP Server (port 69) for boot file transfers
    - NBD Server (port 10809) for root filesystem

    Example:
        server = PixelRTSServer("container.rts.png")
        await server.run()  # Blocks until Ctrl+C
    """

    def __init__(
        self,
        rts_png_path: str,
        interface: Optional[str] = None,
        verbose: bool = False,
        enable_http: bool = False,
        http_port: int = HTTP_PORT,
        enable_delta: bool = False
    ):
        """
        Initialize the PixelRTS server.

        Args:
            rts_png_path: Path to the .rts.png container file
            interface: Optional network interface override (auto-detect if None)
            verbose: Enable verbose logging
            enable_http: Enable HTTP boot for faster transfers (chainloads iPXE)
            http_port: HTTP server port (default: 8080)
            enable_delta: Enable delta update support (serves /delta/* endpoints)
        """
        self.rts_png_path = Path(rts_png_path).resolve()
        self.interface_override = interface
        self.verbose = verbose

        # Network configuration
        self.network_config: Optional[NetworkConfig] = None

        # Server instances
        self._dhcp_proxy = None
        self._tftp_server = None
        self._nbd_process: Optional[subprocess.Popen] = None
        self._http_server = None
        self._delta_server = None

        # HTTP boot options
        self._enable_http = enable_http
        self._http_port = http_port

        # Delta update options
        self._enable_delta = enable_delta

        # Runtime state
        self._running = False
        self._temp_dir: Optional[str] = None
        self._shutdown_event = asyncio.Event()
        self.status = ServerStatus()

        # Progress callback
        self._progress_callback = None

    def detect_network(self) -> NetworkConfig:
        """
        Auto-detect active network interface with network access.

        Detection logic:
        1. List all network interfaces
        2. Filter for non-loopback, active interfaces
        3. Prefer interfaces with default gateway
        4. Get IP address and subnet

        Returns:
            NetworkConfig with detected settings

        Raises:
            RuntimeError: If no suitable interface found
        """
        config = NetworkConfig()

        # If interface override provided, use it
        if self.interface_override:
            config.interface = self.interface_override
            config.ip_address = self._get_interface_ip(self.interface_override)
            if not config.ip_address:
                raise RuntimeError(
                    f"Could not get IP for interface: {self.interface_override}"
                )
            self.network_config = config
            return config

        # Try to detect interface by creating a UDP socket to external address
        try:
            # This doesn't actually send data, just determines route
            s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            s.connect(("8.8.8.8", 80))
            config.ip_address = s.getsockname()[0]
            s.close()

            # Get interface name from IP
            config.interface = self._get_interface_from_ip(config.ip_address)

            if not config.interface:
                raise RuntimeError("Could not determine interface name")

        except Exception as e:
            logger.warning(f"Auto-detection failed: {e}")
            # Fallback: try common interface names
            for iface in ['eth0', 'en0', 'wlan0', 'enp0s3', 'ens33']:
                ip = self._get_interface_ip(iface)
                if ip and not ip.startswith('127.'):
                    config.interface = iface
                    config.ip_address = ip
                    break

        if not config.interface or not config.ip_address:
            raise RuntimeError(
                "Could not auto-detect network interface. "
                "Please specify with --interface option."
            )

        self.network_config = config
        logger.info(f"Detected network: {config.interface} ({config.ip_address})")
        return config

    def _get_interface_ip(self, interface: str) -> Optional[str]:
        """Get IP address for a specific interface."""
        try:
            import netifaces
            addrs = netifaces.ifaddresses(interface)
            if netifaces.AF_INET in addrs:
                return addrs[netifaces.AF_INET][0].get('addr')
        except ImportError:
            # Fallback without netifaces
            try:
                result = subprocess.run(
                    ['ip', 'addr', 'show', interface],
                    capture_output=True, text=True, timeout=5
                )
                for line in result.stdout.split('\n'):
                    if 'inet ' in line:
                        parts = line.strip().split()
                        for i, part in enumerate(parts):
                            if part == 'inet' and i + 1 < len(parts):
                                return parts[i + 1].split('/')[0]
            except Exception:
                pass
        return None

    def _get_interface_from_ip(self, ip: str) -> Optional[str]:
        """Get interface name from IP address."""
        try:
            import netifaces
            for iface in netifaces.interfaces():
                if iface.startswith('lo'):
                    continue
                addrs = netifaces.ifaddresses(iface)
                if netifaces.AF_INET in addrs:
                    for addr_info in addrs[netifaces.AF_INET]:
                        if addr_info.get('addr') == ip:
                            return iface
        except ImportError:
            # Fallback without netifaces
            try:
                result = subprocess.run(
                    ['ip', 'addr'],
                    capture_output=True, text=True, timeout=5
                )
                current_iface = None
                for line in result.stdout.split('\n'):
                    if ': ' in line and not line.strip().startswith('inet'):
                        # Interface line like "2: eth0: <BROADCAST..."
                        parts = line.split(': ')
                        if len(parts) >= 2:
                            current_iface = parts[1].split('@')[0]
                    elif 'inet ' in line and current_iface:
                        if ip in line:
                            return current_iface
            except Exception:
                pass
        return None

    def validate_container(self) -> Dict[str, Any]:
        """
        Validate that the file is a valid PixelRTS container.

        Returns:
            Container metadata dict

        Raises:
            ValueError: If file doesn't exist or is not a valid container
        """
        if not self.rts_png_path.exists():
            raise ValueError(f"File not found: {self.rts_png_path}")

        if not self.rts_png_path.is_file():
            raise ValueError(f"Not a file: {self.rts_png_path}")

        # Try to read container metadata
        try:
            from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder

            with open(self.rts_png_path, 'rb') as f:
                png_data = f.read()

            decoder = PixelRTSDecoder()
            # Try to decode first byte to validate container
            decoder.decode_range(png_data, 0, 1)

            metadata = decoder.get_metadata()
            if not metadata:
                raise ValueError("Not a valid PixelRTS container: missing metadata")

            logger.info(f"Validated container: {self.rts_png_path}")
            logger.info(f"Data size: {metadata.get('data_size', 'unknown')} bytes")

            return metadata

        except Exception as e:
            raise ValueError(
                f"Not a valid PixelRTS container: {self.rts_png_path}. "
                f"Error: {e}"
            )

    def prepare_boot_files(self) -> Path:
        """
        Extract kernel/initrd from container to temp TFTP directory.

        For now, creates placeholder files. Real implementation would
        extract boot files from the container.

        Returns:
            Path to temp TFTP root directory
        """
        # Create temp directory for TFTP files
        self._temp_dir = tempfile.mkdtemp(prefix='pixelrts_tftp_')
        tftp_root = Path(self._temp_dir)

        logger.info(f"Preparing boot files in: {tftp_root}")

        # Create pxelinux.cfg directory
        pxelinux_cfg = tftp_root / "pxelinux.cfg"
        pxelinux_cfg.mkdir(exist_ok=True)

        # Generate PXE config
        from systems.pixel_compiler.serve.pxe_config import PXEConfig

        pxe_config = PXEConfig()

        # Check if HTTP boot is enabled
        if self._enable_http:
            # Ensure undionly.kpxe is available for iPXE chainload
            PXEConfig.ensure_ipxe_boot_files(tftp_root)

            # Generate iPXE chainload config for pxelinux.cfg/default
            config_content = pxe_config.generate_ipxe_chainload_config(
                server_ip=self.network_config.ip_address,
                http_port=self._http_port,
                nbd_port=NBD_PORT
            )

            # Generate boot.ipxe script for HTTP boot
            boot_ipxe_content = pxe_config.generate_ipxe_script(
                server_ip=self.network_config.ip_address,
                http_port=self._http_port,
                nbd_port=NBD_PORT
            )

            # Write boot.ipxe to tftp_root (served via HTTP)
            boot_ipxe_file = tftp_root / "boot.ipxe"
            boot_ipxe_file.write_text(boot_ipxe_content)
            logger.info(f"Generated boot.ipxe for HTTP boot: {boot_ipxe_file}")
        else:
            # Standard TFTP-only config
            config_content = pxe_config.generate_default_config(
                server_ip=self.network_config.ip_address,
                nbd_port=NBD_PORT
            )

        config_file = pxelinux_cfg / "default"
        config_file.write_text(config_content)

        logger.info(f"Generated PXE config: {config_file}")

        # Create placeholder boot files (in real implementation, extract from container)
        # For now, document what files are needed
        boot_files_info = tftp_root / "BOOT_FILES_NEEDED.txt"
        boot_files_info.write_text("""# Required Boot Files

The following files need to be present in the TFTP root directory
for PXE boot to work:

1. pxelinux.0 - PXE bootloader (from syslinux/pxelinux package)
2. ldlinux.c32 - Syslinux core module
3. vmlinuz - Linux kernel
4. initrd.img - Initial ramdisk

Install on Debian/Ubuntu:
    sudo apt-get install pxelinux syslinux-common

Copy files:
    cp /usr/lib/PXELINUX/pxelinux.0 .
    cp /usr/lib/syslinux/modules/bios/ldlinux.c32 .

The kernel and initrd should be extracted from the PixelRTS container
or provided separately.
""")

        return tftp_root

    async def start(self) -> None:
        """
        Start all network boot services.

        Services are started in order:
        1. TFTP server (for boot files)
        2. DHCP proxy (for PXE boot info)
        3. HTTP server (for HTTP boot, if enabled)
        4. NBD server (for root filesystem)

        Raises:
            OSError: If ports are already in use
            RuntimeError: If services fail to start
        """
        if self._running:
            logger.warning("Server already running")
            return

        logger.info("Starting PixelRTS server...")

        # Ensure network config is detected
        if not self.network_config:
            self.detect_network()

        # Prepare boot files
        tftp_root = self.prepare_boot_files()

        # Start TFTP server
        from systems.pixel_compiler.serve.tftp_server import TFTPServer

        self._tftp_server = TFTPServer(root_dir=str(tftp_root))
        try:
            await self._tftp_server.start()
            self.status.tftp_running = True
            logger.info(f"TFTP server started on port {TFTP_PORT}")
        except PermissionError:
            raise RuntimeError(
                f"Permission denied for port {TFTP_PORT}. "
                "TFTP requires root privileges or CAP_NET_BIND_SERVICE."
            )
        except OSError as e:
            if 'Address already in use' in str(e):
                raise RuntimeError(
                    f"Port {TFTP_PORT} already in use. "
                    "Stop existing TFTP server or use a different port."
                )
            raise

        # Start DHCP proxy
        from systems.pixel_compiler.serve.dhcp_proxy import ProxyDHCP, DHCPConfig

        dhcp_config = DHCPConfig(
            boot_file="pxelinux.0",
            server_ip=self.network_config.ip_address,
            tftp_server=self.network_config.ip_address
        )
        self._dhcp_proxy = ProxyDHCP(config=dhcp_config)
        try:
            await self._dhcp_proxy.start()
            self.status.dhcp_running = True
            logger.info(f"DHCP proxy started on port {DHCP_PROXY_PORT}")
        except OSError as e:
            await self._tftp_server.stop()
            if 'Address already in use' in str(e):
                raise RuntimeError(
                    f"Port {DHCP_PROXY_PORT} already in use. "
                    "Stop existing DHCP proxy or use a different port."
                )
            raise

        # Start HTTP server (if enabled)
        if self._enable_http:
            from systems.pixel_compiler.serve.http_server import HTTPBootServer, HTTPConfig

            http_config = HTTPConfig(
                host=self.network_config.ip_address,
                port=self._http_port,
                root_dir=str(tftp_root)
            )
            self._http_server = HTTPBootServer(config=http_config)
            try:
                await self._http_server.start()
                self.status.http_running = True
                logger.info(f"HTTP server started on port {self._http_port}")
            except OSError as e:
                # Graceful degradation: continue with TFTP-only mode
                logger.warning(f"Failed to start HTTP server: {e}")
                logger.warning("Continuing with TFTP-only mode")
                self._http_server = None
                self.status.errors.append(f"HTTP server failed to start: {e}")

        # Start Delta server (if enabled, requires HTTP)
        if self._enable_delta:
            from systems.pixel_compiler.serve.delta_server import DeltaServer

            if not self._http_server:
                logger.warning("Delta server requires HTTP server. Skipping delta.")
                self.status.errors.append("Delta server requires HTTP server")
            else:
                try:
                    self._delta_server = DeltaServer(
                        container_path=str(self.rts_png_path),
                        http_root=str(tftp_root)
                    )
                    self.status.delta_enabled = True
                    logger.info("Delta server initialized")
                except Exception as e:
                    logger.warning(f"Failed to initialize delta server: {e}")
                    self._delta_server = None
                    self.status.errors.append(f"Delta server failed: {e}")

        # Start NBD server (via nbdkit subprocess)
        try:
            await self._start_nbd_server()
            self.status.nbd_running = True
            logger.info(f"NBD server started on port {NBD_PORT}")
        except Exception as e:
            await self._tftp_server.stop()
            await self._dhcp_proxy.stop()
            if self._http_server:
                await self._http_server.stop()
            raise RuntimeError(f"Failed to start NBD server: {e}")

        self._running = True
        logger.info("All services started successfully")

    async def _start_nbd_server(self) -> None:
        """Start nbdkit process with PixelRTS plugin."""
        # Check if nbdkit is available
        if not shutil.which('nbdkit'):
            logger.warning(
                "nbdkit not found in PATH. NBD server will not start. "
                "Install with: sudo apt-get install nbdkit"
            )
            # Don't fail - allow running without NBD for testing
            return

        # Build nbdkit command
        plugin_path = Path(__file__).parent / "nbd_plugin.py"

        cmd = [
            'nbdkit',
            '--foreground',
            '--port', str(NBD_PORT),
            '--interface', self.network_config.ip_address,
            'python',
            str(plugin_path),
            f'file={self.rts_png_path}'
        ]

        logger.debug(f"Starting nbdkit: {' '.join(cmd)}")

        # Start nbdkit as subprocess
        self._nbd_process = subprocess.Popen(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE
        )

        # Give it a moment to start
        await asyncio.sleep(0.5)

        # Check if process is still running
        if self._nbd_process.poll() is not None:
            stdout, stderr = self._nbd_process.communicate()
            raise RuntimeError(
                f"nbdkit failed to start: {stderr.decode()}"
            )

    async def stop(self) -> None:
        """Stop all services cleanly."""
        if not self._running:
            return

        logger.info("Stopping PixelRTS server...")
        self._running = False

        # Stop NBD server
        if self._nbd_process:
            try:
                self._nbd_process.terminate()
                self._nbd_process.wait(timeout=5)
            except subprocess.TimeoutExpired:
                self._nbd_process.kill()
            except Exception as e:
                logger.warning(f"Error stopping NBD server: {e}")
            self._nbd_process = None
            self.status.nbd_running = False
            logger.info("NBD server stopped")

        # Stop HTTP server
        if self._http_server:
            try:
                await self._http_server.stop()
            except Exception as e:
                logger.warning(f"Error stopping HTTP server: {e}")
            self._http_server = None
            self.status.http_running = False
            logger.info("HTTP server stopped")

        # Clean up Delta server
        if self._delta_server:
            try:
                self._delta_server.clear_cache()
            except Exception as e:
                logger.warning(f"Error cleaning up delta server: {e}")
            self._delta_server = None
            self.status.delta_enabled = False
            logger.info("Delta server stopped")

        # Stop DHCP proxy
        if self._dhcp_proxy:
            try:
                await self._dhcp_proxy.stop()
            except Exception as e:
                logger.warning(f"Error stopping DHCP proxy: {e}")
            self._dhcp_proxy = None
            self.status.dhcp_running = False
            logger.info("DHCP proxy stopped")

        # Stop TFTP server
        if self._tftp_server:
            try:
                await self._tftp_server.stop()
            except Exception as e:
                logger.warning(f"Error stopping TFTP server: {e}")
            self._tftp_server = None
            self.status.tftp_running = False
            logger.info("TFTP server stopped")

        # Clean up temp directory
        if self._temp_dir and os.path.exists(self._temp_dir):
            try:
                shutil.rmtree(self._temp_dir)
            except Exception as e:
                logger.warning(f"Error cleaning temp directory: {e}")
            self._temp_dir = None

        logger.info("Server shutdown complete")

    async def run(self) -> int:
        """
        Main blocking run loop with signal handling.

        This method:
        1. Starts all services
        2. Waits for shutdown signal (Ctrl+C)
        3. Stops all services cleanly

        Returns:
            Exit code (0 for clean shutdown, non-zero for errors)
        """
        # Setup signal handlers
        loop = asyncio.get_event_loop()

        def signal_handler():
            logger.info("Shutdown signal received")
            self._shutdown_event.set()

        try:
            loop.add_signal_handler(signal.SIGINT, signal_handler)
            loop.add_signal_handler(signal.SIGTERM, signal_handler)
        except NotImplementedError:
            # Windows doesn't support add_signal_handler
            pass

        try:
            # Start all services
            await self.start()

            # Print startup info
            self._print_startup_info()

            # Wait for shutdown
            await self._shutdown_event.wait()

            return 0

        except ValueError as e:
            logger.error(f"Configuration error: {e}")
            return 1
        except RuntimeError as e:
            logger.error(f"Runtime error: {e}")
            return 4
        except Exception as e:
            logger.error(f"Unexpected error: {e}")
            return 4
        finally:
            # Ensure cleanup
            await self.stop()

            # Remove signal handlers
            try:
                loop.remove_signal_handler(signal.SIGINT)
                loop.remove_signal_handler(signal.SIGTERM)
            except (NotImplementedError, ValueError):
                pass

    def _print_startup_info(self) -> None:
        """Print server configuration to console."""
        if not self.network_config:
            return

        print("\n" + "=" * 60)
        print("PixelRTS Network Boot Server")
        print("=" * 60)
        print(f"\nContainer: {self.rts_png_path}")
        print(f"Interface: {self.network_config.interface}")
        print(f"IP Address: {self.network_config.ip_address}")
        print("\nServices:")
        print(f"  DHCP Proxy: port {DHCP_PROXY_PORT} ({'running' if self.status.dhcp_running else 'not started'})")
        print(f"  TFTP Server: port {TFTP_PORT} ({'running' if self.status.tftp_running else 'not started'})")
        print(f"  HTTP Server: port {self._http_port} ({'running' if self.status.http_running else 'not started'})")
        print(f"  Delta Server: {'enabled' if self.status.delta_enabled else 'disabled'}")
        print(f"  NBD Server: port {NBD_PORT} ({'running' if self.status.nbd_running else 'not started'})")
        print("\nPress Ctrl+C to stop")
        print("=" * 60 + "\n")

    def set_progress_callback(self, callback) -> None:
        """
        Set a callback for progress updates.

        Args:
            callback: Async function to call with progress updates
        """
        self._progress_callback = callback

    async def generate_delta(self, old_version_path: str, version_tag: Optional[str] = None) -> Optional[str]:
        """
        Generate a delta manifest for the current container against an old version.

        Args:
            old_version_path: Path to the old .rts.png file to diff against
            version_tag: Optional tag for the manifest

        Returns:
            Path to the generated manifest file, or None if delta server not enabled

        Raises:
            RuntimeError: If delta server is not enabled
            FileNotFoundError: If old_version_path doesn't exist
        """
        if not self._delta_server:
            raise RuntimeError("Delta server not enabled. Start with --delta flag.")

        # Run manifest generation in thread pool to avoid blocking
        loop = asyncio.get_event_loop()
        manifest_path = await loop.run_in_executor(
            None,
            self._delta_server.generate_manifest_for_version,
            old_version_path,
            version_tag
        )

        return manifest_path

    def __repr__(self) -> str:
        status = "running" if self._running else "stopped"
        return f"PixelRTSServer(file={self.rts_png_path}, status={status})"
