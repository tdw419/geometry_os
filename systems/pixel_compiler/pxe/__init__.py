"""
PXE Boot Module

Provides DHCP, TFTP, and HTTP servers for PXE network booting.

Usage:
    from systems.pixel_compiler.pxe import DHCPServer, DHCPServerConfig

    config = DHCPServerConfig(
        interface="eth0",
        server_ip="192.168.1.1",
        ip_range_start="192.168.1.100",
        ip_range_end="192.168.1.200",
    )

    server = DHCPServer(config)
    asyncio.run(server.serve_forever())

CLI Usage:
    pixelrts pxe dhcp start --interface eth0 --ip-range-start 192.168.1.100
"""

from .dhcp_server import (
    DHCPServer,
    DHCPServerConfig,
    DHCPPacket,
    DHCPPacketParser,
    Lease,
    LeaseStore,
    DHCPProtocol,
)
from .pxe_cli import (
    create_parser,
    main,
)

__all__ = [
    'DHCPServer',
    'DHCPServerConfig',
    'DHCPPacket',
    'DHCPPacketParser',
    'Lease',
    'LeaseStore',
    'DHCPProtocol',
    'create_parser',
    'main',
]
