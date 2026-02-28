"""
Async TFTP Server for PXE Boot.

Provides TFTP server functionality for PXE clients to download
bootloader files after receiving DHCP configuration.

Usage:
    python -m systems.pixel_compiler.pxe.tftp_server --root-dir /tftpboot

Or programmatically:
    from systems.pixel_compiler.pxe import TFTPServer, TFTPServerConfig

    config = TFTPServerConfig(root_dir="/tftpboot")
    server = TFTPServer(config)
    asyncio.run(server.serve_forever())
"""

import asyncio
import logging
import os
import socket
import struct
import time
from dataclasses import dataclass, field
from typing import Optional, Dict, Any, IO

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)
logger = logging.getLogger(__name__)


# =============================================================================
# TFTP Protocol Constants (RFC 1350)
# =============================================================================

# TFTP Opcodes
TFTP_OPCODE_RRQ = 1    # Read Request
TFTP_OPCODE_WRQ = 2    # Write Request (not needed for PXE)
TFTP_OPCODE_DATA = 3   # Data packet
TFTP_OPCODE_ACK = 4    # Acknowledgment
TFTP_OPCODE_ERROR = 5  # Error packet

# TFTP Error Codes
TFTP_ERROR_NOT_DEFINED = 0
TFTP_ERROR_FILE_NOT_FOUND = 1
TFTP_ERROR_ACCESS_VIOLATION = 2
TFTP_ERROR_DISK_FULL = 3
TFTP_ERROR_ILLEGAL_OPERATION = 4
TFTP_ERROR_UNKNOWN_TID = 5
TFTP_ERROR_FILE_EXISTS = 6
TFTP_ERROR_NO_SUCH_USER = 7

# Default block size (standard TFTP)
TFTP_BLOCK_SIZE = 512


# =============================================================================
# TFTP Packet Structures
# =============================================================================

@dataclass
class TFTPPacket:
    """TFTP packet structure."""
    opcode: int
    filename: str = ""      # For RRQ/WRQ
    mode: str = "octet"     # For RRQ/WRQ (always octet for binary)
    block_num: int = 0      # For DATA/ACK
    data: bytes = b""       # For DATA
    error_code: int = 0     # For ERROR
    error_msg: str = ""     # For ERROR


class TFTPPacketParser:
    """Parser and builder for TFTP packets."""

    @staticmethod
    def parse(data: bytes) -> Optional[TFTPPacket]:
        """
        Parse raw UDP packet data to TFTPPacket.

        Args:
            data: Raw bytes from UDP datagram

        Returns:
            TFTPPacket if valid, None if parsing fails
        """
        if len(data) < 2:
            logger.warning(f"[TFTP] Packet too short: {len(data)} bytes")
            return None

        try:
            # Extract opcode (first 2 bytes, network byte order)
            opcode = struct.unpack('!H', data[:2])[0]

            # Validate opcode
            if opcode not in (TFTP_OPCODE_RRQ, TFTP_OPCODE_WRQ,
                              TFTP_OPCODE_DATA, TFTP_OPCODE_ACK,
                              TFTP_OPCODE_ERROR):
                logger.warning(f"[TFTP] Invalid opcode: {opcode}")
                return None

            # Parse based on opcode
            if opcode in (TFTP_OPCODE_RRQ, TFTP_OPCODE_WRQ):
                # RRQ/WRQ format: | Opcode | Filename | 0 | Mode | 0 |
                # Filename and mode are null-terminated strings
                parts = data[2:].split(b'\x00')

                if len(parts) < 2:
                    logger.warning("[TFTP] Malformed RRQ/WRQ packet")
                    return None

                filename = parts[0].decode('utf-8', errors='replace')
                mode = parts[1].decode('utf-8', errors='replace').lower()

                return TFTPPacket(
                    opcode=opcode,
                    filename=filename,
                    mode=mode
                )

            elif opcode == TFTP_OPCODE_DATA:
                # DATA format: | Opcode | Block # | Data |
                if len(data) < 4:
                    logger.warning("[TFTP] DATA packet too short")
                    return None

                block_num = struct.unpack('!H', data[2:4])[0]
                payload = data[4:]

                return TFTPPacket(
                    opcode=opcode,
                    block_num=block_num,
                    data=payload
                )

            elif opcode == TFTP_OPCODE_ACK:
                # ACK format: | Opcode | Block # |
                if len(data) != 4:
                    logger.warning("[TFTP] Malformed ACK packet")
                    return None

                block_num = struct.unpack('!H', data[2:4])[0]

                return TFTPPacket(
                    opcode=opcode,
                    block_num=block_num
                )

            elif opcode == TFTP_OPCODE_ERROR:
                # ERROR format: | Opcode | Error Code | Error Msg | 0 |
                if len(data) < 5:
                    logger.warning("[TFTP] ERROR packet too short")
                    return None

                error_code = struct.unpack('!H', data[2:4])[0]
                error_msg = data[4:].rstrip(b'\x00').decode('utf-8', errors='replace')

                return TFTPPacket(
                    opcode=opcode,
                    error_code=error_code,
                    error_msg=error_msg
                )

        except Exception as e:
            logger.error(f"[TFTP] Parse error: {e}")
            return None

        return None

    @staticmethod
    def build_rrq(filename: str, mode: str = "octet") -> bytes:
        """
        Build TFTP Read Request packet.

        Args:
            filename: File to request
            mode: Transfer mode (always 'octet' for binary)

        Returns:
            Raw bytes ready for UDP transmission
        """
        # Format: | Opcode (2) | Filename (null-terminated) | Mode (null-terminated) |
        packet = struct.pack('!H', TFTP_OPCODE_RRQ)
        packet += filename.encode('utf-8') + b'\x00'
        packet += mode.encode('utf-8') + b'\x00'
        return packet

    @staticmethod
    def build_data(block_num: int, data: bytes) -> bytes:
        """
        Build TFTP DATA packet.

        Args:
            block_num: Block number (1-65535)
            data: Data payload (0-512 bytes)

        Returns:
            Raw bytes ready for UDP transmission
        """
        # Format: | Opcode (2) | Block # (2) | Data (0-512) |
        packet = struct.pack('!HH', TFTP_OPCODE_DATA, block_num)
        packet += data
        return packet

    @staticmethod
    def build_ack(block_num: int) -> bytes:
        """
        Build TFTP ACK packet.

        Args:
            block_num: Block number being acknowledged

        Returns:
            Raw bytes ready for UDP transmission
        """
        # Format: | Opcode (2) | Block # (2) |
        return struct.pack('!HH', TFTP_OPCODE_ACK, block_num)

    @staticmethod
    def build_error(error_code: int, error_msg: str) -> bytes:
        """
        Build TFTP ERROR packet.

        Args:
            error_code: TFTP error code
            error_msg: Human-readable error message

        Returns:
            Raw bytes ready for UDP transmission
        """
        # Format: | Opcode (2) | Error Code (2) | Error Msg (null-terminated) |
        packet = struct.pack('!HH', TFTP_OPCODE_ERROR, error_code)
        packet += error_msg.encode('utf-8') + b'\x00'
        return packet


# =============================================================================
# TFTP Server Configuration
# =============================================================================

@dataclass
class TFTPServerConfig:
    """Configuration for TFTP server."""
    interface: str = "0.0.0.0"       # Interface to bind
    listen_port: int = 69            # TFTP server port
    root_dir: str = "/tftpboot"      # Directory containing boot files
    block_size: int = 512            # TFTP block size
    timeout: float = 5.0             # Retransmission timeout
    max_retries: int = 5             # Max retransmission attempts


# =============================================================================
# TFTP Transfer Tracking
# =============================================================================

@dataclass
class TFTPTransfer:
    """Tracks state of an active TFTP transfer."""
    filename: str
    file_handle: IO[bytes]          # Open file handle
    client_addr: tuple              # (ip, port) of client
    block_num: int = 0              # Current block number
    bytes_sent: int = 0             # Total bytes transferred
    last_ack: float = 0.0           # Timestamp of last ACK
    retries: int = 0                # Retransmission count
    complete: bool = False          # Transfer finished
    file_size: int = 0              # Total file size for logging


# =============================================================================
# TFTP Protocol Handler
# =============================================================================

class TFTPProtocol(asyncio.DatagramProtocol):
    """Async UDP protocol for TFTP server."""

    def __init__(self, config: TFTPServerConfig):
        self.config = config
        self.transport = None
        self.transfers: Dict[tuple, TFTPTransfer] = {}  # client_addr -> Transfer

    def connection_made(self, transport):
        """Called when UDP endpoint is established."""
        self.transport = transport
        logger.info(f"[TFTP] Server listening on {self.config.interface}:{self.config.listen_port}")
        logger.info(f"[TFTP] Root directory: {self.config.root_dir}")

    def datagram_received(self, data: bytes, addr: tuple):
        """Handle incoming TFTP packet."""
        client_ip, client_port = addr

        # Debug: log raw packet
        logger.debug(f"[TFTP] Raw packet ({len(data)} bytes) from {client_ip}:{client_port}")

        # Parse the packet
        packet = TFTPPacketParser.parse(data)
        if not packet:
            logger.warning(f"[TFTP] Malformed packet from {client_ip}:{client_port}")
            return

        # Route to appropriate handler
        if packet.opcode == TFTP_OPCODE_RRQ:
            self._handle_rrq(packet, addr)
        elif packet.opcode == TFTP_OPCODE_ACK:
            self._handle_ack(packet, addr)
        elif packet.opcode == TFTP_OPCODE_ERROR:
            logger.warning(f"[TFTP] ERROR from {client_ip}:{client_port}: {packet.error_msg}")
        elif packet.opcode == TFTP_OPCODE_WRQ:
            # We don't support write requests for PXE boot
            self._send_error(addr, TFTP_ERROR_ACCESS_VIOLATION, "Write not permitted")

    def error_received(self, exc):
        """Handle UDP errors."""
        logger.error(f"[TFTP] UDP error: {exc}")

    # =========================================================================
    # RRQ Handler
    # =========================================================================

    def _handle_rrq(self, packet: TFTPPacket, client_addr: tuple):
        """Handle TFTP Read Request."""
        client_ip, client_port = client_addr

        # Validate filename (prevent path traversal)
        filename = self._sanitize_filename(packet.filename)
        if filename is None:
            logger.warning(f"[TFTP] Path traversal attempt from {client_ip}: {packet.filename}")
            self._send_error(client_addr, TFTP_ERROR_ACCESS_VIOLATION, "Invalid path")
            return

        filepath = os.path.join(self.config.root_dir, filename)

        # Check file exists
        if not os.path.isfile(filepath):
            logger.warning(f"[TFTP] File not found: {filename} (requested by {client_ip})")
            self._send_error(client_addr, TFTP_ERROR_FILE_NOT_FOUND, "File not found")
            return

        # Check file is readable
        if not os.access(filepath, os.R_OK):
            logger.warning(f"[TFTP] Access denied: {filename} (requested by {client_ip})")
            self._send_error(client_addr, TFTP_ERROR_ACCESS_VIOLATION, "Access denied")
            return

        # Get file size for logging
        file_size = os.path.getsize(filepath)

        logger.info(f"[TFTP] RRQ from {client_ip}:{client_port} for {filename} ({file_size} bytes)")

        # Create transfer tracking
        try:
            file_handle = open(filepath, 'rb')
        except IOError as e:
            logger.error(f"[TFTP] Failed to open {filename}: {e}")
            self._send_error(client_addr, TFTP_ERROR_NOT_DEFINED, "Internal error")
            return

        transfer = TFTPTransfer(
            filename=filename,
            file_handle=file_handle,
            client_addr=client_addr,
            file_size=file_size
        )
        self.transfers[client_addr] = transfer

        # Send first block
        self._send_next_block(transfer)

    # =========================================================================
    # ACK Handler
    # =========================================================================

    def _handle_ack(self, packet: TFTPPacket, client_addr: tuple):
        """Handle TFTP ACK packet."""
        transfer = self.transfers.get(client_addr)
        if transfer is None:
            # Unknown transfer, ignore
            logger.debug(f"[TFTP] ACK from unknown client {client_addr}")
            return

        if packet.block_num != transfer.block_num:
            # Out of sequence ACK, ignore (might be duplicate)
            logger.debug(
                f"[TFTP] Out of sequence ACK: expected {transfer.block_num}, got {packet.block_num}"
            )
            return

        transfer.last_ack = time.time()
        transfer.retries = 0  # Reset retry counter

        if transfer.complete:
            # Transfer complete, cleanup
            self._cleanup_transfer(client_addr)
            logger.info(
                f"[TFTP] Transfer complete: {transfer.filename} "
                f"({transfer.bytes_sent} bytes to {client_addr[0]})"
            )
        else:
            # Send next block
            self._send_next_block(transfer)

    # =========================================================================
    # Data Transmission
    # =========================================================================

    def _send_next_block(self, transfer: TFTPTransfer):
        """Send next DATA block to client."""
        # Read next block from file
        data = transfer.file_handle.read(self.config.block_size)
        transfer.block_num += 1

        # Build and send DATA packet
        packet = TFTPPacketParser.build_data(transfer.block_num, data)
        self.transport.sendto(packet, transfer.client_addr)

        transfer.bytes_sent += len(data)

        logger.debug(
            f"[TFTP] Sent block {transfer.block_num} of {transfer.filename} "
            f"({len(data)} bytes, total {transfer.bytes_sent})"
        )

        # Check if this is the last block (< 512 bytes)
        if len(data) < self.config.block_size:
            transfer.complete = True
            logger.debug(f"[TFTP] Last block sent for {transfer.filename}")

    # =========================================================================
    # Utility Methods
    # =========================================================================

    def _sanitize_filename(self, filename: str) -> Optional[str]:
        """
        Sanitize filename to prevent path traversal attacks.

        Args:
            filename: Requested filename

        Returns:
            Safe basename or None if path traversal detected
        """
        # Remove any path components
        basename = os.path.basename(filename)

        # Ensure it doesn't start with . (hidden files)
        if basename.startswith('.'):
            return None

        # Ensure no path traversal in original
        if '..' in filename or filename.startswith('/'):
            return None

        return basename

    def _send_error(self, client_addr: tuple, error_code: int, error_msg: str):
        """Send TFTP ERROR packet to client."""
        packet = TFTPPacketParser.build_error(error_code, error_msg)
        self.transport.sendto(packet, client_addr)
        logger.debug(f"[TFTP] Sent ERROR {error_code}: {error_msg} to {client_addr}")

    def _cleanup_transfer(self, client_addr: tuple):
        """Clean up completed transfer."""
        transfer = self.transfers.pop(client_addr, None)
        if transfer:
            try:
                transfer.file_handle.close()
            except Exception as e:
                logger.debug(f"[TFTP] Error closing file: {e}")


# =============================================================================
# TFTP Server
# =============================================================================

class TFTPServer:
    """Async TFTP server for PXE boot."""

    def __init__(self, config: TFTPServerConfig):
        self.config = config
        self._loop: Optional[asyncio.AbstractEventLoop] = None
        self._transport: Optional[asyncio.DatagramTransport] = None
        self._protocol: Optional[TFTPProtocol] = None

    async def start(self):
        """Start TFTP server on configured interface."""
        self._loop = asyncio.get_running_loop()

        # Create UDP socket with proper options
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

        # Allow address reuse for quick restart
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

        # Bind to configured interface and port
        try:
            sock.bind((self.config.interface, self.config.listen_port))
        except PermissionError:
            logger.error(
                f"[TFTP] Permission denied - TFTP requires root to bind to port {self.config.listen_port}"
            )
            sock.close()
            raise
        except OSError as e:
            logger.error(f"[TFTP] Failed to bind to port {self.config.listen_port}: {e}")
            sock.close()
            raise

        # Create datagram endpoint with pre-configured socket
        try:
            self._transport, self._protocol = await self._loop.create_datagram_endpoint(
                lambda: TFTPProtocol(self.config),
                sock=sock,
            )
        except Exception as e:
            logger.error(f"[TFTP] Failed to create datagram endpoint: {e}")
            sock.close()
            raise

        logger.info(f"[TFTP] Server ready for PXE clients")

    async def stop(self):
        """Stop TFTP server gracefully."""
        if self._transport:
            self._transport.close()
            self._transport = None
            self._protocol = None
            logger.info("[TFTP] Server stopped")

        # Log active transfers on shutdown
        if self._protocol:
            active = len(self._protocol.transfers)
            if active > 0:
                logger.info(f"[TFTP] {active} active transfers at shutdown")

    async def serve_forever(self):
        """Start and run until interrupted."""
        await self.start()

        try:
            await asyncio.Future()  # Run forever
        except asyncio.CancelledError:
            pass
        finally:
            await self.stop()

    @classmethod
    def from_args(cls, args) -> 'TFTPServer':
        """Create server from parsed CLI arguments."""
        config = TFTPServerConfig(
            interface=args.interface,
            listen_port=args.port,
            root_dir=args.root_dir,
            block_size=args.block_size,
            timeout=args.timeout,
            max_retries=args.max_retries
        )
        return cls(config)
