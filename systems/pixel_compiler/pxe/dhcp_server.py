"""
Async DHCP Server for PXE Boot.

Provides DHCP server functionality for PXE clients to receive
IP addresses and boot instructions automatically.

Usage:
    python -m systems.pixel_compiler.pxe.dhcp_server --interface eth0 --ip-start 192.168.1.100 --ip-end 192.168.1.200
"""

import asyncio
import logging
import socket
import argparse
import struct
from dataclasses import dataclass, field
from datetime import datetime, timedelta
from typing import Optional, Dict, List, Tuple
from ipaddress import IPv4Address

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)
logger = logging.getLogger(__name__)

# DHCP Magic Cookie
DHCP_MAGIC = b'\x63\x82\x53\x63'

# DHCP Option Codes
DHCP_OPTION_SUBNET_MASK = 1
DHCP_OPTION_ROUTER = 3
DHCP_OPTION_DNS_SERVER = 6
DHCP_OPTION_HOSTNAME = 12
DHCP_OPTION_LEASE_TIME = 51
DHCP_OPTION_MESSAGE_TYPE = 53
DHCP_OPTION_SERVER_ID = 54
DHCP_OPTION_CLIENT_ID = 61
DHCP_OPTION_PXE_SERVER = 66  # TFTP server name
DHCP_OPTION_BOOTFILE = 67    # Bootfile name
DHCP_OPTION_END = 255

# DHCP Message Types
DHCP_DISCOVER = 1
DHCP_OFFER = 2
DHCP_REQUEST = 3
DHCP_DECLINE = 4
DHCP_ACK = 5
DHCP_NAK = 6
DHCP_RELEASE = 7
DHCP_INFORM = 8


@dataclass
class DHCPPacket:
    """DHCP packet structure for PXE boot."""
    # Header fields
    op: int = 0          # 1=request, 2=reply
    htype: int = 1       # Hardware type (1=ethernet)
    hlen: int = 6        # Hardware address length
    hops: int = 0
    xid: int = 0         # Transaction ID
    secs: int = 0
    flags: int = 0
    ciaddr: str = "0.0.0.0"   # Client IP
    yiaddr: str = "0.0.0.0"   # Your IP (assigned)
    siaddr: str = "0.0.0.0"   # Server IP
    giaddr: str = "0.0.0.0"   # Gateway IP
    chaddr: bytes = b""       # Client hardware address (MAC)
    sname: str = ""           # Server name (64 bytes)
    file: str = ""            # Boot file name (128 bytes)
    options: Dict[int, bytes] = field(default_factory=dict)  # DHCP options

    def get_mac_address(self) -> str:
        """Format MAC address as colon-separated hex string."""
        return ':'.join(f'{b:02x}' for b in self.chaddr[:self.hlen])

    def get_message_type(self) -> Optional[int]:
        """Get DHCP message type from options."""
        if DHCP_OPTION_MESSAGE_TYPE in self.options:
            return self.options[DHCP_OPTION_MESSAGE_TYPE][0]
        return None

    def get_option_string(self, option_code: int) -> str:
        """Get string value from option."""
        if option_code in self.options:
            return self.options[option_code].decode('utf-8', errors='ignore')
        return ""


class DHCPPacketParser:
    """Parser and builder for DHCP packets."""

    # Minimum DHCP packet size (236 bytes header + 4 bytes magic cookie)
    MIN_PACKET_SIZE = 240

    @staticmethod
    def parse(data: bytes) -> Optional[DHCPPacket]:
        """
        Parse raw UDP packet data to DHCPPacket.

        Args:
            data: Raw bytes from UDP datagram

        Returns:
            DHCPPacket if valid, None if parsing fails
        """
        if len(data) < DHCPPacketParser.MIN_PACKET_SIZE:
            logger.warning(f"[DHCP] Packet too short: {len(data)} bytes (min {DHCPPacketParser.MIN_PACKET_SIZE})")
            return None

        try:
            # Parse fixed header (236 bytes)
            op, htype, hlen, hops = struct.unpack('!BBBB', data[0:4])
            xid = struct.unpack('!I', data[4:8])[0]
            secs, flags = struct.unpack('!HH', data[8:12])
            ciaddr = socket.inet_ntoa(data[12:16])
            yiaddr = socket.inet_ntoa(data[16:20])
            siaddr = socket.inet_ntoa(data[20:24])
            giaddr = socket.inet_ntoa(data[24:28])

            # Client hardware address (16 bytes, but only hlen is used)
            chaddr = data[28:44]

            # Server name (64 bytes) - null-terminated string
            sname_bytes = data[44:108]
            sname = sname_bytes.split(b'\x00')[0].decode('utf-8', errors='ignore')

            # Boot file name (128 bytes) - null-terminated string
            file_bytes = data[108:236]
            file = file_bytes.split(b'\x00')[0].decode('utf-8', errors='ignore')

            # Parse options
            options = {}
            options_data = data[236:]

            # Check for DHCP magic cookie
            if len(options_data) >= 4 and options_data[:4] == DHCP_MAGIC:
                options_data = options_data[4:]
            else:
                # BOOTP without options - still valid
                logger.debug(f"[DHCP] No magic cookie found, treating as BOOTP")

            # Parse TLV options
            i = 0
            while i < len(options_data):
                option_code = options_data[i]

                if option_code == DHCP_OPTION_END:
                    break

                if option_code == 0:  # Padding
                    i += 1
                    continue

                if i + 1 >= len(options_data):
                    logger.warning(f"[DHCP] Truncated option at {i}")
                    break

                option_len = options_data[i + 1]

                if i + 2 + option_len > len(options_data):
                    logger.warning(f"[DHCP] Option {option_code} length {option_len} exceeds buffer")
                    break

                option_value = options_data[i + 2:i + 2 + option_len]
                options[option_code] = option_value
                i += 2 + option_len

            return DHCPPacket(
                op=op, htype=htype, hlen=hlen, hops=hops,
                xid=xid, secs=secs, flags=flags,
                ciaddr=ciaddr, yiaddr=yiaddr, siaddr=siaddr, giaddr=giaddr,
                chaddr=chaddr, sname=sname, file=file, options=options
            )

        except Exception as e:
            logger.error(f"[DHCP] Parse error: {e}")
            return None

    @staticmethod
    def build(packet: DHCPPacket) -> bytes:
        """
        Serialize DHCPPacket to bytes for transmission.

        Args:
            packet: DHCPPacket to serialize

        Returns:
            Raw bytes ready for UDP transmission
        """
        # Build fixed header (236 bytes)
        # Format: op(1), htype(1), hlen(1), hops(1), xid(4), secs(2), flags(2)
        header = struct.pack(
            '!BBBBIHH',
            packet.op,
            packet.htype,
            packet.hlen,
            packet.hops,
            packet.xid,
            packet.secs,
            packet.flags
        )

        # IP addresses
        header += socket.inet_aton(packet.ciaddr)
        header += socket.inet_aton(packet.yiaddr)
        header += socket.inet_aton(packet.siaddr)
        header += socket.inet_aton(packet.giaddr)

        # Client hardware address (16 bytes, pad with zeros)
        chaddr = packet.chaddr[:16].ljust(16, b'\x00')
        header += chaddr

        # Server name (64 bytes, null-terminated)
        sname_bytes = packet.sname.encode('utf-8')[:63].ljust(64, b'\x00')
        header += sname_bytes

        # Boot file name (128 bytes, null-terminated)
        file_bytes = packet.file.encode('utf-8')[:127].ljust(128, b'\x00')
        header += file_bytes

        # Options with magic cookie
        options = DHCP_MAGIC

        for option_code, option_value in sorted(packet.options.items()):
            if option_code == DHCP_OPTION_END:
                continue
            options += struct.pack('!BB', option_code, len(option_value))
            options += option_value

        # End marker
        options += struct.pack('!B', DHCP_OPTION_END)

        return header + options


@dataclass
class Lease:
    """DHCP lease assignment."""
    mac: str
    ip: str
    assigned_at: datetime
    expires_at: datetime

    def is_expired(self) -> bool:
        """Check if lease has expired."""
        return datetime.now() > self.expires_at


class LeaseStore:
    """Manages DHCP lease assignments."""

    def __init__(self, config: 'DHCPServerConfig'):
        self.config = config
        self.leases: Dict[str, Lease] = {}  # MAC -> Lease
        self.ip_to_mac: Dict[str, str] = {}  # IP -> MAC (reverse lookup)
        self._ip_pool = self._generate_ip_pool()
        self._next_ip_index = 0

    def _generate_ip_pool(self) -> List[str]:
        """Generate list of available IPs in configured range."""
        start = IPv4Address(self.config.ip_range_start)
        end = IPv4Address(self.config.ip_range_end)

        ips = []
        current = start
        while current <= end:
            ips.append(str(current))
            current += 1

        return ips

    def allocate(self, mac: str) -> Optional[str]:
        """
        Allocate next available IP for MAC address.

        Args:
            mac: Client MAC address (colon-separated hex)

        Returns:
            Allocated IP address or None if pool exhausted
        """
        # Check for existing lease
        existing = self.get_lease(mac)
        if existing and not existing.is_expired():
            logger.debug(f"[DHCP] Renewing lease {existing.ip} for {mac}")
            existing.expires_at = datetime.now() + timedelta(seconds=self.config.lease_time)
            return existing.ip

        # Clean up expired leases
        self._cleanup_expired()

        # Find available IP
        for _ in range(len(self._ip_pool)):
            ip = self._ip_pool[self._next_ip_index]
            self._next_ip_index = (self._next_ip_index + 1) % len(self._ip_pool)

            if ip not in self.ip_to_mac:
                # Allocate this IP
                lease = Lease(
                    mac=mac,
                    ip=ip,
                    assigned_at=datetime.now(),
                    expires_at=datetime.now() + timedelta(seconds=self.config.lease_time)
                )
                self.leases[mac] = lease
                self.ip_to_mac[ip] = mac
                logger.debug(f"[DHCP] Allocated {ip} to {mac}")
                return ip

        logger.warning(f"[DHCP] IP pool exhausted for {mac}")
        return None

    def get_lease(self, mac: str) -> Optional[Lease]:
        """Get existing lease for MAC address."""
        return self.leases.get(mac)

    def release(self, mac: str):
        """Release lease for MAC address."""
        if mac in self.leases:
            lease = self.leases[mac]
            del self.leases[mac]
            if lease.ip in self.ip_to_mac:
                del self.ip_to_mac[lease.ip]
            logger.debug(f"[DHCP] Released {lease.ip} from {mac}")

    def _cleanup_expired(self):
        """Remove expired leases."""
        expired = [
            mac for mac, lease in self.leases.items()
            if lease.is_expired()
        ]
        for mac in expired:
            self.release(mac)


@dataclass
class DHCPServerConfig:
    """Configuration for DHCP server."""
    interface: str = "eth0"           # Network interface to bind
    server_ip: str = "192.168.1.1"    # This server's IP
    ip_range_start: str = "192.168.1.100"
    ip_range_end: str = "192.168.1.200"
    subnet_mask: str = "255.255.255.0"
    lease_time: int = 3600            # seconds
    tftp_server: str = ""             # PXE TFTP server (option 66)
    bootfile: str = "ipxe.pxe"        # PXE bootfile (option 67)
    listen_port: int = 67             # DHCP server port

    def __post_init__(self):
        """Set default TFTP server to server_ip if not specified."""
        if not self.tftp_server:
            self.tftp_server = self.server_ip


class DHCPProtocol(asyncio.DatagramProtocol):
    """Async UDP protocol for DHCP server."""

    def __init__(self, config: DHCPServerConfig, lease_store: LeaseStore):
        self.config = config
        self.lease_store = lease_store
        self.transport = None

    def connection_made(self, transport):
        """Called when UDP endpoint is established."""
        self.transport = transport
        logger.info(f"[DHCP] Server started on {self.config.interface} - IP range {self.config.ip_range_start}-{self.config.ip_range_end}")

    def datagram_received(self, data: bytes, addr: tuple):
        """Handle incoming DHCP packet."""
        client_ip, client_port = addr

        # Debug: log raw packet data
        logger.debug(f"[DHCP] Raw packet ({len(data)} bytes) from {client_ip}:{client_port}")
        logger.debug(f"[DHCP] Packet hex: {data[:64].hex()}...")

        # Parse the packet
        packet = DHCPPacketParser.parse(data)
        if not packet:
            logger.warning(f"[DHCP] Malformed packet from {client_ip}:{client_port}")
            return

        mac = packet.get_mac_address()
        msg_type = packet.get_message_type()

        logger.info(f"[DHCP] DISCOVER from {mac} (xid=0x{packet.xid:08x})" if msg_type == DHCP_DISCOVER
                   else f"[DHCP] REQUEST from {mac} for {packet.ciaddr} (xid=0x{packet.xid:08x})"
                   if msg_type == DHCP_REQUEST
                   else f"[DHCP] {self._msg_type_name(msg_type)} from {mac} (xid=0x{packet.xid:08x})")

        # Debug: log parsed options
        if logger.isEnabledFor(logging.DEBUG):
            self._log_packet_options(packet)

        # Route to appropriate handler
        response = None
        if msg_type == DHCP_DISCOVER:
            response = self._handle_discover(packet)
        elif msg_type == DHCP_REQUEST:
            response = self._handle_request(packet)
        elif msg_type == DHCP_RELEASE:
            self._handle_release(packet)
            return
        else:
            logger.debug(f"[DHCP] Ignoring message type {msg_type} from {mac}")
            return

        if response:
            self._send_response(response, addr)

    def _log_packet_options(self, packet: DHCPPacket):
        """Log DHCP options for debugging."""
        option_names = {
            1: "subnet_mask",
            3: "router",
            6: "dns_server",
            12: "hostname",
            50: "requested_ip",
            51: "lease_time",
            53: "message_type",
            54: "server_id",
            55: "parameter_request_list",
            60: "vendor_class",
            61: "client_id",
            66: "tftp_server",
            67: "bootfile",
        }
        for code, value in packet.options.items():
            name = option_names.get(code, f"option_{code}")
            if code in (50, 54):  # IP addresses
                try:
                    value_str = socket.inet_ntoa(value)
                except:
                    value_str = value.hex()
            elif code == 51:  # Lease time
                value_str = str(struct.unpack('!I', value)[0]) + "s"
            elif code == 53:  # Message type
                value_str = self._msg_type_name(value[0])
            elif code == 55:  # Parameter request list
                value_str = "[" + ", ".join(option_names.get(b, str(b)) for b in value) + "]"
            else:
                try:
                    value_str = value.decode('utf-8', errors='replace')
                except:
                    value_str = value.hex()
            logger.debug(f"[DHCP]   {name}: {value_str}")

    def _handle_release(self, packet: DHCPPacket):
        """Handle DHCP RELEASE message."""
        mac = packet.get_mac_address()
        lease = self.lease_store.get_lease(mac)
        if lease:
            self.lease_store.release(mac)
            logger.info(f"[DHCP] RELEASE {lease.ip} from {mac}")
        else:
            logger.debug(f"[DHCP] RELEASE from unknown client {mac}")

    def error_received(self, exc):
        """Handle UDP errors."""
        logger.error(f"[DHCP] UDP error: {exc}")

    def _handle_discover(self, packet: DHCPPacket) -> Optional[DHCPPacket]:
        """
        Handle DHCP DISCOVER message.

        Sends DHCPOFFER with available IP and PXE options.
        """
        mac = packet.get_mac_address()

        # Allocate or reuse IP
        ip = self.lease_store.allocate(mac)
        if not ip:
            logger.warning(f"[DHCP] No IP available for DISCOVER from {mac}")
            return None

        logger.info(f"[DHCP] OFFER {ip} to {mac}")

        # Debug: log lease allocation details
        lease = self.lease_store.get_lease(mac)
        if lease and logger.isEnabledFor(logging.DEBUG):
            logger.debug(f"[DHCP] Lease expires at {lease.expires_at.isoformat()}")

        return self._build_response(
            request=packet,
            message_type=DHCP_OFFER,
            yiaddr=ip
        )

    def _handle_request(self, packet: DHCPPacket) -> Optional[DHCPPacket]:
        """
        Handle DHCP REQUEST message.

        Verifies requested IP and sends DHCPACK with PXE boot options.
        """
        mac = packet.get_mac_address()

        # Get requested IP from server identifier option or ciaddr
        requested_ip = packet.ciaddr
        if DHCP_OPTION_SERVER_ID in packet.options:
            # Client is selecting our offer
            lease = self.lease_store.get_lease(mac)
            if lease:
                requested_ip = lease.ip
            else:
                # No pending offer, allocate new
                requested_ip = self.lease_store.allocate(mac) or "0.0.0.0"

        # Verify we have this lease
        lease = self.lease_store.get_lease(mac)
        if not lease or lease.ip != requested_ip:
            logger.warning(f"[DHCP] NAK for {mac} - no valid lease for {requested_ip}")
            return self._build_response(
                request=packet,
                message_type=DHCP_NAK,
                yiaddr="0.0.0.0"
            )

        logger.info(
            f"[DHCP] ACK {requested_ip} to {mac} - "
            f"PXE: tftp://{self.config.tftp_server}/{self.config.bootfile}"
        )

        return self._build_response(
            request=packet,
            message_type=DHCP_ACK,
            yiaddr=requested_ip
        )

    def _build_response(self, request: DHCPPacket, message_type: int, yiaddr: str) -> DHCPPacket:
        """
        Build DHCP response packet.

        Args:
            request: Original request packet
            message_type: DHCP message type (OFFER, ACK, NAK)
            yiaddr: IP address to assign

        Returns:
            Complete DHCPPacket ready for transmission
        """
        response = DHCPPacket(
            op=2,  # Reply
            htype=request.htype,
            hlen=request.hlen,
            hops=0,
            xid=request.xid,
            secs=0,
            flags=request.flags,
            ciaddr="0.0.0.0",
            yiaddr=yiaddr,
            siaddr=self.config.server_ip,
            giaddr=request.giaddr,
            chaddr=request.chaddr,
            sname="",
            file=self.config.bootfile if message_type in (DHCP_OFFER, DHCP_ACK) else "",
            options={}
        )

        # DHCP Message Type
        response.options[DHCP_OPTION_MESSAGE_TYPE] = bytes([message_type])

        # Server Identifier
        response.options[DHCP_OPTION_SERVER_ID] = socket.inet_aton(self.config.server_ip)

        # Lease time (only for OFFER and ACK)
        if message_type in (DHCP_OFFER, DHCP_ACK):
            response.options[DHCP_OPTION_LEASE_TIME] = struct.pack('!I', self.config.lease_time)
            response.options[DHCP_OPTION_SUBNET_MASK] = socket.inet_aton(self.config.subnet_mask)

            # PXE options
            if self.config.tftp_server:
                response.options[DHCP_OPTION_PXE_SERVER] = self.config.tftp_server.encode('utf-8')
            if self.config.bootfile:
                response.options[DHCP_OPTION_BOOTFILE] = self.config.bootfile.encode('utf-8')

        return response

    def _send_response(self, packet: DHCPPacket, addr: tuple):
        """Send DHCP response via UDP."""
        if not self.transport:
            logger.error("[DHCP] No transport available")
            return

        data = DHCPPacketParser.build(packet)

        # DHCP responses go to broadcast address (255.255.255.255) on port 68
        # unless giaddr is set (relay agent)
        if packet.giaddr != "0.0.0.0":
            # Send to relay agent
            dest = (packet.giaddr, 67)
        else:
            # Broadcast to client
            dest = ("255.255.255.255", 68)

        try:
            self.transport.sendto(data, dest)
        except Exception as e:
            logger.error(f"[DHCP] Send error to {dest}: {e}")

    @staticmethod
    def _msg_type_name(msg_type: Optional[int]) -> str:
        """Get human-readable message type name."""
        names = {
            DHCP_DISCOVER: "DISCOVER",
            DHCP_OFFER: "OFFER",
            DHCP_REQUEST: "REQUEST",
            DHCP_DECLINE: "DECLINE",
            DHCP_ACK: "ACK",
            DHCP_NAK: "NAK",
            DHCP_RELEASE: "RELEASE",
            DHCP_INFORM: "INFORM"
        }
        return names.get(msg_type, f"UNKNOWN({msg_type})")


class DHCPServer:
    """Async DHCP server for PXE boot."""

    def __init__(self, config: DHCPServerConfig):
        self.config = config
        self.lease_store = LeaseStore(config)
        self._loop: Optional[asyncio.AbstractEventLoop] = None
        self._transport: Optional[asyncio.DatagramTransport] = None
        self._protocol: Optional[DHCPProtocol] = None
        self._status_task: Optional[asyncio.Task] = None

    async def start(self):
        """Start DHCP server on configured interface."""
        self._loop = asyncio.get_running_loop()

        # Create UDP socket with proper options for DHCP
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

        # Allow address reuse for quick restart
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

        # Enable broadcast for DHCP responses
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)

        # Bind to all interfaces on configured port
        try:
            sock.bind(('0.0.0.0', self.config.listen_port))
            logger.info(
                f"[DHCP] Server started on {self.config.interface} "
                f"- IP range {self.config.ip_range_start}-{self.config.ip_range_end}"
            )
        except PermissionError:
            logger.error(
                f"[DHCP] Permission denied - DHCP requires root to bind to port {self.config.listen_port}"
            )
            sock.close()
            raise
        except OSError as e:
            logger.error(f"[DHCP] Failed to bind to port {self.config.listen_port}: {e}")
            sock.close()
            raise

        # Create datagram endpoint with pre-configured socket
        try:
            self._transport, self._protocol = await self._loop.create_datagram_endpoint(
                lambda: DHCPProtocol(self.config, self.lease_store),
                sock=sock,
            )
        except Exception as e:
            logger.error(f"[DHCP] Failed to create datagram endpoint: {e}")
            sock.close()
            raise

        logger.info(f"[DHCP] Listening for PXE clients...")
        logger.info(f"[DHCP] TFTP server: {self.config.tftp_server}")
        logger.info(f"[DHCP] Bootfile: {self.config.bootfile}")

    async def stop(self):
        """Stop DHCP server gracefully."""
        # Cancel status logging task if running
        if self._status_task and not self._status_task.done():
            self._status_task.cancel()
            try:
                await self._status_task
            except asyncio.CancelledError:
                pass

        if self._transport:
            self._transport.close()
            self._transport = None
            self._protocol = None
            logger.info("[DHCP] Server stopped")

        # Log active leases on shutdown
        active = len(self.lease_store.leases)
        if active > 0:
            logger.info(f"[DHCP] {active} active leases at shutdown:")
            for mac, lease in self.lease_store.leases.items():
                logger.info(f"[DHCP]   {mac} -> {lease.ip}")

    async def serve_forever(self):
        """Start and run with periodic status logging."""
        await self.start()

        # Status logging task - every 5 minutes
        async def log_status():
            while True:
                await asyncio.sleep(300)  # Every 5 minutes
                active = len(self.lease_store.leases)
                logger.info(f"[DHCP] Status: {active} active leases")

        self._status_task = asyncio.create_task(log_status())

        try:
            await asyncio.Future()  # Run forever
        except asyncio.CancelledError:
            pass
        finally:
            await self.stop()

    @classmethod
    def from_args(cls, args: argparse.Namespace) -> 'DHCPServer':
        """Create server from parsed CLI arguments."""
        config = DHCPServerConfig(
            interface=args.interface,
            server_ip=args.server_ip,
            ip_range_start=args.ip_start,
            ip_range_end=args.ip_end,
            subnet_mask=args.subnet,
            lease_time=args.lease_time,
            tftp_server=args.tftp_server,
            bootfile=args.bootfile,
            listen_port=args.port
        )
        return cls(config)


def create_argument_parser() -> argparse.ArgumentParser:
    """Create CLI argument parser."""
    parser = argparse.ArgumentParser(
        description='Async DHCP Server for PXE Boot',
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )

    parser.add_argument(
        '--interface', '-i',
        default='eth0',
        help='Network interface to bind'
    )

    parser.add_argument(
        '--server-ip', '-s',
        default='192.168.1.1',
        help='This server\'s IP address'
    )

    parser.add_argument(
        '--ip-start',
        default='192.168.1.100',
        help='Start of IP allocation range'
    )

    parser.add_argument(
        '--ip-end',
        default='192.168.1.200',
        help='End of IP allocation range'
    )

    parser.add_argument(
        '--subnet',
        default='255.255.255.0',
        help='Subnet mask for clients'
    )

    parser.add_argument(
        '--lease-time', '-l',
        type=int,
        default=3600,
        help='Lease time in seconds'
    )

    parser.add_argument(
        '--tftp-server', '-t',
        default='',
        help='TFTP server for PXE boot (default: server-ip)'
    )

    parser.add_argument(
        '--bootfile', '-b',
        default='ipxe.pxe',
        help='PXE bootfile name'
    )

    parser.add_argument(
        '--port', '-p',
        type=int,
        default=67,
        help='DHCP server port'
    )

    parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='Enable debug logging'
    )

    return parser


async def main():
    """Main entry point."""
    parser = create_argument_parser()
    args = parser.parse_args()

    if args.verbose:
        logging.getLogger().setLevel(logging.DEBUG)

    server = DHCPServer.from_args(args)

    try:
        await server.serve_forever()
    except KeyboardInterrupt:
        logger.info("[DHCP] Shutdown requested")
    except Exception as e:
        logger.error(f"[DHCP] Fatal error: {e}")
        raise


if __name__ == '__main__':
    asyncio.run(main())
