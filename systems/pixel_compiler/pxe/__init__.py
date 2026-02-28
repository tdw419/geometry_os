"""
PXE Boot Module

Provides DHCP, TFTP, and HTTP servers for PXE network booting.

Usage:
    # DHCP Server
    from systems.pixel_compiler.pxe import DHCPServer, DHCPServerConfig

    dhcp_config = DHCPServerConfig(
        interface="eth0",
        server_ip="192.168.1.1",
        ip_range_start="192.168.1.100",
        ip_range_end="192.168.1.200",
    )
    dhcp_server = DHCPServer(dhcp_config)

    # TFTP Server
    from systems.pixel_compiler.pxe import TFTPServer, TFTPServerConfig

    tftp_config = TFTPServerConfig(
        root_dir="/tftpboot",
    )
    tftp_server = TFTPServer(tftp_config)

    # HTTP Server
    from systems.pixel_compiler.pxe import HTTPServer, HTTPServerConfig

    http_config = HTTPServerConfig(
        root_dir="/tftpboot",
        listen_port=8080,
    )
    http_server = HTTPServer(http_config)

    asyncio.run(dhcp_server.serve_forever())

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
from .tftp_server import (
    TFTPServer,
    TFTPServerConfig,
    TFTPPacket,
    TFTPPacketParser,
    TFTPProtocol,
    TFTPTransfer,
    TFTP_OPCODE_RRQ,
    TFTP_OPCODE_DATA,
    TFTP_OPCODE_ACK,
    TFTP_OPCODE_ERROR,
    TFTP_ERROR_FILE_NOT_FOUND,
    TFTP_ERROR_ACCESS_VIOLATION,
    TFTP_BLOCK_SIZE,
)
from .http_server import (
    HTTPServer,
    HTTPServerConfig,
    PXEContainerInfo,
)
from .pxe_cli import (
    create_parser,
    main,
)

__all__ = [
    # DHCP
    'DHCPServer',
    'DHCPServerConfig',
    'DHCPPacket',
    'DHCPPacketParser',
    'Lease',
    'LeaseStore',
    'DHCPProtocol',
    # TFTP
    'TFTPServer',
    'TFTPServerConfig',
    'TFTPPacket',
    'TFTPPacketParser',
    'TFTPProtocol',
    'TFTPTransfer',
    'TFTP_OPCODE_RRQ',
    'TFTP_OPCODE_DATA',
    'TFTP_OPCODE_ACK',
    'TFTP_OPCODE_ERROR',
    'TFTP_ERROR_FILE_NOT_FOUND',
    'TFTP_ERROR_ACCESS_VIOLATION',
    'TFTP_BLOCK_SIZE',
    # HTTP
    'HTTPServer',
    'HTTPServerConfig',
    'PXEContainerInfo',
    # CLI
    'create_parser',
    'main',
]
