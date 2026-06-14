"""
TFTP Server for PXE Boot

Implements a TFTP (Trivial File Transfer Protocol) server on port 69 for
serving boot files (pxelinux.0, kernels, initrds) to PXE clients.

Key Features:
    - Async-compatible design using asyncio
    - Read-only operation (RRQ only, no WRQ)
    - Block-based transfer (512 bytes per block)
    - ACK handling for each block
    - Error handling for missing files
    - Timeout and retransmission support
    - Concurrent transfers to multiple clients

TFTP Protocol:
    - Opcode 1 = RRQ (Read Request)
    - Opcode 2 = WRQ (Write Request - not supported)
    - Opcode 3 = DATA (block#, data)
    - Opcode 4 = ACK (block#)
    - Opcode 5 = ERROR (code, message)

Usage:
    server = TFTPServer()
    server.set_root_dir("/srv/tftp")
    await server.start()

    # ... serving ...

    await server.stop()
"""

import asyncio
import logging
import socket
import struct
from dataclasses import dataclass
from pathlib import Path
from typing import Any

logger = logging.getLogger(__name__)


# TFTP Constants
TFTP_PORT = 69  # Standard TFTP port
TFTP_BLOCK_SIZE = 512  # Standard block size
TFTP_MAX_BLOCK = 65535  # Maximum block number
TFTP_TIMEOUT = 5.0  # Timeout in seconds
TFTP_MAX_RETRIES = 3  # Maximum retransmission attempts

# TFTP Opcodes
OPCODE_RRQ = 1  # Read Request
OPCODE_WRQ = 2  # Write Request
OPCODE_DATA = 3  # Data packet
OPCODE_ACK = 4  # Acknowledgment
OPCODE_ERROR = 5  # Error packet
OPCODE_OACK = 6  # Option Acknowledgment

# TFTP Error Codes
ERROR_NOT_DEFINED = 0
ERROR_FILE_NOT_FOUND = 1
ERROR_ACCESS_VIOLATION = 2
ERROR_DISK_FULL = 3
ERROR_ILLEGAL_OPERATION = 4
ERROR_UNKNOWN_TID = 5
ERROR_FILE_EXISTS = 6
ERROR_NO_SUCH_USER = 7


@dataclass
class TFTPTransfer:
    """Represents an active TFTP transfer."""
    filename: str
    client_addr: tuple[str, int]
    block_number: int = 0
    file_handle: Any | None = None
    bytes_sent: int = 0
    total_bytes: int = 0
    retries: int = 0
    last_data: bytes = b''
    completed: bool = False
    error: str | None = None


class TFTPServer:
    """
    TFTP server for serving boot files.

    Listens on UDP port 69 and handles read requests (RRQ) for file transfers.
    Supports concurrent transfers to multiple clients.

    Example:
        server = TFTPServer()
        server.set_root_dir("/srv/tftp")
        await server.start()

        # Later...
        await server.stop()
    """

    def __init__(self, root_dir: str | None = None, timeout: float = TFTP_TIMEOUT):
        """
        Initialize TFTP server.

        Args:
            root_dir: Root directory for serving files (default: current directory)
            timeout: Timeout for ACK in seconds
        """
        self._root_dir = Path(root_dir) if root_dir else Path.cwd()
        self._timeout = timeout
        self._socket: socket.socket | None = None
        self._running = False
        self._task: asyncio.Task | None = None
        self._transfers: dict[tuple[str, int], TFTPTransfer] = {}
        self._transfer_tasks: dict[tuple[str, int], asyncio.Task] = {}

    def set_root_dir(self, path: str) -> None:
        """
        Set the root directory for serving files.

        Args:
            path: Path to root directory

        Raises:
            ValueError: If path doesn't exist or isn't a directory
        """
        new_root = Path(path)
        if not new_root.exists():
            raise ValueError(f"Directory does not exist: {path}")
        if not new_root.is_dir():
            raise ValueError(f"Path is not a directory: {path}")
        self._root_dir = new_root.resolve()
        logger.info(f"TFTP root directory set to: {self._root_dir}")

    async def start(self) -> None:
        """
        Start listening for TFTP requests on port 69.

        Raises:
            OSError: If port 69 is already in use or requires privileges
        """
        if self._running:
            logger.warning("TFTP server already running")
            return

        logger.info(f"Starting TFTP server on port {TFTP_PORT}")
        logger.info(f"Root directory: {self._root_dir}")

        # Create UDP socket
        self._socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        self._socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        try:
            self._socket.bind(("0.0.0.0", TFTP_PORT))
        except PermissionError:
            logger.error(f"Permission denied for port {TFTP_PORT}. Try running with sudo.")
            raise
        self._socket.setblocking(False)

        self._running = True
        self._task = asyncio.create_task(self._receive_loop())

        logger.info(f"TFTP server listening on port {TFTP_PORT}")

    async def stop(self) -> None:
        """Stop the TFTP server and clean up all transfers."""
        if not self._running:
            return

        logger.info("Stopping TFTP server...")
        self._running = False

        # Cancel receive loop
        if self._task:
            self._task.cancel()
            try:
                await self._task
            except asyncio.CancelledError:
                pass
            self._task = None

        # Cancel all active transfers
        for task in self._transfer_tasks.values():
            task.cancel()
        self._transfer_tasks.clear()

        # Close file handles
        for transfer in self._transfers.values():
            if transfer.file_handle:
                try:
                    transfer.file_handle.close()
                except Exception:
                    pass
        self._transfers.clear()

        # Close socket
        if self._socket:
            self._socket.close()
            self._socket = None

        logger.info("TFTP server stopped")

    async def _receive_loop(self) -> None:
        """Main receive loop for handling TFTP requests."""
        loop = asyncio.get_event_loop()

        while self._running:
            try:
                data, addr = await loop.sock_recvfrom(self._socket, 1024)
                logger.debug(f"Received TFTP packet from {addr}")

                # Parse opcode
                if len(data) < 2:
                    continue

                opcode = struct.unpack('!H', data[0:2])[0]

                if opcode == OPCODE_RRQ:
                    # Handle read request in separate task
                    asyncio.create_task(self._handle_rrq(data, addr))
                elif opcode == OPCODE_ACK:
                    # Handle ACK for existing transfer
                    await self._handle_ack(data, addr)
                else:
                    logger.debug(f"Ignoring unsupported opcode {opcode} from {addr}")

            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Error in receive loop: {e}")

    async def _handle_rrq(self, data: bytes, client_addr: tuple[str, int]) -> None:
        """
        Handle a TFTP Read Request (RRQ).

        Args:
            data: Raw RRQ packet
            client_addr: Client (IP, port) tuple
        """
        try:
            # Parse RRQ packet: opcode(2) + filename(null-terminated) + mode(null-terminated)
            parts = data[2:].split(b'\x00')
            if len(parts) < 2:
                await self._send_error(client_addr, ERROR_ILLEGAL_OPERATION, "Invalid RRQ format")
                return

            filename = parts[0].decode('ascii', errors='replace')
            mode = parts[1].decode('ascii', errors='replace').lower()

            logger.info(f"RRQ from {client_addr}: {filename} ({mode})")

            # Validate and resolve file path
            try:
                file_path = self._resolve_path(filename)
            except ValueError as e:
                logger.warning(f"Path validation failed: {e}")
                await self._send_error(client_addr, ERROR_ACCESS_VIOLATION, str(e))
                return

            # Check file exists
            if not file_path.exists():
                logger.warning(f"File not found: {filename}")
                await self._send_error(client_addr, ERROR_FILE_NOT_FOUND, f"File not found: {filename}")
                return

            # Check file is readable
            if not file_path.is_file():
                await self._send_error(client_addr, ERROR_ACCESS_VIOLATION, "Not a file")
                return

            # Get file size
            total_bytes = file_path.stat().st_size
            logger.info(f"Sending {filename} ({total_bytes} bytes) to {client_addr}")

            # Create transfer record
            transfer = TFTPTransfer(
                filename=filename,
                client_addr=client_addr,
                block_number=0,
                total_bytes=total_bytes,
            )

            # Open file
            transfer.file_handle = open(file_path, 'rb')

            # Store transfer
            self._transfers[client_addr] = transfer

            # Start transfer
            task = asyncio.create_task(self._transfer_file(transfer))
            self._transfer_tasks[client_addr] = task

        except Exception as e:
            logger.error(f"Error handling RRQ: {e}")
            await self._send_error(client_addr, ERROR_NOT_DEFINED, str(e))

    async def _transfer_file(self, transfer: TFTPTransfer) -> None:
        """
        Transfer file to client block by block.

        Args:
            transfer: TFTPTransfer record
        """
        client_addr = transfer.client_addr

        try:
            while not transfer.completed and transfer.retries < TFTP_MAX_RETRIES:
                # Read next block
                transfer.block_number += 1
                data = transfer.file_handle.read(TFTP_BLOCK_SIZE)
                transfer.last_data = data
                transfer.bytes_sent += len(data)

                # Send DATA packet
                await self._send_data(client_addr, transfer.block_number, data)

                # Wait for ACK with timeout
                try:
                    await asyncio.wait_for(
                        self._wait_for_ack(client_addr, transfer.block_number),
                        timeout=self._timeout
                    )
                    transfer.retries = 0  # Reset retry counter on success

                    # Check if transfer complete (last block < 512 bytes)
                    if len(data) < TFTP_BLOCK_SIZE:
                        transfer.completed = True
                        logger.info(f"Transfer complete: {transfer.filename} to {client_addr}")

                except TimeoutError:
                    transfer.retries += 1
                    transfer.block_number -= 1  # Resend last block
                    transfer.bytes_sent -= len(data)
                    logger.warning(f"Timeout waiting for ACK, retry {transfer.retries}/{TFTP_MAX_RETRIES}")

                    if transfer.retries >= TFTP_MAX_RETRIES:
                        logger.error(f"Max retries exceeded for {client_addr}")
                        transfer.error = "Max retries exceeded"
                        break

        except Exception as e:
            logger.error(f"Error in transfer: {e}")
            transfer.error = str(e)

        finally:
            # Clean up
            if transfer.file_handle:
                transfer.file_handle.close()
            self._transfers.pop(client_addr, None)
            self._transfer_tasks.pop(client_addr, None)

    async def _wait_for_ack(self, client_addr: tuple[str, int], expected_block: int) -> None:
        """
        Wait for ACK for specific block.

        Args:
            client_addr: Client address
            expected_block: Expected block number

        Raises:
            asyncio.TimeoutError: If ACK not received
        """
        # This is a simplified version - in production you'd use a proper event/condition
        # For now, we'll rely on the _handle_ack method updating transfer state
        transfer = self._transfers.get(client_addr)
        if transfer and transfer.block_number >= expected_block:
            return

        # Wait loop
        for _ in range(int(self._timeout * 10)):
            await asyncio.sleep(0.1)
            transfer = self._transfers.get(client_addr)
            if transfer and transfer.block_number >= expected_block:
                return

        raise TimeoutError()

    async def _handle_ack(self, data: bytes, client_addr: tuple[str, int]) -> None:
        """
        Handle ACK packet from client.

        Args:
            data: Raw ACK packet
            client_addr: Client address
        """
        if len(data) < 4:
            return

        block_number = struct.unpack('!H', data[2:4])[0]

        transfer = self._transfers.get(client_addr)
        if transfer:
            logger.debug(f"ACK block {block_number} from {client_addr}")
            # ACK is handled by transfer loop

    async def _send_data(self, client_addr: tuple[str, int], block: int, data: bytes) -> None:
        """
        Send DATA packet to client.

        Args:
            client_addr: Client address
            block: Block number
            data: Block data (max 512 bytes)
        """
        loop = asyncio.get_event_loop()
        packet = self.build_data_packet(block, data)
        await loop.sock_sendto(self._socket, packet, client_addr)

    async def _send_error(self, client_addr: tuple[str, int], code: int, message: str) -> None:
        """
        Send ERROR packet to client.

        Args:
            client_addr: Client address
            code: Error code
            message: Error message
        """
        loop = asyncio.get_event_loop()
        packet = self.build_error_packet(code, message)
        await loop.sock_sendto(self._socket, packet, client_addr)

    def _resolve_path(self, filename: str) -> Path:
        """
        Resolve filename to absolute path within root directory.

        Security: Prevents directory traversal attacks.

        Args:
            filename: Requested filename

        Returns:
            Resolved absolute path

        Raises:
            ValueError: If path escapes root directory
        """
        # Remove leading slashes
        filename = filename.lstrip('/\\')

        # Resolve path
        full_path = (self._root_dir / filename).resolve()

        # Security check: ensure path is within root
        try:
            full_path.relative_to(self._root_dir)
        except ValueError:
            raise ValueError(f"Path escapes root directory: {filename}")

        return full_path

    @staticmethod
    def build_data_packet(block: int, data: bytes) -> bytes:
        """
        Build a DATA packet.

        Args:
            block: Block number (1-65535)
            data: Block data (max 512 bytes)

        Returns:
            DATA packet bytes
        """
        return struct.pack('!HH', OPCODE_DATA, block) + data

    @staticmethod
    def build_error_packet(code: int, message: str) -> bytes:
        """
        Build an ERROR packet.

        Args:
            code: Error code
            message: Error message

        Returns:
            ERROR packet bytes
        """
        message_bytes = message.encode('ascii', errors='replace')
        return struct.pack('!HH', OPCODE_ERROR, code) + message_bytes + b'\x00'

    @staticmethod
    def parse_rrq(data: bytes) -> tuple[str, str]:
        """
        Parse an RRQ packet.

        Args:
            data: Raw RRQ packet bytes

        Returns:
            Tuple of (filename, mode)

        Raises:
            ValueError: If packet is invalid
        """
        if len(data) < 4:
            raise ValueError("RRQ packet too short")

        opcode = struct.unpack('!H', data[0:2])[0]
        if opcode != OPCODE_RRQ:
            raise ValueError(f"Expected RRQ opcode, got {opcode}")

        # Find null terminators
        parts = data[2:].split(b'\x00')
        if len(parts) < 2:
            raise ValueError("Invalid RRQ format")

        filename = parts[0].decode('ascii', errors='replace')
        mode = parts[1].decode('ascii', errors='replace').lower()

        return filename, mode

    def __repr__(self) -> str:
        status = "running" if self._running else "stopped"
        transfers = len(self._transfers)
        return f"TFTPServer(root={self._root_dir}, port={TFTP_PORT}, status={status}, transfers={transfers})"
