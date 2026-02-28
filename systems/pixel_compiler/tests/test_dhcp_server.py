"""
Unit tests for DHCP Server components.

Tests cover:
- DHCPPacketParser: parsing and building DHCP packets
- LeaseStore: IP allocation, reuse, and pool management
- DHCPProtocol: message handling and PXE options
- DHCPServerConfig: configuration validation
"""

import struct
import socket
import unittest
from datetime import datetime, timedelta
from unittest.mock import MagicMock, patch, AsyncMock
from ipaddress import IPv4Address

from systems.pixel_compiler.pxe.dhcp_server import (
    DHCPPacket,
    DHCPPacketParser,
    Lease,
    LeaseStore,
    DHCPServerConfig,
    DHCPProtocol,
    DHCPServer,
    DHCP_MAGIC,
    DHCP_OPTION_SUBNET_MASK,
    DHCP_OPTION_ROUTER,
    DHCP_OPTION_DNS_SERVER,
    DHCP_OPTION_LEASE_TIME,
    DHCP_OPTION_MESSAGE_TYPE,
    DHCP_OPTION_SERVER_ID,
    DHCP_OPTION_PXE_SERVER,
    DHCP_OPTION_BOOTFILE,
    DHCP_OPTION_END,
    DHCP_DISCOVER,
    DHCP_OFFER,
    DHCP_REQUEST,
    DHCP_ACK,
    DHCP_NAK,
    DHCP_RELEASE,
)


# =============================================================================
# Test Fixtures and Helpers
# =============================================================================

def build_dhcp_discover(
    mac: str = "00:11:22:33:44:55",
    xid: int = 0x12345678,
    hostname: str = ""
) -> bytes:
    """
    Build a raw DHCP DISCOVER packet for testing.

    Args:
        mac: Client MAC address (colon-separated hex)
        xid: Transaction ID
        hostname: Optional hostname (option 12)

    Returns:
        Raw bytes simulating a DHCP DISCOVER
    """
    # Parse MAC to bytes
    mac_bytes = bytes.fromhex(mac.replace(':', ''))

    # Build fixed header (236 bytes)
    header = struct.pack(
        '!BBBBIHH',
        1,      # op: request
        1,      # htype: ethernet
        6,      # hlen: MAC length
        0,      # hops
        xid,    # transaction ID
        0,      # secs
        0x8000  # flags: broadcast
    )

    # IP addresses (all zeros for DISCOVER)
    header += socket.inet_aton("0.0.0.0")  # ciaddr
    header += socket.inet_aton("0.0.0.0")  # yiaddr
    header += socket.inet_aton("0.0.0.0")  # siaddr
    header += socket.inet_aton("0.0.0.0")  # giaddr

    # Client hardware address (16 bytes)
    chaddr = mac_bytes.ljust(16, b'\x00')
    header += chaddr

    # Server name (64 bytes)
    header += b'\x00' * 64

    # Boot file (128 bytes)
    header += b'\x00' * 128

    # Options with magic cookie
    options = DHCP_MAGIC

    # DHCP Message Type: DISCOVER (1)
    options += struct.pack('!BBB', DHCP_OPTION_MESSAGE_TYPE, 1, DHCP_DISCOVER)

    # Hostname if provided
    if hostname:
        hostname_bytes = hostname.encode('utf-8')
        options += struct.pack('!BB', 12, len(hostname_bytes))
        options += hostname_bytes

    # End marker
    options += struct.pack('!B', DHCP_OPTION_END)

    return header + options


def build_dhcp_request(
    mac: str = "00:11:22:33:44:55",
    xid: int = 0x12345678,
    requested_ip: str = "192.168.1.100",
    server_ip: str = "192.168.1.1"
) -> bytes:
    """
    Build a raw DHCP REQUEST packet for testing.

    Args:
        mac: Client MAC address (colon-separated hex)
        xid: Transaction ID (should match DISCOVER)
        requested_ip: IP address being requested
        server_ip: Server IP from OFFER

    Returns:
        Raw bytes simulating a DHCP REQUEST
    """
    # Parse MAC to bytes
    mac_bytes = bytes.fromhex(mac.replace(':', ''))

    # Build fixed header (236 bytes)
    header = struct.pack(
        '!BBBBIHH',
        1,      # op: request
        1,      # htype: ethernet
        6,      # hlen: MAC length
        0,      # hops
        xid,    # transaction ID
        0,      # secs
        0x8000  # flags: broadcast
    )

    # IP addresses
    header += socket.inet_aton("0.0.0.0")  # ciaddr
    header += socket.inet_aton("0.0.0.0")  # yiaddr
    header += socket.inet_aton("0.0.0.0")  # siaddr
    header += socket.inet_aton("0.0.0.0")  # giaddr

    # Client hardware address (16 bytes)
    chaddr = mac_bytes.ljust(16, b'\x00')
    header += chaddr

    # Server name (64 bytes)
    header += b'\x00' * 64

    # Boot file (128 bytes)
    header += b'\x00' * 128

    # Options with magic cookie
    options = DHCP_MAGIC

    # DHCP Message Type: REQUEST (3)
    options += struct.pack('!BBB', DHCP_OPTION_MESSAGE_TYPE, 1, DHCP_REQUEST)

    # Server Identifier (option 54) - which server we're accepting
    options += struct.pack('!BB', DHCP_OPTION_SERVER_ID, 4)
    options += socket.inet_aton(server_ip)

    # Requested IP (option 50, code 50)
    options += struct.pack('!BB', 50, 4)
    options += socket.inet_aton(requested_ip)

    # End marker
    options += struct.pack('!B', DHCP_OPTION_END)

    return header + options


def create_test_config(**kwargs) -> DHCPServerConfig:
    """Create a test DHCPServerConfig with sensible defaults."""
    defaults = {
        'interface': 'eth0',
        'server_ip': '192.168.1.1',
        'ip_range_start': '192.168.1.100',
        'ip_range_end': '192.168.1.110',  # Small pool for testing
        'subnet_mask': '255.255.255.0',
        'lease_time': 3600,
        'tftp_server': '192.168.1.1',
        'bootfile': 'ipxe.pxe',
        'listen_port': 67,
    }
    defaults.update(kwargs)
    return DHCPServerConfig(**defaults)


# =============================================================================
# DHCPPacketParser Tests
# =============================================================================

class TestDHCPPacketParser(unittest.TestCase):
    """Tests for DHCPPacketParser parse and build methods."""

    def test_parse_discover_packet(self):
        """Parse a valid DHCP DISCOVER packet."""
        raw = build_dhcp_discover(mac="aa:bb:cc:dd:ee:ff", xid=0xDEADBEEF)
        packet = DHCPPacketParser.parse(raw)

        self.assertIsNotNone(packet)
        self.assertEqual(packet.op, 1)
        self.assertEqual(packet.htype, 1)
        self.assertEqual(packet.hlen, 6)
        self.assertEqual(packet.xid, 0xDEADBEEF)
        self.assertEqual(packet.ciaddr, "0.0.0.0")
        self.assertEqual(packet.yiaddr, "0.0.0.0")
        self.assertEqual(packet.siaddr, "0.0.0.0")
        self.assertEqual(packet.giaddr, "0.0.0.0")
        self.assertEqual(packet.get_mac_address(), "aa:bb:cc:dd:ee:ff")
        self.assertEqual(packet.get_message_type(), DHCP_DISCOVER)

    def test_parse_request_packet(self):
        """Parse a valid DHCP REQUEST packet."""
        raw = build_dhcp_request(
            mac="11:22:33:44:55:66",
            xid=0xCAFEBABE,
            requested_ip="192.168.1.105",
            server_ip="192.168.1.1"
        )
        packet = DHCPPacketParser.parse(raw)

        self.assertIsNotNone(packet)
        self.assertEqual(packet.xid, 0xCAFEBABE)
        self.assertEqual(packet.get_mac_address(), "11:22:33:44:55:66")
        self.assertEqual(packet.get_message_type(), DHCP_REQUEST)
        # Server ID option should be present
        self.assertIn(DHCP_OPTION_SERVER_ID, packet.options)

    def test_parse_too_short_packet(self):
        """Parsing a packet that's too short returns None."""
        short_packet = b'\x00' * 100  # Less than MIN_PACKET_SIZE (240)
        result = DHCPPacketParser.parse(short_packet)
        self.assertIsNone(result)

    def test_parse_minimal_valid_packet(self):
        """Parse a packet that's exactly the minimum size."""
        # Build minimal packet (header + magic cookie only)
        header = struct.pack(
            '!BBBBIHH',
            1, 1, 6, 0,  # op, htype, hlen, hops
            0x11111111,  # xid
            0, 0         # secs, flags
        )
        header += b'\x00' * 4  # ciaddr
        header += b'\x00' * 4  # yiaddr
        header += b'\x00' * 4  # siaddr
        header += b'\x00' * 4  # giaddr
        header += b'\x00' * 16  # chaddr
        header += b'\x00' * 64  # sname
        header += b'\x00' * 128  # file

        # Just the header is 236 bytes, add magic cookie
        minimal = header + DHCP_MAGIC

        result = DHCPPacketParser.parse(minimal)
        self.assertIsNotNone(result)
        self.assertEqual(result.xid, 0x11111111)

    def test_parse_packet_with_hostname_option(self):
        """Parse packet that includes hostname option."""
        raw = build_dhcp_discover(mac="00:11:22:33:44:55", hostname="test-client")
        packet = DHCPPacketParser.parse(raw)

        self.assertIsNotNone(packet)
        self.assertEqual(packet.get_option_string(12), "test-client")

    def test_parse_packet_without_magic_cookie(self):
        """Parsing BOOTP packet with magic cookie but no options works."""
        # Build packet with just magic cookie (no DHCP options)
        header = struct.pack(
            '!BBBBIHH',
            1, 1, 6, 0,
            0x22222222,
            0, 0
        )
        header += b'\x00' * 4 * 4  # all IP fields
        header += b'\x00' * 16  # chaddr
        header += b'\x00' * 64  # sname
        header += b'\x00' * 128  # file
        # Add magic cookie to meet minimum size
        packet = header + DHCP_MAGIC + struct.pack('!B', DHCP_OPTION_END)

        result = DHCPPacketParser.parse(packet)
        self.assertIsNotNone(result)
        self.assertEqual(result.xid, 0x22222222)
        # No DHCP options (just END)
        self.assertEqual(len(result.options), 0)

    def test_build_response_packet(self):
        """Build a DHCP response packet from DHCPPacket object."""
        packet = DHCPPacket(
            op=2,  # Reply
            htype=1,
            hlen=6,
            hops=0,
            xid=0xABCDEF01,
            secs=0,
            flags=0,
            ciaddr="0.0.0.0",
            yiaddr="192.168.1.100",
            siaddr="192.168.1.1",
            giaddr="0.0.0.0",
            chaddr=bytes.fromhex("001122334455").ljust(16, b'\x00'),
            sname="",
            file="ipxe.pxe",
            options={
                DHCP_OPTION_MESSAGE_TYPE: bytes([DHCP_OFFER]),
                DHCP_OPTION_SERVER_ID: socket.inet_aton("192.168.1.1"),
            }
        )

        raw = DHCPPacketParser.build(packet)

        # Verify we can parse it back
        parsed = DHCPPacketParser.parse(raw)
        self.assertIsNotNone(parsed)
        self.assertEqual(parsed.op, 2)
        self.assertEqual(parsed.xid, 0xABCDEF01)
        self.assertEqual(parsed.yiaddr, "192.168.1.100")
        self.assertEqual(parsed.siaddr, "192.168.1.1")
        self.assertEqual(parsed.file, "ipxe.pxe")
        self.assertEqual(parsed.get_message_type(), DHCP_OFFER)

    def test_build_and_parse_roundtrip(self):
        """Build and parse should be inverse operations."""
        original = DHCPPacket(
            op=2,
            htype=1,
            hlen=6,
            hops=0,
            xid=0x12345678,
            secs=10,
            flags=0x8000,
            ciaddr="0.0.0.0",
            yiaddr="192.168.1.150",
            siaddr="192.168.1.1",
            giaddr="0.0.0.0",
            chaddr=bytes.fromhex("aabbccddeeff").ljust(16, b'\x00'),
            sname="test-server",
            file="boot/pxeboot",
            options={
                DHCP_OPTION_MESSAGE_TYPE: bytes([DHCP_ACK]),
                DHCP_OPTION_SERVER_ID: socket.inet_aton("192.168.1.1"),
                DHCP_OPTION_LEASE_TIME: struct.pack('!I', 3600),
                DHCP_OPTION_SUBNET_MASK: socket.inet_aton("255.255.255.0"),
                DHCP_OPTION_PXE_SERVER: b"192.168.1.1",
                DHCP_OPTION_BOOTFILE: b"ipxe.pxe",
            }
        )

        raw = DHCPPacketParser.build(original)
        parsed = DHCPPacketParser.parse(raw)

        self.assertIsNotNone(parsed)
        self.assertEqual(parsed.op, original.op)
        self.assertEqual(parsed.htype, original.htype)
        self.assertEqual(parsed.hlen, original.hlen)
        self.assertEqual(parsed.xid, original.xid)
        self.assertEqual(parsed.secs, original.secs)
        self.assertEqual(parsed.flags, original.flags)
        self.assertEqual(parsed.yiaddr, original.yiaddr)
        self.assertEqual(parsed.siaddr, original.siaddr)
        self.assertEqual(parsed.sname, original.sname)
        self.assertEqual(parsed.file, original.file)
        self.assertEqual(parsed.get_message_type(), DHCP_ACK)

    def test_get_mac_address_formatting(self):
        """MAC address is formatted as colon-separated lowercase hex."""
        packet = DHCPPacket(chaddr=bytes.fromhex("AABBCCDDEEFF").ljust(16, b'\x00'), hlen=6)
        self.assertEqual(packet.get_mac_address(), "aa:bb:cc:dd:ee:ff")

    def test_get_message_type_missing(self):
        """get_message_type returns None if option not present."""
        packet = DHCPPacket(options={})
        self.assertIsNone(packet.get_message_type())


# =============================================================================
# LeaseStore Tests
# =============================================================================

class TestLeaseStore(unittest.TestCase):
    """Tests for LeaseStore IP allocation logic."""

    def test_allocate_first_ip(self):
        """First allocation gets the first IP in range."""
        config = create_test_config(
            ip_range_start="192.168.1.100",
            ip_range_end="192.168.1.110"
        )
        store = LeaseStore(config)

        ip = store.allocate("00:11:22:33:44:55")
        self.assertEqual(ip, "192.168.1.100")

    def test_allocate_different_macs_get_different_ips(self):
        """Different MAC addresses get different IPs."""
        config = create_test_config()
        store = LeaseStore(config)

        ip1 = store.allocate("00:11:22:33:44:55")
        ip2 = store.allocate("aa:bb:cc:dd:ee:ff")
        ip3 = store.allocate("11:22:33:44:55:66")

        # All should be different
        self.assertEqual(len({ip1, ip2, ip3}), 3)

        # All should be in range
        for ip in [ip1, ip2, ip3]:
            ip_int = int(IPv4Address(ip))
            self.assertGreaterEqual(ip_int, int(IPv4Address(config.ip_range_start)))
            self.assertLessEqual(ip_int, int(IPv4Address(config.ip_range_end)))

    def test_allocate_same_mac_gets_same_ip(self):
        """Same MAC address gets the same IP on subsequent requests."""
        config = create_test_config()
        store = LeaseStore(config)

        ip1 = store.allocate("00:11:22:33:44:55")
        ip2 = store.allocate("00:11:22:33:44:55")  # Same MAC

        self.assertEqual(ip1, ip2)

    def test_allocate_renews_lease(self):
        """Allocating for same MAC extends lease time."""
        config = create_test_config(lease_time=3600)
        store = LeaseStore(config)

        # First allocation
        ip = store.allocate("00:11:22:33:44:55")
        lease1 = store.get_lease("00:11:22:33:44:55")
        original_expiry = lease1.expires_at

        # Second allocation (renewal)
        store.allocate("00:11:22:33:44:55")
        lease2 = store.get_lease("00:11:22:33:44:55")

        # Expiry should be extended
        self.assertGreater(lease2.expires_at, original_expiry)

    def test_allocate_pool_exhaustion(self):
        """Pool exhaustion returns None."""
        config = create_test_config(
            ip_range_start="192.168.1.100",
            ip_range_end="192.168.1.102"  # Only 3 IPs
        )
        store = LeaseStore(config)

        # Allocate all 3 IPs
        ip1 = store.allocate("00:11:22:33:44:01")
        ip2 = store.allocate("00:11:22:33:44:02")
        ip3 = store.allocate("00:11:22:33:44:03")

        self.assertIsNotNone(ip1)
        self.assertIsNotNone(ip2)
        self.assertIsNotNone(ip3)

        # Fourth should fail
        ip4 = store.allocate("00:11:22:33:44:04")
        self.assertIsNone(ip4)

    def test_release_and_reuse(self):
        """Released IP can be reallocated."""
        config = create_test_config(
            ip_range_start="192.168.1.100",
            ip_range_end="192.168.1.100"  # Only 1 IP
        )
        store = LeaseStore(config)

        # Allocate the only IP
        ip1 = store.allocate("00:11:22:33:44:55")
        self.assertEqual(ip1, "192.168.1.100")

        # Pool exhausted
        ip2 = store.allocate("aa:bb:cc:dd:ee:ff")
        self.assertIsNone(ip2)

        # Release the first
        store.release("00:11:22:33:44:55")

        # Now we can allocate again
        ip3 = store.allocate("aa:bb:cc:dd:ee:ff")
        self.assertEqual(ip3, "192.168.1.100")

    def test_get_lease_nonexistent(self):
        """get_lease returns None for unknown MAC."""
        config = create_test_config()
        store = LeaseStore(config)

        lease = store.get_lease("00:00:00:00:00:00")
        self.assertIsNone(lease)

    def test_lease_is_expired(self):
        """Lease expiry check works correctly."""
        # Fresh lease
        fresh_lease = Lease(
            mac="00:11:22:33:44:55",
            ip="192.168.1.100",
            assigned_at=datetime.now(),
            expires_at=datetime.now() + timedelta(hours=1)
        )
        self.assertFalse(fresh_lease.is_expired())

        # Expired lease
        expired_lease = Lease(
            mac="00:11:22:33:44:55",
            ip="192.168.1.100",
            assigned_at=datetime.now() - timedelta(hours=2),
            expires_at=datetime.now() - timedelta(hours=1)
        )
        self.assertTrue(expired_lease.is_expired())

    def test_expired_leases_are_cleaned_up(self):
        """Expired leases are cleaned up during allocation."""
        config = create_test_config(
            ip_range_start="192.168.1.100",
            ip_range_end="192.168.1.100",  # Only 1 IP
            lease_time=0  # Immediate expiry (for testing)
        )
        store = LeaseStore(config)

        # Allocate the only IP
        ip1 = store.allocate("00:11:22:33:44:55")
        self.assertEqual(ip1, "192.168.1.100")

        # Manually expire the lease
        lease = store.leases["00:11:22:33:44:55"]
        lease.expires_at = datetime.now() - timedelta(seconds=1)

        # New allocation should clean up expired and succeed
        ip2 = store.allocate("aa:bb:cc:dd:ee:ff")
        self.assertEqual(ip2, "192.168.1.100")


# =============================================================================
# DHCPProtocol Message Handler Tests
# =============================================================================

class TestDHCPProtocol(unittest.TestCase):
    """Tests for DHCPProtocol message handling."""

    def setUp(self):
        """Set up test fixtures."""
        self.config = create_test_config()
        self.lease_store = LeaseStore(self.config)
        self.protocol = DHCPProtocol(self.config, self.lease_store)
        self.protocol.transport = MagicMock()

    def test_handle_discover_sends_offer(self):
        """DISCOVER message triggers OFFER response."""
        discover = DHCPPacketParser.parse(
            build_dhcp_discover(mac="00:11:22:33:44:55", xid=0x12345678)
        )

        response = self.protocol._handle_discover(discover)

        self.assertIsNotNone(response)
        self.assertEqual(response.op, 2)  # Reply
        self.assertEqual(response.xid, 0x12345678)
        self.assertEqual(response.get_message_type(), DHCP_OFFER)
        self.assertIn("192.168.1.", response.yiaddr)  # Got an IP

    def test_handle_discover_includes_pxe_options(self):
        """OFFER includes PXE boot options."""
        discover = DHCPPacketParser.parse(
            build_dhcp_discover(mac="00:11:22:33:44:55")
        )

        response = self.protocol._handle_discover(discover)

        self.assertIsNotNone(response)
        # PXE server option (66)
        self.assertIn(DHCP_OPTION_PXE_SERVER, response.options)
        self.assertEqual(
            response.options[DHCP_OPTION_PXE_SERVER].decode(),
            self.config.tftp_server
        )
        # Bootfile option (67)
        self.assertIn(DHCP_OPTION_BOOTFILE, response.options)
        self.assertEqual(
            response.options[DHCP_OPTION_BOOTFILE].decode(),
            self.config.bootfile
        )

    def test_handle_request_sends_ack(self):
        """REQUEST with valid lease triggers ACK response."""
        # First do DISCOVER/OFFER to set up lease
        mac = "00:11:22:33:44:55"
        discover = DHCPPacketParser.parse(build_dhcp_discover(mac=mac))
        offer = self.protocol._handle_discover(discover)

        # Then REQUEST
        request = DHCPPacketParser.parse(
            build_dhcp_request(
                mac=mac,
                requested_ip=offer.yiaddr,
                server_ip=self.config.server_ip
            )
        )

        response = self.protocol._handle_request(request)

        self.assertIsNotNone(response)
        self.assertEqual(response.get_message_type(), DHCP_ACK)
        self.assertEqual(response.yiaddr, offer.yiaddr)

    def test_handle_request_includes_pxe_options(self):
        """ACK includes PXE boot options."""
        mac = "00:11:22:33:44:55"

        # Set up lease
        self.lease_store.allocate(mac)
        lease = self.lease_store.get_lease(mac)

        request = DHCPPacketParser.parse(
            build_dhcp_request(
                mac=mac,
                requested_ip=lease.ip,
                server_ip=self.config.server_ip
            )
        )

        response = self.protocol._handle_request(request)

        self.assertIsNotNone(response)
        # Verify PXE options
        self.assertIn(DHCP_OPTION_PXE_SERVER, response.options)
        self.assertIn(DHCP_OPTION_BOOTFILE, response.options)

    def test_handle_request_without_lease_allocates_new(self):
        """REQUEST without valid lease allocates new IP and sends ACK."""
        # REQUEST without prior DISCOVER/OFFER
        # The implementation allocates a new IP if no lease exists
        request = DHCPPacketParser.parse(
            build_dhcp_request(
                mac="00:11:22:33:44:55",
                requested_ip="192.168.1.200",  # IP we never offered
                server_ip=self.config.server_ip
            )
        )

        response = self.protocol._handle_request(request)

        # Implementation allocates new IP if no lease, so we get ACK
        self.assertIsNotNone(response)
        self.assertEqual(response.get_message_type(), DHCP_ACK)
        # Should have allocated an IP in range
        self.assertIn("192.168.1.", response.yiaddr)

    def test_handle_request_exhausted_pool_sends_nak(self):
        """REQUEST when pool is exhausted sends NAK."""
        # Create a config with very small pool
        small_config = create_test_config(
            ip_range_start="192.168.1.100",
            ip_range_end="192.168.1.100"  # Only 1 IP
        )
        small_store = LeaseStore(small_config)
        small_protocol = DHCPProtocol(small_config, small_store)
        small_protocol.transport = MagicMock()

        # Allocate the only IP to a different MAC
        small_store.allocate("aa:bb:cc:dd:ee:ff")

        # Now try REQUEST from different client - no lease, allocation fails
        request = DHCPPacketParser.parse(
            build_dhcp_request(
                mac="00:11:22:33:44:55",
                server_ip=small_config.server_ip
            )
        )

        response = small_protocol._handle_request(request)

        # Pool exhausted, should get NAK
        self.assertIsNotNone(response)
        self.assertEqual(response.get_message_type(), DHCP_NAK)
        self.assertEqual(response.yiaddr, "0.0.0.0")

    def test_build_response_includes_lease_time(self):
        """OFFER and ACK include lease time option."""
        discover = DHCPPacketParser.parse(build_dhcp_discover())
        response = self.protocol._build_response(
            request=discover,
            message_type=DHCP_OFFER,
            yiaddr="192.168.1.100"
        )

        self.assertIn(DHCP_OPTION_LEASE_TIME, response.options)
        lease_time = struct.unpack('!I', response.options[DHCP_OPTION_LEASE_TIME])[0]
        self.assertEqual(lease_time, self.config.lease_time)

    def test_build_response_includes_subnet_mask(self):
        """OFFER and ACK include subnet mask option."""
        discover = DHCPPacketParser.parse(build_dhcp_discover())
        response = self.protocol._build_response(
            request=discover,
            message_type=DHCP_OFFER,
            yiaddr="192.168.1.100"
        )

        self.assertIn(DHCP_OPTION_SUBNET_MASK, response.options)
        mask = socket.inet_ntoa(response.options[DHCP_OPTION_SUBNET_MASK])
        self.assertEqual(mask, self.config.subnet_mask)

    def test_nak_does_not_include_lease_options(self):
        """NAK does not include lease time or PXE options."""
        discover = DHCPPacketParser.parse(build_dhcp_discover())
        response = self.protocol._build_response(
            request=discover,
            message_type=DHCP_NAK,
            yiaddr="0.0.0.0"
        )

        # NAK should not have lease time
        self.assertNotIn(DHCP_OPTION_LEASE_TIME, response.options)
        # NAK should not have PXE options
        self.assertNotIn(DHCP_OPTION_PXE_SERVER, response.options)


# =============================================================================
# DHCPServerConfig Tests
# =============================================================================

class TestDHCPServerConfig(unittest.TestCase):
    """Tests for DHCPServerConfig validation."""

    def test_default_tftp_server_is_server_ip(self):
        """If tftp_server not specified, defaults to server_ip."""
        config = DHCPServerConfig(
            interface="eth0",
            server_ip="192.168.1.1",
            ip_range_start="192.168.1.100",
            ip_range_end="192.168.1.200"
        )

        # __post_init__ should set tftp_server
        self.assertEqual(config.tftp_server, "192.168.1.1")

    def test_explicit_tftp_server_preserved(self):
        """Explicit tftp_server is preserved."""
        config = DHCPServerConfig(
            interface="eth0",
            server_ip="192.168.1.1",
            ip_range_start="192.168.1.100",
            ip_range_end="192.168.1.200",
            tftp_server="192.168.1.50"  # Different TFTP server
        )

        self.assertEqual(config.tftp_server, "192.168.1.50")

    def test_config_all_fields(self):
        """Config accepts all fields correctly."""
        config = DHCPServerConfig(
            interface="enp0s25",
            server_ip="10.0.0.1",
            ip_range_start="10.0.0.100",
            ip_range_end="10.0.0.200",
            subnet_mask="255.255.0.0",
            lease_time=7200,
            tftp_server="10.0.0.2",
            bootfile="boot/ipxe.efi",
            listen_port=1067
        )

        self.assertEqual(config.interface, "enp0s25")
        self.assertEqual(config.server_ip, "10.0.0.1")
        self.assertEqual(config.ip_range_start, "10.0.0.100")
        self.assertEqual(config.ip_range_end, "10.0.0.200")
        self.assertEqual(config.subnet_mask, "255.255.0.0")
        self.assertEqual(config.lease_time, 7200)
        self.assertEqual(config.tftp_server, "10.0.0.2")
        self.assertEqual(config.bootfile, "boot/ipxe.efi")
        self.assertEqual(config.listen_port, 1067)


# =============================================================================
# Integration Tests
# =============================================================================

class TestDHCPProtocolIntegration(unittest.TestCase):
    """Integration tests for full DHCP message flow."""

    def setUp(self):
        """Set up test fixtures."""
        self.config = create_test_config()
        self.lease_store = LeaseStore(self.config)
        self.protocol = DHCPProtocol(self.config, self.lease_store)
        self.protocol.transport = MagicMock()

    def test_full_discover_offer_request_ack_flow(self):
        """Complete DORA flow: DISCOVER -> OFFER -> REQUEST -> ACK."""
        mac = "00:11:22:33:44:55"
        xid = 0x12345678

        # Step 1: DISCOVER
        discover_raw = build_dhcp_discover(mac=mac, xid=xid)
        discover = DHCPPacketParser.parse(discover_raw)

        # Step 2: OFFER
        offer = self.protocol._handle_discover(discover)
        self.assertIsNotNone(offer)
        self.assertEqual(offer.get_message_type(), DHCP_OFFER)
        offered_ip = offer.yiaddr
        self.assertIn("192.168.1.", offered_ip)

        # Verify lease was created
        lease = self.lease_store.get_lease(mac)
        self.assertIsNotNone(lease)
        self.assertEqual(lease.ip, offered_ip)

        # Step 3: REQUEST
        request_raw = build_dhcp_request(
            mac=mac,
            xid=xid,
            requested_ip=offered_ip,
            server_ip=self.config.server_ip
        )
        request = DHCPPacketParser.parse(request_raw)

        # Step 4: ACK
        ack = self.protocol._handle_request(request)
        self.assertIsNotNone(ack)
        self.assertEqual(ack.get_message_type(), DHCP_ACK)
        self.assertEqual(ack.yiaddr, offered_ip)

        # Verify PXE boot info in ACK
        self.assertIn(DHCP_OPTION_PXE_SERVER, ack.options)
        self.assertIn(DHCP_OPTION_BOOTFILE, ack.options)
        bootfile = ack.options[DHCP_OPTION_BOOTFILE].decode()
        self.assertEqual(bootfile, self.config.bootfile)

    def test_multiple_clients_flow(self):
        """Multiple clients can get leases."""
        clients = [
            ("00:11:22:33:44:01", 0x10000001),
            ("00:11:22:33:44:02", 0x10000002),
            ("00:11:22:33:44:03", 0x10000003),
        ]

        assigned_ips = []

        for mac, xid in clients:
            # DISCOVER
            discover = DHCPPacketParser.parse(build_dhcp_discover(mac=mac, xid=xid))
            offer = self.protocol._handle_discover(discover)
            self.assertIsNotNone(offer)

            # REQUEST
            request = DHCPPacketParser.parse(
                build_dhcp_request(mac=mac, xid=xid,
                                   requested_ip=offer.yiaddr,
                                   server_ip=self.config.server_ip)
            )
            ack = self.protocol._handle_request(request)
            self.assertIsNotNone(ack)

            assigned_ips.append(ack.yiaddr)

        # All IPs should be unique
        self.assertEqual(len(set(assigned_ips)), len(clients))

    def test_renewal_flow(self):
        """Client can renew existing lease."""
        mac = "00:11:22:33:44:55"

        # Initial allocation
        discover = DHCPPacketParser.parse(build_dhcp_discover(mac=mac))
        offer = self.protocol._handle_discover(discover)
        original_ip = offer.yiaddr

        # Second DISCOVER (renewal) should get same IP
        discover2 = DHCPPacketParser.parse(build_dhcp_discover(mac=mac))
        offer2 = self.protocol._handle_discover(discover2)

        self.assertEqual(offer2.yiaddr, original_ip)


class TestMsgTypeName(unittest.TestCase):
    """Tests for message type name helper."""

    def test_known_message_types(self):
        """All known message types have names."""
        self.assertEqual(DHCPProtocol._msg_type_name(DHCP_DISCOVER), "DISCOVER")
        self.assertEqual(DHCPProtocol._msg_type_name(DHCP_OFFER), "OFFER")
        self.assertEqual(DHCPProtocol._msg_type_name(DHCP_REQUEST), "REQUEST")
        self.assertEqual(DHCPProtocol._msg_type_name(DHCP_ACK), "ACK")
        self.assertEqual(DHCPProtocol._msg_type_name(DHCP_NAK), "NAK")
        self.assertEqual(DHCPProtocol._msg_type_name(DHCP_RELEASE), "RELEASE")

    def test_unknown_message_type(self):
        """Unknown message types are formatted with number."""
        result = DHCPProtocol._msg_type_name(99)
        self.assertEqual(result, "UNKNOWN(99)")

    def test_none_message_type(self):
        """None message type is handled."""
        result = DHCPProtocol._msg_type_name(None)
        self.assertEqual(result, "UNKNOWN(None)")


if __name__ == '__main__':
    unittest.main()
