"""
PixelRTS Serve Module

Provides network serving capabilities for PixelRTS containers:
- NBD server plugin for nbdkit
- Proxy DHCP server for PXE boot (port 4011)
- TFTP server for boot file transfer (port 69)
- PXE configuration generator with iPXE chainload support
- Unified server orchestrator
- Rich progress display

iPXE Chainloading (Phase 7):
    For faster HTTP boot, use iPXE chainloading:
    1. Client PXE boots -> receives undionly.kpxe via TFTP
    2. iPXE loads -> fetches boot.ipxe via HTTP
    3. HTTP boot script -> loads kernel/initrd via HTTP (much faster than TFTP)

Usage:
    # Simple one-command serving
    from systems.pixel_compiler.serve import PixelRTSServer

    server = PixelRTSServer("container.rts.png")
    await server.run()  # Blocks until Ctrl+C

    # Or manage individual services:
    from systems.pixel_compiler.serve import ProxyDHCP, TFTPServer, PXEConfig

    # Configure
    dhcp = ProxyDHCP()
    dhcp.set_config(boot_file="pxelinux.0", tftp_ip="192.168.1.100")

    tftp = TFTPServer()
    tftp.set_root_dir("/srv/tftp")

    config = PXEConfig()
    cfg_content = config.generate_default_config("192.168.1.100", 10809)

    # Start services
    await dhcp.start()
    await tftp.start()

    # ... serve clients ...

    await dhcp.stop()
    await tftp.stop()
"""

from .dhcp_proxy import DHCPConfig, DHCPPacket, ProxyDHCP
from .http_server import HTTPBootServer, HTTPConfig
from .nbd_plugin import PixelRTSPlugin
from .progress import BootStage, ClientInfo, ClientTracker, ServeProgress
from .pxe_config import PXEConfig
from .server import NetworkConfig, PixelRTSServer, ServerStatus
from .tftp_server import TFTPServer, TFTPTransfer

__all__ = [
    'BootStage',
    'ClientInfo',
    'ClientTracker',
    'DHCPConfig',
    'DHCPPacket',
    'HTTPBootServer',
    'HTTPConfig',
    'NetworkConfig',
    'PXEConfig',
    'PixelRTSPlugin',
    'PixelRTSServer',
    'ProxyDHCP',
    'ServeProgress',
    'ServerStatus',
    'TFTPServer',
    'TFTPTransfer',
]
