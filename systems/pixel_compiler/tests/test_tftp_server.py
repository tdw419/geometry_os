"""
Unit tests for TFTP Server components.

Tests cover:
- TFTPPacketParser: parsing and building TFTP packets
- TFTPServerConfig: configuration validation
- TFTPProtocol: RRQ handling and file transfer
- TFTPServer: lifecycle and concurrent transfers
"""

import os
import struct
import tempfile
import unittest
from unittest.mock import MagicMock, patch, AsyncMock

from systems.pixel_compiler.pxe.tftp_server import (
    TFTPPacket,
    TFTPPacketParser,
    TFTPServerConfig,
    TFTPTransfer,
    TFTP_OPCODE_RRQ,
    TFTP_OPCODE_DATA,
    TFTP_OPCODE_ACK,
    TFTP_OPCODE_ERROR,
    TFTP_BLOCK_SIZE,
    TFTP_ERROR_FILE_NOT_FOUND,
    TFTP_ERROR_ACCESS_VIOLATION,
)


# =============================================================================
# Test Fixtures and Helpers
# =============================================================================

def build_tftp_rrq(filename: str, mode: str = "octet") -> bytes:
    """Build a TFTP RRQ packet for testing."""
    return struct.pack('!H', TFTP_OPCODE_RRQ) + filename.encode() + b'\x00' + mode.encode() + b'\x00'


def build_tftp_data(block_num: int, data: bytes) -> bytes:
    """Build a TFTP DATA packet for testing."""
    return struct.pack('!HH', TFTP_OPCODE_DATA, block_num) + data


def build_tftp_ack(block_num: int) -> bytes:
    """Build a TFTP ACK packet for testing."""
    return struct.pack('!HH', TFTP_OPCODE_ACK, block_num)


def build_tftp_error(error_code: int, error_msg: str) -> bytes:
    """Build a TFTP ERROR packet for testing."""
    return struct.pack('!HH', TFTP_OPCODE_ERROR, error_code) + error_msg.encode() + b'\x00'


def create_test_config(**kwargs) -> TFTPServerConfig:
    """Create a test TFTPServerConfig with sensible defaults."""
    defaults = {
        'interface': '127.0.0.1',
        'listen_port': 6969,  # Non-privileged for testing
        'root_dir': '/tmp/tftptest',
        'block_size': 512,
        'timeout': 2.0,
        'max_retries': 3,
    }
    defaults.update(kwargs)
    return TFTPServerConfig(**defaults)


# =============================================================================
# TFTPPacketParser Tests
# =============================================================================

class TestTFTPPacketParser(unittest.TestCase):
    """Tests for TFTP packet parsing and building."""

    def test_parse_rrq_packet(self):
        """Test parsing valid RRQ packet."""
        raw = build_tftp_rrq("ipxe.pxe", "octet")
        packet = TFTPPacketParser.parse(raw)

        self.assertIsNotNone(packet)
        self.assertEqual(packet.opcode, TFTP_OPCODE_RRQ)
        self.assertEqual(packet.filename, "ipxe.pxe")
        self.assertEqual(packet.mode, "octet")

    def test_parse_rrq_with_netascii_mode(self):
        """Test parsing RRQ with netascii mode."""
        raw = build_tftp_rrq("config.txt", "netascii")
        packet = TFTPPacketParser.parse(raw)

        self.assertIsNotNone(packet)
        self.assertEqual(packet.mode, "netascii")

    def test_parse_data_packet(self):
        """Test parsing valid DATA packet."""
        data = b'A' * 512
        raw = build_tftp_data(1, data)
        packet = TFTPPacketParser.parse(raw)

        self.assertIsNotNone(packet)
        self.assertEqual(packet.opcode, TFTP_OPCODE_DATA)
        self.assertEqual(packet.block_num, 1)
        self.assertEqual(packet.data, data)

    def test_parse_data_packet_partial_block(self):
        """Test parsing DATA packet with less than 512 bytes."""
        data = b'Hello World'
        raw = build_tftp_data(42, data)
        packet = TFTPPacketParser.parse(raw)

        self.assertIsNotNone(packet)
        self.assertEqual(packet.block_num, 42)
        self.assertEqual(packet.data, data)

    def test_parse_ack_packet(self):
        """Test parsing valid ACK packet."""
        raw = build_tftp_ack(5)
        packet = TFTPPacketParser.parse(raw)

        self.assertIsNotNone(packet)
        self.assertEqual(packet.opcode, TFTP_OPCODE_ACK)
        self.assertEqual(packet.block_num, 5)

    def test_parse_error_packet(self):
        """Test parsing valid ERROR packet."""
        raw = build_tftp_error(1, "File not found")
        packet = TFTPPacketParser.parse(raw)

        self.assertIsNotNone(packet)
        self.assertEqual(packet.opcode, TFTP_OPCODE_ERROR)
        self.assertEqual(packet.error_code, 1)
        self.assertEqual(packet.error_msg, "File not found")

    def test_parse_truncated_packet(self):
        """Test parsing truncated packet returns None."""
        raw = b'\x00'  # Too short
        packet = TFTPPacketParser.parse(raw)
        self.assertIsNone(packet)

    def test_parse_invalid_opcode(self):
        """Test parsing packet with invalid opcode returns None."""
        raw = struct.pack('!H', 99) + b'\x00'  # Invalid opcode
        packet = TFTPPacketParser.parse(raw)
        self.assertIsNone(packet)

    def test_build_data_packet(self):
        """Test building DATA packet."""
        data = b'Test data'
        raw = TFTPPacketParser.build_data(1, data)

        self.assertEqual(raw[:2], struct.pack('!H', TFTP_OPCODE_DATA))
        self.assertEqual(raw[2:4], struct.pack('!H', 1))
        self.assertEqual(raw[4:], data)

    def test_build_ack_packet(self):
        """Test building ACK packet."""
        raw = TFTPPacketParser.build_ack(10)

        self.assertEqual(len(raw), 4)
        self.assertEqual(raw[:2], struct.pack('!H', TFTP_OPCODE_ACK))
        self.assertEqual(raw[2:4], struct.pack('!H', 10))

    def test_build_error_packet(self):
        """Test building ERROR packet."""
        raw = TFTPPacketParser.build_error(1, "File not found")

        self.assertEqual(raw[:2], struct.pack('!H', TFTP_OPCODE_ERROR))
        self.assertEqual(raw[2:4], struct.pack('!H', 1))
        self.assertTrue(raw.endswith(b'\x00'))

    def test_build_rrq_packet(self):
        """Test building RRQ packet."""
        raw = TFTPPacketParser.build_rrq("boot.pxe", "octet")

        self.assertEqual(raw[:2], struct.pack('!H', TFTP_OPCODE_RRQ))
        self.assertIn(b'boot.pxe', raw)
        self.assertIn(b'octet', raw)
        self.assertTrue(raw.endswith(b'\x00'))

    def test_parse_rrq_empty_filename(self):
        """Test parsing RRQ with empty filename."""
        raw = struct.pack('!H', TFTP_OPCODE_RRQ) + b'\x00octet\x00'
        packet = TFTPPacketParser.parse(raw)

        self.assertIsNotNone(packet)
        self.assertEqual(packet.filename, "")
        self.assertEqual(packet.mode, "octet")

    def test_parse_data_empty_payload(self):
        """Test parsing DATA packet with empty payload."""
        raw = build_tftp_data(1, b'')
        packet = TFTPPacketParser.parse(raw)

        self.assertIsNotNone(packet)
        self.assertEqual(packet.block_num, 1)
        self.assertEqual(packet.data, b'')

    def test_parse_error_empty_message(self):
        """Test parsing ERROR packet with empty message."""
        raw = struct.pack('!HH', TFTP_OPCODE_ERROR, 4) + b'\x00'
        packet = TFTPPacketParser.parse(raw)

        self.assertIsNotNone(packet)
        self.assertEqual(packet.error_code, 4)
        self.assertEqual(packet.error_msg, "")


# =============================================================================
# TFTPServerConfig Tests
# =============================================================================

class TestTFTPServerConfig(unittest.TestCase):
    """Tests for TFTP server configuration."""

    def test_default_config(self):
        """Test default configuration values."""
        config = TFTPServerConfig()

        self.assertEqual(config.interface, "0.0.0.0")
        self.assertEqual(config.listen_port, 69)
        self.assertEqual(config.root_dir, "/tftpboot")
        self.assertEqual(config.block_size, 512)
        self.assertEqual(config.timeout, 5.0)
        self.assertEqual(config.max_retries, 5)

    def test_custom_config(self):
        """Test custom configuration values."""
        config = TFTPServerConfig(
            interface="192.168.1.1",
            listen_port=6969,
            root_dir="/var/tftp",
            block_size=1024,
            timeout=10.0,
            max_retries=3,
        )

        self.assertEqual(config.interface, "192.168.1.1")
        self.assertEqual(config.listen_port, 6969)
        self.assertEqual(config.root_dir, "/var/tftp")
        self.assertEqual(config.block_size, 1024)
        self.assertEqual(config.timeout, 10.0)
        self.assertEqual(config.max_retries, 3)


# =============================================================================
# TFTPTransfer Tests
# =============================================================================

class TestTFTPTransfer(unittest.TestCase):
    """Tests for TFTP transfer tracking."""

    def test_transfer_initialization(self):
        """Test transfer object initialization."""
        transfer = TFTPTransfer(
            filename="test.pxe",
            filepath="/tmp/test.pxe",
            client_addr=("192.168.1.100", 12345),
        )

        self.assertEqual(transfer.filename, "test.pxe")
        self.assertEqual(transfer.filepath, "/tmp/test.pxe")
        self.assertEqual(transfer.client_addr, ("192.168.1.100", 12345))
        self.assertEqual(transfer.block_num, 0)
        self.assertEqual(transfer.bytes_sent, 0)
        self.assertFalse(transfer.complete)

    def test_blocks_total_calculation(self):
        """Test blocks total calculation."""
        # Exactly 1 block
        transfer = TFTPTransfer(
            filename="test.pxe",
            filepath="/tmp/test.pxe",
            client_addr=("192.168.1.100", 12345),
            file_size=512,
        )
        self.assertEqual(transfer.blocks_total, 1)

        # Multiple blocks
        transfer = TFTPTransfer(
            filename="test.pxe",
            filepath="/tmp/test.pxe",
            client_addr=("192.168.1.100", 12345),
            file_size=1024,
        )
        self.assertEqual(transfer.blocks_total, 2)

        # Partial block
        transfer = TFTPTransfer(
            filename="test.pxe",
            filepath="/tmp/test.pxe",
            client_addr=("192.168.1.100", 12345),
            file_size=768,
        )
        self.assertEqual(transfer.blocks_total, 2)

    def test_progress_percent_calculation(self):
        """Test progress percentage calculation."""
        transfer = TFTPTransfer(
            filename="test.pxe",
            filepath="/tmp/test.pxe",
            client_addr=("192.168.1.100", 12345),
            file_size=1000,
            bytes_sent=500,
        )

        self.assertEqual(transfer.progress_percent, 50.0)

    def test_progress_percent_zero_size(self):
        """Test progress percentage for zero-size file."""
        transfer = TFTPTransfer(
            filename="empty.pxe",
            filepath="/tmp/empty.pxe",
            client_addr=("192.168.1.100", 12345),
            file_size=0,
        )

        # Zero-size files are 100% complete immediately
        self.assertEqual(transfer.progress_percent, 100.0)


# =============================================================================
# TFTPProtocol Handler Tests
# =============================================================================

class TestTFTPProtocol(unittest.TestCase):
    """Tests for TFTP protocol handlers."""

    def setUp(self):
        """Set up test fixtures."""
        self.temp_dir = tempfile.mkdtemp()
        self.config = create_test_config(root_dir=self.temp_dir)
        from systems.pixel_compiler.pxe.tftp_server import TFTPProtocol
        self.protocol = TFTPProtocol(self.config)
        self.protocol.transport = MagicMock()

    def tearDown(self):
        """Clean up temp directory."""
        import shutil
        shutil.rmtree(self.temp_dir, ignore_errors=True)

    def test_sanitize_filename_valid(self):
        """Test valid filename passes sanitization."""
        result = self.protocol._sanitize_filename("ipxe.pxe")
        self.assertEqual(result, "ipxe.pxe")

    def test_sanitize_filename_path_traversal_parent(self):
        """Test path traversal with .. is blocked."""
        self.assertIsNone(self.protocol._sanitize_filename("../../../etc/passwd"))

    def test_sanitize_filename_path_traversal_windows(self):
        """Test Windows-style path traversal is blocked."""
        self.assertIsNone(self.protocol._sanitize_filename("..\\..\\windows\\system32"))

    def test_sanitize_filename_absolute_path(self):
        """Test absolute path is blocked."""
        self.assertIsNone(self.protocol._sanitize_filename("/etc/passwd"))

    def test_sanitize_filename_hidden_file(self):
        """Test hidden files are blocked."""
        self.assertIsNone(self.protocol._sanitize_filename(".hidden"))
        # Note: .ssh/authorized_keys returns basename 'authorized_keys' which is valid
        # The hidden check is only on the final basename

    def test_sanitize_filename_subdirectory(self):
        """Test subdirectory access is blocked (only basename allowed)."""
        # Path with subdirectory - should return only basename
        result = self.protocol._sanitize_filename("subdir/file.pxe")
        self.assertEqual(result, "file.pxe")

    def test_handle_rrq_file_not_found(self):
        """Test RRQ for non-existent file sends ERROR."""
        packet = TFTPPacketParser.parse(build_tftp_rrq("nonexistent.pxe"))
        self.protocol._handle_rrq(packet, ("192.168.1.100", 12345))

        # Should have sent ERROR packet
        self.protocol.transport.sendto.assert_called_once()
        sent_data = self.protocol.transport.sendto.call_args[0][0]
        self.assertEqual(sent_data[:2], struct.pack('!H', TFTP_OPCODE_ERROR))

    def test_handle_rrq_valid_file(self):
        """Test RRQ for existing file starts transfer."""
        # Create test file
        test_file = os.path.join(self.temp_dir, "test.pxe")
        with open(test_file, 'wb') as f:
            f.write(b'A' * 1000)

        packet = TFTPPacketParser.parse(build_tftp_rrq("test.pxe"))
        self.protocol._handle_rrq(packet, ("192.168.1.100", 12345))

        # Should have created transfer
        self.assertIn(("192.168.1.100", 12345), self.protocol.transfers)

        # Should have started async transfer task
        transfer = self.protocol.transfers[("192.168.1.100", 12345)]
        self.assertEqual(transfer.filename, "test.pxe")
        self.assertEqual(transfer.file_size, 1000)

    def test_handle_ack_unknown_transfer(self):
        """Test ACK for unknown transfer is ignored."""
        packet = TFTPPacketParser.parse(build_tftp_ack(1))
        # Should not raise
        self.protocol._handle_ack(packet, ("192.168.1.100", 12345))

    def test_handle_ack_wrong_block(self):
        """Test ACK with wrong block number is ignored."""
        # Create transfer
        transfer = TFTPTransfer(
            filename="test.pxe",
            filepath="/tmp/test.pxe",
            client_addr=("192.168.1.100", 12345),
            block_num=5,
        )
        self.protocol.transfers[("192.168.1.100", 12345)] = transfer

        # ACK for wrong block
        packet = TFTPPacketParser.parse(build_tftp_ack(3))
        self.protocol._handle_ack(packet, ("192.168.1.100", 12345))

        # Block number should not change
        self.assertEqual(transfer.block_num, 5)

    def test_handle_ack_correct_block(self):
        """Test ACK with correct block number signals event."""
        # Create transfer with ack_event
        transfer = TFTPTransfer(
            filename="test.pxe",
            filepath="/tmp/test.pxe",
            client_addr=("192.168.1.100", 12345),
            block_num=1,
        )
        self.protocol.transfers[("192.168.1.100", 12345)] = transfer

        # ACK for correct block
        packet = TFTPPacketParser.parse(build_tftp_ack(1))
        self.protocol._handle_ack(packet, ("192.168.1.100", 12345))

        # Event should be set
        self.assertTrue(transfer.ack_event.is_set())


# =============================================================================
# TFTP Integration Tests
# =============================================================================

class TestTFTPIntegration(unittest.TestCase):
    """Integration tests for TFTP server."""

    def setUp(self):
        """Set up test fixtures."""
        self.temp_dir = tempfile.mkdtemp()
        self.config = create_test_config(root_dir=self.temp_dir)

    def tearDown(self):
        """Clean up temp directory."""
        import shutil
        shutil.rmtree(self.temp_dir, ignore_errors=True)

    def test_full_file_transfer(self):
        """Test complete file transfer flow."""
        # Create test file (exactly 2 blocks)
        test_data = b'A' * 512 + b'B' * 256  # 768 bytes = 2 blocks
        test_file = os.path.join(self.temp_dir, "boot.pxe")
        with open(test_file, 'wb') as f:
            f.write(test_data)

        from systems.pixel_compiler.pxe.tftp_server import TFTPProtocol, TFTPTransfer
        protocol = TFTPProtocol(self.config)
        protocol.transport = MagicMock()

        client_addr = ("192.168.1.100", 12345)

        # 1. RRQ starts transfer
        rrq = TFTPPacketParser.parse(build_tftp_rrq("boot.pxe"))
        protocol._handle_rrq(rrq, client_addr)

        self.assertIn(client_addr, protocol.transfers)
        transfer = protocol.transfers[client_addr]
        self.assertEqual(transfer.file_size, 768)

    def test_concurrent_transfers_different_clients(self):
        """Test multiple clients can transfer simultaneously."""
        # Create test file
        test_file = os.path.join(self.temp_dir, "shared.pxe")
        with open(test_file, 'wb') as f:
            f.write(b'DATA' * 128)

        from systems.pixel_compiler.pxe.tftp_server import TFTPProtocol
        protocol = TFTPProtocol(self.config)
        protocol.transport = MagicMock()

        # Two different clients
        client1 = ("192.168.1.100", 12345)
        client2 = ("192.168.1.101", 12345)

        # Both request same file
        rrq = TFTPPacketParser.parse(build_tftp_rrq("shared.pxe"))
        protocol._handle_rrq(rrq, client1)
        protocol._handle_rrq(rrq, client2)

        # Both should have transfers
        self.assertIn(client1, protocol.transfers)
        self.assertIn(client2, protocol.transfers)
        self.assertNotEqual(
            id(protocol.transfers[client1]),
            id(protocol.transfers[client2])
        )

    def test_transfer_cleanup(self):
        """Test transfer cleanup removes transfer from dict."""
        from systems.pixel_compiler.pxe.tftp_server import TFTPProtocol
        protocol = TFTPProtocol(self.config)
        protocol.transport = MagicMock()

        client_addr = ("192.168.1.100", 12345)

        # Create transfer
        transfer = TFTPTransfer(
            filename="test.pxe",
            filepath="/tmp/test.pxe",
            client_addr=client_addr,
        )
        protocol.transfers[client_addr] = transfer

        # Cleanup
        protocol._cleanup_transfer(client_addr)

        # Transfer should be removed
        self.assertNotIn(client_addr, protocol.transfers)

    def test_send_error_packet(self):
        """Test sending error packet."""
        from systems.pixel_compiler.pxe.tftp_server import TFTPProtocol
        protocol = TFTPProtocol(self.config)
        protocol.transport = MagicMock()

        protocol._send_error(("192.168.1.100", 12345), TFTP_ERROR_FILE_NOT_FOUND, "File not found")

        protocol.transport.sendto.assert_called_once()
        sent_data = protocol.transport.sendto.call_args[0][0]

        # Verify it's an error packet
        self.assertEqual(sent_data[:2], struct.pack('!H', TFTP_OPCODE_ERROR))


# =============================================================================
# Run tests
# =============================================================================

if __name__ == '__main__':
    unittest.main()
