"""
PixelRTS Serve Module

Provides network serving capabilities for PixelRTS containers:
- NBD server plugin for nbdkit
- Proxy DHCP server for PXE boot (port 4011)
- TFTP server for boot file transfer (port 69)
- PXE configuration generator

Usage:
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

from .nbd_plugin import PixelRTSPlugin
from .dhcp_proxy import ProxyDHCP, DHCPConfig, DHCPPacket
from .tftp_server import TFTPServer, TFTPTransfer
from .pxe_config import PXEConfig

__all__ = [
    'PixelRTSPlugin',
    'ProxyDHCP',
    'DHCPConfig',
    'DHCPPacket',
    'TFTPServer',
    'TFTPTransfer',
    'PXEConfig',
]
