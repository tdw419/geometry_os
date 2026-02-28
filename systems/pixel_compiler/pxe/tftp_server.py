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

import argparse
import asyncio
import logging
import math
import os
import socket
import struct
import time
from dataclasses import dataclass, field
from typing import Optional, Dict, Any

import aiofiles

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
    filepath: str                   # Full path to file
    client_addr: tuple              # (ip, port) of client
    file_size: int = 0              # Total file size
    block_num: int = 0              # Current block number sent
    bytes_sent: int = 0             # Total bytes transferred
    last_ack_time: float = 0.0      # Timestamp of last ACK received
    last_ack_block: int = 0         # Block number of last ACK
    retries: int = 0                # Retransmission count
    complete: bool = False          # Transfer finished
    started_at: float = field(default_factory=time.time)
    ack_event: asyncio.Event = field(default_factory=asyncio.Event)
    last_data: bytes = b""          # Last data block sent (for retransmission)

    @property
    def blocks_total(self) -> int:
        """Calculate total blocks needed."""
        return math.ceil(self.file_size / TFTP_BLOCK_SIZE) if self.file_size > 0 else 1

    @property
    def progress_percent(self) -> float:
        """Calculate transfer progress."""
        if self.file_size == 0:
            return 100.0
        return (self.bytes_sent / self.file_size) * 100


# =============================================================================
# TFTP Protocol Handler
# =============================================================================

class TFTPProtocol(asyncio.DatagramProtocol):
    """Async UDP protocol for TFTP server with concurrent transfer support."""

    def __init__(self, config: TFTPServerConfig):
        self.config = config
        self.transport = None
        self.transfers: Dict[tuple, TFTPTransfer] = {}  # client_addr -> Transfer
        self._loop: Optional[asyncio.AbstractEventLoop] = None

    def connection_made(self, transport):
        """Called when UDP endpoint is established."""
        self.transport = transport
        self._loop = asyncio.get_running_loop()
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
    # RRQ Handler - Starts async transfer
    # =========================================================================

    def _handle_rrq(self, packet: TFTPPacket, client_addr: tuple):
        """Handle TFTP Read Request - starts async transfer task."""
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

        # Create transfer tracking (no file handle - will be opened async)
        transfer = TFTPTransfer(
            filename=filename,
            filepath=filepath,
            client_addr=client_addr,
            file_size=file_size,
        )
        self.transfers[client_addr] = transfer

        # Start async transfer task (non-blocking)
        asyncio.ensure_future(self._run_transfer(transfer))

    # =========================================================================
    # Async Transfer Runner
    # =========================================================================

    async def _run_transfer(self, transfer: TFTPTransfer):
        """Run complete file transfer asynchronously with timeout and retry."""
        try:
            async with aiofiles.open(transfer.filepath, 'rb') as f:
                while not transfer.complete:
                    # Read next block
                    data = await f.read(self.config.block_size)
                    transfer.block_num += 1
                    transfer.last_data = data  # Store for potential retransmit

                    # Build and send DATA packet
                    packet = TFTPPacketParser.build_data(transfer.block_num, data)
                    self.transport.sendto(packet, transfer.client_addr)

                    transfer.bytes_sent += len(data)

                    logger.debug(
                        f"[TFTP] Sent block {transfer.block_num}/{transfer.blocks_total} "
                        f"of {transfer.filename} ({len(data)} bytes, {transfer.progress_percent:.1f}%)"
                    )

                    # Check if this is the last block
                    if len(data) < self.config.block_size:
                        transfer.complete = True
                        logger.info(
                            f"[TFTP] Transfer complete: {transfer.filename} "
                            f"({transfer.bytes_sent} bytes) to {transfer.client_addr[0]}"
                        )
                        # Wait briefly for final ACK before cleanup
                        try:
                            await asyncio.wait_for(
                                transfer.ack_event.wait(),
                                timeout=self.config.timeout
                            )
                        except asyncio.TimeoutError:
                            logger.debug(f"[TFTP] Final ACK timeout for {transfer.filename}")
                        finally:
                            self._cleanup_transfer(transfer.client_addr)
                        return

                    # Wait for ACK with timeout
                    transfer.ack_event.clear()
                    try:
                        await asyncio.wait_for(
                            transfer.ack_event.wait(),
                            timeout=self.config.timeout
                        )
                        transfer.retries = 0  # Reset on successful ACK
                    except asyncio.TimeoutError:
                        transfer.retries += 1
                        if transfer.retries >= self.config.max_retries:
                            logger.error(
                                f"[TFTP] Transfer timeout after {transfer.retries} retries: "
                                f"{transfer.filename}"
                            )
                            self._send_error(
                                transfer.client_addr,
                                TFTP_ERROR_NOT_DEFINED,
                                "Transfer timeout"
                            )
                            self._cleanup_transfer(transfer.client_addr)
                            return

                        # Retransmit last block
                        logger.warning(
                            f"[TFTP] Retransmitting block {transfer.block_num} "
                            f"(retry {transfer.retries}/{self.config.max_retries})"
                        )
                        packet = TFTPPacketParser.build_data(transfer.block_num, transfer.last_data)
                        self.transport.sendto(packet, transfer.client_addr)
                        # Decrement block_num so next iteration sends same block again
                        transfer.block_num -= 1

        except Exception as e:
            logger.error(f"[TFTP] Transfer error for {transfer.filename}: {e}")
            self._send_error(transfer.client_addr, TFTP_ERROR_NOT_DEFINED, "Internal error")
            self._cleanup_transfer(transfer.client_addr)

    # =========================================================================
    # ACK Handler - Signals async transfer to continue
    # =========================================================================

    def _handle_ack(self, packet: TFTPPacket, client_addr: tuple):
        """Handle TFTP ACK packet - signals transfer to continue."""
        transfer = self.transfers.get(client_addr)
        if transfer is None:
            logger.debug(f"[TFTP] ACK from unknown client {client_addr}")
            return

        # Check if ACK is for the block we just sent
        if packet.block_num == transfer.block_num:
            transfer.last_ack_time = time.time()
            transfer.last_ack_block = packet.block_num
            transfer.retries = 0
            transfer.ack_event.set()  # Signal ACK received

            if transfer.complete:
                # Transfer was complete, cleanup
                self._cleanup_transfer(client_addr)
        elif packet.block_num == transfer.block_num - 1:
            # Duplicate ACK for previous block, ignore
            logger.debug(f"[TFTP] Duplicate ACK for block {packet.block_num}")
        else:
            logger.debug(
                f"[TFTP] Out of sequence ACK: expected {transfer.block_num}, "
                f"got {packet.block_num}"
            )

    # =========================================================================
    # Periodic Cleanup
    # =========================================================================

    async def _cleanup_stale_transfers(self):
        """Periodically clean up transfers that have timed out."""
        while True:
            await asyncio.sleep(30)  # Check every 30 seconds

            now = time.time()
            stale = []

            for addr, transfer in self.transfers.items():
                # Check if transfer has been inactive too long
                if transfer.last_ack_time > 0:
                    inactive_time = now - transfer.last_ack_time
                else:
                    inactive_time = now - transfer.started_at

                max_inactive = self.config.timeout * self.config.max_retries
                if inactive_time > max_inactive:
                    stale.append(addr)

            for addr in stale:
                transfer = self.transfers.get(addr)
                if transfer:
                    logger.warning(
                        f"[TFTP] Cleaning up stale transfer: {transfer.filename} "
                        f"(inactive for {now - transfer.last_ack_time:.1f}s)"
                    )
                self._cleanup_transfer(addr)

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
        """Clean up completed or failed transfer."""
        transfer = self.transfers.pop(client_addr, None)
        if transfer:
            duration = time.time() - transfer.started_at
            throughput = transfer.bytes_sent / duration if duration > 0 else 0
            logger.info(
                f"[TFTP] Cleanup: {transfer.filename} - "
                f"{transfer.bytes_sent} bytes in {duration:.1f}s "
                f"({throughput/1024:.1f} KB/s)"
            )


# =============================================================================
# TFTP Server
# =============================================================================

class TFTPServer:
    """Async TFTP server for PXE boot with concurrent transfer support."""

    def __init__(self, config: TFTPServerConfig):
        self.config = config
        self._loop: Optional[asyncio.AbstractEventLoop] = None
        self._transport: Optional[asyncio.DatagramTransport] = None
        self._protocol: Optional[TFTPProtocol] = None
        self._cleanup_task: Optional[asyncio.Task] = None
        self._status_task: Optional[asyncio.Task] = None

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

        # Start background cleanup task
        self._cleanup_task = asyncio.create_task(self._protocol._cleanup_stale_transfers())

        logger.info(f"[TFTP] Server ready for PXE clients")

    async def stop(self):
        """Stop TFTP server gracefully."""
        # Cancel background tasks
        for task in [self._cleanup_task, self._status_task]:
            if task and not task.done():
                task.cancel()
                try:
                    await task
                except asyncio.CancelledError:
                    pass

        # Clean up active transfers
        if self._protocol:
            active = len(self._protocol.transfers)
            if active > 0:
                logger.info(f"[TFTP] {active} active transfers at shutdown")
                for addr in list(self._protocol.transfers.keys()):
                    self._protocol._cleanup_transfer(addr)

        if self._transport:
            self._transport.close()
            self._transport = None
            self._protocol = None
            logger.info("[TFTP] Server stopped")

    async def serve_forever(self):
        """Start and run with periodic status logging."""
        await self.start()

        # Status logging task
        async def log_status():
            while True:
                await asyncio.sleep(300)  # Every 5 minutes
                if self._protocol:
                    active = len(self._protocol.transfers)
                    logger.info(f"[TFTP] Status: {active} active transfers")

        self._status_task = asyncio.create_task(log_status())

        try:
            await asyncio.Future()  # Run forever
        except asyncio.CancelledError:
            pass
        finally:
            await self.stop()

    @classmethod
    def from_args(cls, args: argparse.Namespace) -> 'TFTPServer':
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


# =============================================================================
# CLI Entry Point
# =============================================================================

def create_argument_parser() -> argparse.ArgumentParser:
    """Create CLI argument parser."""
    parser = argparse.ArgumentParser(
        description='Async TFTP Server for PXE Boot',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Start TFTP server on default port 69
  sudo python -m systems.pixel_compiler.pxe.tftp_server -r /tftpboot

  # Start on custom port with verbose logging
  python -m systems.pixel_compiler.pxe.tftp_server -p 6969 -r /tftpboot -v
"""
    )

    parser.add_argument('--interface', '-i', default='0.0.0.0',
                       help='Interface to bind (default: 0.0.0.0)')
    parser.add_argument('--port', '-p', type=int, default=69,
                       help='TFTP port (default: 69)')
    parser.add_argument('--root-dir', '-r', default='/tftpboot',
                       help='Root directory for TFTP files')
    parser.add_argument('--block-size', '-b', type=int, default=512,
                       help='TFTP block size (default: 512)')
    parser.add_argument('--timeout', '-t', type=float, default=5.0,
                       help='Retransmission timeout in seconds')
    parser.add_argument('--max-retries', type=int, default=5,
                       help='Max retransmission attempts')
    parser.add_argument('--verbose', '-v', action='store_true',
                       help='Enable debug logging')

    return parser


async def main():
    """Main entry point."""
    parser = create_argument_parser()
    args = parser.parse_args()

    if args.verbose:
        logging.getLogger().setLevel(logging.DEBUG)

    server = TFTPServer.from_args(args)

    try:
        await server.serve_forever()
    except KeyboardInterrupt:
        logger.info("[TFTP] Shutdown requested")
    except Exception as e:
        logger.error(f"[TFTP] Fatal error: {e}")
        raise


if __name__ == '__main__':
    asyncio.run(main())
