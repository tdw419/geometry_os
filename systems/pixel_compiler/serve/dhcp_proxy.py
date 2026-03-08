"""
DHCP Proxy Server for PXE Boot

Implements a proxy DHCP server on port 4011 that responds only to PXE client
requests, leaving the primary DHCP server untouched.

This follows the Proxy DHCP specification where:
- Port 67: Primary DHCP server (handles IP allocation)
- Port 4011: Proxy DHCP server (provides PXE boot info only)

Key Features:
    - Async-compatible design using asyncio
    - Responds only to PXE clients (option 60 = "PXEClient")
    - Auto-detects server IP from interface
    - Configurable boot file and TFTP server

DHCP Packet Structure:
    - Uses struct module for packing/unpacking
    - Parses DHCP options to detect PXE clients
    - Builds DHCPOFFER with PXE-specific options (60, 43)

Usage:
    proxy = ProxyDHCP()
    proxy.set_config(boot_file="pxelinux.0", tftp_ip="192.168.1.100")
    await proxy.start()

    # ... serving ...

    await proxy.stop()
"""

import asyncio
import socket
import struct
import logging
from dataclasses import dataclass, field
from typing import Optional, Tuple, Dict, Any
from pathlib import Path

logger = logging.getLogger(__name__)


# DHCP Constants
DHCP_SERVER_PORT = 67  # Standard DHCP server port
DHCP_CLIENT_PORT = 68  # Standard DHCP client port
PROXY_DHCP_PORT = 4011  # Proxy DHCP port (PXE)

# DHCP Message Types
DHCP_DISCOVER = 1
DHCP_OFFER = 2
DHCP_REQUEST = 3
DHCP_DECLINE = 4
DHCP_ACK = 5
DHCP_NAK = 6
DHCP_RELEASE = 7
DHCP_INFORM = 8

# DHCP Option Codes
OPTION_SUBNET_MASK = 1
OPTION_ROUTER = 3
OPTION_DNS_SERVER = 6
OPTION_HOST_NAME = 12
OPTION_DOMAIN_NAME = 15
OPTION_REQUESTED_IP = 50
OPTION_LEASE_TIME = 51
OPTION_MESSAGE_TYPE = 53
OPTION_SERVER_ID = 54
OPTION_PARAMETER_REQUEST_LIST = 55
OPTION_VENDOR_CLASS = 60  # PXE Client identifier
OPTION_CLIENT_ARCH = 93   # Client architecture
OPTION_CLIENT_NDI = 94    # Client network device interface
OPTION_VENDOR_ENCAPSULATED = 43  # Vendor-specific options (PXE boot server)

# DHCP Magic Cookie
DHCP_MAGIC_COOKIE = b'\x63\x82\x53\x63'

# PXE Vendor Class Identifier
PXE_CLIENT_ID = b'PXEClient'


@dataclass
class DHCPConfig:
    """Configuration for DHCP proxy server."""
    boot_file: str = "pxelinux.0"
    tftp_server: str = ""
    server_ip: str = ""
    listen_address: str = "0.0.0.0"
    listen_port: int = PROXY_DHCP_PORT

    def __post_init__(self):
        """Auto-detect server IP if not provided."""
        if not self.server_ip:
            self.server_ip = self._detect_interface_ip()
        if not self.tftp_server:
            self.tftp_server = self.server_ip

    @staticmethod
    def _detect_interface_ip() -> str:
        """
        Auto-detect the primary interface IP address.

        Returns:
            IP address string, or "0.0.0.0" if detection fails
        """
        try:
            # Create socket to determine outbound interface
            s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            s.connect(("8.8.8.8", 80))
            ip = s.getsockname()[0]
            s.close()
            return ip
        except Exception as e:
            logger.warning(f"Could not auto-detect interface IP: {e}")
            return "0.0.0.0"


@dataclass
class DHCPPacket:
    """Represents a parsed DHCP packet."""
    message_type: int = 0
    xid: bytes = b''  # Transaction ID (4 bytes)
    client_mac: bytes = b''  # Client MAC address (6 bytes)
    client_ip: str = "0.0.0.0"
    your_ip: str = "0.0.0.0"
    server_ip: str = "0.0.0.0"
    gateway_ip: str = "0.0.0.0"
    options: Dict[int, bytes] = field(default_factory=dict)
    is_pxe_client: bool = False
    raw_data: bytes = b''


class ProxyDHCP:
    """
    Proxy DHCP server for PXE boot.

    Listens on UDP port 4011 and responds to DHCPDISCOVER requests from
    PXE clients with DHCPOFFER containing boot server information.

    This does NOT allocate IP addresses - it only provides PXE boot info.
    The primary DHCP server (port 67) handles IP allocation.

    Example:
        proxy = ProxyDHCP()
        proxy.set_config(boot_file="pxelinux.0", tftp_ip="192.168.1.100")
        await proxy.start()

        # Later...
        await proxy.stop()
    """

    def __init__(self, config: Optional[DHCPConfig] = None):
        """
        Initialize Proxy DHCP server.

        Args:
            config: Optional DHCPConfig with server settings
        """
        self.config = config or DHCPConfig()
        self._socket: Optional[asyncio.DatagramSocket] = None
        self._running = False
        self._task: Optional[asyncio.Task] = None

    def set_config(self, boot_file: str, tftp_ip: Optional[str] = None) -> None:
        """
        Configure boot parameters.

        Args:
            boot_file: Boot filename (e.g., "pxelinux.0")
            tftp_ip: TFTP server IP (defaults to auto-detected server IP)
        """
        self.config.boot_file = boot_file
        if tftp_ip:
            self.config.tftp_server = tftp_ip

    async def start(self) -> None:
        """
        Start listening for DHCP requests on port 4011.

        Raises:
            OSError: If port 4011 is already in use
        """
        if self._running:
            logger.warning("Proxy DHCP server already running")
            return

        logger.info(f"Starting Proxy DHCP server on {self.config.listen_address}:4011")

        # Create UDP socket
        self._socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self._socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self._socket.bind((self.config.listen_address, PROXY_DHCP_PORT))
        self._socket.setblocking(False)

        self._running = True
        self._task = asyncio.create_task(self._receive_loop())

        logger.info(f"Proxy DHCP server listening on port {PROXY_DHCP_PORT}")
        logger.info(f"Server IP: {self.config.server_ip}")
        logger.info(f"TFTP Server: {self.config.tftp_server}")
        logger.info(f"Boot file: {self.config.boot_file}")

    async def stop(self) -> None:
        """Stop the Proxy DHCP server."""
        if not self._running:
            return

        logger.info("Stopping Proxy DHCP server...")
        self._running = False

        if self._task:
            self._task.cancel()
            try:
                await self._task
            except asyncio.CancelledError:
                pass
            self._task = None

        if self._socket:
            self._socket.close()
            self._socket = None

        logger.info("Proxy DHCP server stopped")

    async def _receive_loop(self) -> None:
        """Main receive loop for handling DHCP requests."""
        loop = asyncio.get_event_loop()

        while self._running:
            try:
                data, addr = await loop.sock_recvfrom(self._socket, 1024)
                logger.debug(f"Received DHCP packet from {addr}")

                # Parse the packet
                packet = self.parse_dhcp_packet(data)

                if packet.message_type == DHCP_DISCOVER:
                    # Only respond if this is a PXE client
                    if packet.is_pxe_client:
                        logger.info(f"DHCPDISCOVER from PXE client {packet.client_mac.hex(':')}")
                        response = self.handle_discover(packet)
                        if response:
                            await loop.sock_sendto(self._socket, response, (addr[0], DHCP_CLIENT_PORT))
                            logger.debug(f"Sent DHCPOFFER to {addr}")
                    else:
                        logger.debug(f"Ignoring non-PXE DHCPDISCOVER from {packet.client_mac.hex(':')}")

            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Error in receive loop: {e}")

    def parse_dhcp_packet(self, data: bytes) -> DHCPPacket:
        """
        Parse a DHCP packet from raw bytes.

        Args:
            data: Raw DHCP packet bytes

        Returns:
            DHCPPacket with parsed fields
        """
        packet = DHCPPacket(raw_data=data)

        if len(data) < 240:  # Minimum DHCP packet size
            logger.warning("Packet too short for DHCP")
            return packet

        # Parse fixed fields
        # Format: op(1), htype(1), hlen(1), hops(1), xid(4), secs(2), flags(2),
        #         ciaddr(4), yiaddr(4), siaddr(4), giaddr(4),
        #         chaddr(16), sname(64), file(128), magic(4), options...
        try:
            op, htype, hlen, hops = struct.unpack('!BBBB', data[0:4])
            packet.xid = data[4:8]
            secs, flags = struct.unpack('!HH', data[8:12])
            packet.client_ip = self._bytes_to_ip(data[12:16])
            packet.your_ip = self._bytes_to_ip(data[16:20])
            packet.server_ip = self._bytes_to_ip(data[20:24])
            packet.gateway_ip = self._bytes_to_ip(data[24:28])

            # Extract client MAC (first 6 bytes of chaddr field)
            packet.client_mac = data[28:28 + hlen]

            # Verify magic cookie
            if data[236:240] != DHCP_MAGIC_COOKIE:
                logger.warning("Invalid DHCP magic cookie")
                return packet

            # Parse options
            options = self._parse_options(data[240:])
            packet.options = options

            # Get message type
            if OPTION_MESSAGE_TYPE in options:
                packet.message_type = options[OPTION_MESSAGE_TYPE][0]

            # Check for PXE client
            if OPTION_VENDOR_CLASS in options:
                vendor_class = options[OPTION_VENDOR_CLASS]
                packet.is_pxe_client = vendor_class.startswith(PXE_CLIENT_ID)

        except Exception as e:
            logger.error(f"Error parsing DHCP packet: {e}")

        return packet

    def handle_discover(self, packet: DHCPPacket) -> bytes:
        """
        Generate DHCPOFFER response for a DHCPDISCOVER.

        Args:
            packet: The DHCPDISCOVER packet from client

        Returns:
            DHCPOFFER packet bytes, or empty bytes if should not respond
        """
        if not packet.is_pxe_client:
            return b''

        return self.build_dhcp_offer(
            client_mac=packet.client_mac,
            xid=packet.xid,
            client_ip=packet.client_ip,
            gateway_ip=packet.gateway_ip
        )

    def build_dhcp_offer(
        self,
        client_mac: bytes,
        xid: bytes,
        client_ip: str = "0.0.0.0",
        gateway_ip: str = "0.0.0.0"
    ) -> bytes:
        """
        Build a DHCPOFFER packet with PXE boot information.

        Args:
            client_mac: Client MAC address (6 bytes)
            xid: Transaction ID from client (4 bytes)
            client_ip: Client's current IP (usually 0.0.0.0)
            gateway_ip: Gateway IP if relayed

        Returns:
            DHCPOFFER packet bytes
        """
        # Build fixed header
        # op=2 (BOOTREPLY), htype=1 (Ethernet), hlen=6, hops=0
        header = struct.pack('!BBBB', 2, 1, 6, 0)
        header += xid  # Transaction ID
        header += struct.pack('!HH', 0, 0x8000)  # secs, flags (broadcast)

        # IP addresses
        header += self._ip_to_bytes(client_ip)  # ciaddr
        header += self._ip_to_bytes("0.0.0.0")  # yiaddr (we don't assign IPs)
        header += self._ip_to_bytes(self.config.server_ip)  # siaddr (TFTP server)
        header += self._ip_to_bytes(gateway_ip)  # giaddr

        # Client hardware address (16 bytes, pad MAC with zeros)
        chaddr = client_mac + b'\x00' * 10
        header += chaddr

        # Server name (64 bytes, empty)
        header += b'\x00' * 64

        # Boot file (128 bytes)
        boot_file_bytes = self.config.boot_file.encode('ascii')
        header += boot_file_bytes + b'\x00' * (128 - len(boot_file_bytes))

        # Magic cookie
        header += DHCP_MAGIC_COOKIE

        # Build options
        options = []

        # Option 53: Message Type = DHCPOFFER (2)
        options.append(self._build_option(OPTION_MESSAGE_TYPE, bytes([DHCP_OFFER])))

        # Option 54: Server Identifier
        options.append(self._build_option(OPTION_SERVER_ID, self._ip_to_bytes(self.config.server_ip)))

        # Option 60: Vendor Class Identifier (echo back PXEClient)
        options.append(self._build_option(OPTION_VENDOR_CLASS, PXE_CLIENT_ID))

        # Option 43: Vendor Encapsulated Options (PXE boot server info)
        # This contains PXE-specific boot server discovery control
        pxe_options = self._build_pxe_vendor_options()
        options.append(self._build_option(OPTION_VENDOR_ENCAPSULATED, pxe_options))

        # End option
        options.append(b'\xff')

        return header + b''.join(options)

    def _build_pxe_vendor_options(self) -> bytes:
        """
        Build PXE-specific vendor options for option 43.

        PXE vendor options include:
        - Sub-option 6: Boot server discovery control
        - Sub-option 8: Multicast discovery control

        Returns:
            PXE vendor options bytes
        """
        options = []

        # Sub-option 6: Boot Server Discovery Control
        # 0x08 = Don't discover, use boot server from option 43
        options.append(bytes([6, 1, 0x08]))

        # Sub-option 8: Multicast Discovery Control
        # 0x00 = Don't use multicast discovery
        options.append(bytes([8, 1, 0x00]))

        return b''.join(options)

    @staticmethod
    def _parse_options(data: bytes) -> Dict[int, bytes]:
        """
        Parse DHCP options from bytes.

        Args:
            data: Option bytes starting after magic cookie

        Returns:
            Dictionary mapping option code to option value
        """
        options = {}
        i = 0

        while i < len(data):
            code = data[i]
            i += 1

            if code == 0:  # Padding
                continue
            if code == 255:  # End
                break

            if i >= len(data):
                break

            length = data[i]
            i += 1

            if i + length > len(data):
                break

            value = data[i:i + length]
            options[code] = value
            i += length

        return options

    @staticmethod
    def _build_option(code: int, value: bytes) -> bytes:
        """Build a DHCP option."""
        return bytes([code, len(value)]) + value

    @staticmethod
    def _ip_to_bytes(ip: str) -> bytes:
        """Convert IP string to 4 bytes."""
        parts = [int(p) for p in ip.split('.')]
        return bytes(parts)

    @staticmethod
    def _bytes_to_ip(data: bytes) -> str:
        """Convert 4 bytes to IP string."""
        return '.'.join(str(b) for b in data)

    def __repr__(self) -> str:
        status = "running" if self._running else "stopped"
        return f"ProxyDHCP(server={self.config.server_ip}, port={PROXY_DHCP_PORT}, status={status})"
