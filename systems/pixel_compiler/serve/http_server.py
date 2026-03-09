"""
HTTP Boot Server for PXE Boot

Implements an HTTP/1.1 server for serving boot files (kernel, initrd, iPXE scripts)
with byte-range support for faster transfers than TFTP and partial/resumable downloads.

Key Features:
    - Async-compatible design using asyncio
    - HTTP/1.1 GET and HEAD request handling
    - Byte-range request support (206 Partial Content)
    - Path traversal protection
    - Content-Type detection for boot files
    - Keep-alive connection support
    - Concurrent client handling

HTTP/1.1 Features:
    - GET requests for file transfer
    - HEAD requests for metadata only
    - Range header for partial content
    - Accept-Ranges: bytes header

Usage:
    server = HTTPBootServer()
    server.set_root_dir("/srv/boot")
    await server.start()

    # ... serving ...

    await server.stop()
"""

import asyncio
import os
import logging
from dataclasses import dataclass
from typing import Optional, Tuple, List, Any
from pathlib import Path
from urllib.parse import unquote

logger = logging.getLogger(__name__)


# HTTP Constants
HTTP_PORT = 8080  # Default HTTP boot port
HTTP_BUFFER_SIZE = 8192  # Buffer size for file reading
HTTP_MAX_HEADER_SIZE = 65536  # Maximum header size (64KB)


@dataclass
class HTTPConfig:
    """Configuration for HTTP boot server."""
    host: str = "0.0.0.0"
    port: int = HTTP_PORT
    root_dir: str = ""  # Directory containing boot files


class HTTPBootServer:
    """
    HTTP/1.1 server for serving boot files with byte-range support.

    Listens on TCP port (default 8080) and handles GET/HEAD requests for file transfers.
    Supports concurrent connections and byte-range requests.

    Example:
        server = HTTPBootServer()
        server.set_root_dir("/srv/boot")
        await server.start()

        # Later...
        await server.stop()
    """

    def __init__(self, config: Optional[HTTPConfig] = None):
        """
        Initialize HTTP boot server.

        Args:
            config: Optional HTTPConfig with server settings
        """
        self._config = config or HTTPConfig()
        self._root_dir = Path(self._config.root_dir) if self._config.root_dir else Path.cwd()
        self._server: Optional[asyncio.Server] = None
        self._running = False
        self._active_connections: int = 0
        self._custom_handlers: List[Tuple[str, Any]] = []

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
        logger.info(f"HTTP root directory set to: {self._root_dir}")

    def register_handler(self, path_prefix: str, handler: Any) -> None:
        """
        Register a custom handler for paths matching a prefix.

        Custom handlers are checked before static file serving, allowing
        dynamic endpoints to override file paths.

        Args:
            path_prefix: URL prefix to match (e.g., '/delta/')
            handler: Handler object with async handle(path, headers, writer) -> bool method

        The handler interface:
            - handler.handle(path: str, headers: dict, writer: StreamWriter) -> bool
            - Returns True if request was handled, False to fall through to static files
        """
        self._custom_handlers.append((path_prefix, handler))
        logger.info(f"Registered custom handler for {path_prefix}")

    async def start(self) -> None:
        """
        Start listening for HTTP requests.

        Raises:
            OSError: If port is already in use
        """
        if self._running:
            logger.warning("HTTP server already running")
            return

        logger.info(f"Starting HTTP server on {self._config.host}:{self._config.port}")
        logger.info(f"Root directory: {self._root_dir}")

        try:
            self._server = await asyncio.start_server(
                self._handle_client,
                self._config.host,
                self._config.port
            )
        except PermissionError:
            logger.error(f"Permission denied for port {self._config.port}")
            raise
        except OSError as e:
            logger.error(f"Failed to start HTTP server: {e}")
            raise

        self._running = True

        addrs = ', '.join(str(sock.getsockname()) for sock in self._server.sockets)
        logger.info(f"HTTP server listening on {addrs}")

    async def stop(self) -> None:
        """Stop the HTTP server and close all connections."""
        if not self._running:
            return

        logger.info("Stopping HTTP server...")
        self._running = False

        if self._server:
            self._server.close()
            await self._server.wait_closed()
            self._server = None

        logger.info("HTTP server stopped")

    async def _handle_client(self, reader: asyncio.StreamReader, writer: asyncio.StreamWriter) -> None:
        """
        Handle individual HTTP client connection.

        Args:
            reader: Stream reader for client data
            writer: Stream writer for response data
        """
        client_addr = writer.get_extra_info('peername')
        self._active_connections += 1
        logger.debug(f"Client connected: {client_addr} (active: {self._active_connections})")

        try:
            keep_alive = True
            while keep_alive and self._running:
                # Read HTTP request
                request_data = await self._read_request(reader)
                if not request_data:
                    break

                # Parse request
                method, path, headers = self._parse_request(request_data)
                if not method:
                    break

                logger.info(f"{client_addr} - {method} {path}")

                # Check for keep-alive
                connection = headers.get('Connection', '').lower()
                keep_alive = connection == 'keep-alive'

                # Handle request
                if method == 'GET':
                    await self._handle_get(path, headers, writer)
                elif method == 'HEAD':
                    await self._handle_head(path, headers, writer)
                else:
                    await self._send_error(writer, 405, "Method Not Allowed")

                await writer.drain()

        except asyncio.CancelledError:
            pass
        except Exception as e:
            logger.error(f"Error handling client {client_addr}: {e}")
        finally:
            self._active_connections -= 1
            logger.debug(f"Client disconnected: {client_addr} (active: {self._active_connections})")
            try:
                writer.close()
                await writer.wait_closed()
            except Exception:
                pass

    async def _read_request(self, reader: asyncio.StreamReader) -> bytes:
        """
        Read HTTP request from client.

        Args:
            reader: Stream reader

        Returns:
            Raw request bytes or empty bytes if connection closed
        """
        request_lines: List[bytes] = []
        total_size = 0

        while True:
            try:
                line = await asyncio.wait_for(reader.readline(), timeout=30.0)
            except asyncio.TimeoutError:
                return b''

            if not line:
                return b''

            total_size += len(line)
            if total_size > HTTP_MAX_HEADER_SIZE:
                return b''

            request_lines.append(line)

            # End of headers
            if line == b'\r\n' or line == b'\n':
                break

        return b''.join(request_lines)

    def _parse_request(self, request_data: bytes) -> Tuple[Optional[str], str, dict]:
        """
        Parse HTTP request.

        Args:
            request_data: Raw request bytes

        Returns:
            Tuple of (method, path, headers)
        """
        try:
            lines = request_data.decode('utf-8', errors='replace').split('\r\n')
            if not lines:
                return None, '', {}

            # Parse request line
            request_line = lines[0].split(' ')
            if len(request_line) < 2:
                return None, '', {}

            method = request_line[0]
            path = unquote(request_line[1])

            # Parse headers
            headers = {}
            for line in lines[1:]:
                if ':' in line:
                    key, value = line.split(':', 1)
                    headers[key.strip()] = value.strip()

            return method, path, headers

        except Exception as e:
            logger.error(f"Error parsing request: {e}")
            return None, '', {}

    async def _handle_get(self, path: str, headers: dict, writer: asyncio.StreamWriter) -> None:
        """
        Handle GET request.

        Args:
            path: Requested path
            headers: Request headers
            writer: Stream writer for response
        """
        # Check custom handlers first
        for prefix, handler in self._custom_handlers:
            if path.startswith(prefix):
                handled = await handler.handle(path, headers, writer)
                if handled:
                    return

        # Fall through to static file serving
        try:
            file_path = self._resolve_path(path)
        except ValueError as e:
            logger.warning(f"Path validation failed: {e}")
            await self._send_error(writer, 400, "Bad Request")
            return

        # Check file exists
        if not file_path.exists():
            logger.warning(f"File not found: {path}")
            await self._send_error(writer, 404, "Not Found")
            return

        if not file_path.is_file():
            await self._send_error(writer, 403, "Forbidden")
            return

        # Get file info
        file_size = file_path.stat().st_size
        content_type = self._get_content_type(file_path)

        # Check for range request
        range_header = headers.get('Range', '')
        if range_header:
            await self._send_partial_content(writer, file_path, range_header, file_size, content_type)
        else:
            await self._send_full_content(writer, file_path, file_size, content_type)

    async def _handle_head(self, path: str, headers: dict, writer: asyncio.StreamWriter) -> None:
        """
        Handle HEAD request (headers only, no body).

        Args:
            path: Requested path
            headers: Request headers
            writer: Stream writer for response
        """
        # Resolve file path
        try:
            file_path = self._resolve_path(path)
        except ValueError as e:
            logger.warning(f"Path validation failed: {e}")
            await self._send_error(writer, 400, "Bad Request", body_only_headers=True)
            return

        # Check file exists
        if not file_path.exists():
            await self._send_error(writer, 404, "Not Found", body_only_headers=True)
            return

        if not file_path.is_file():
            await self._send_error(writer, 403, "Forbidden", body_only_headers=True)
            return

        # Get file info
        file_size = file_path.stat().st_size
        content_type = self._get_content_type(file_path)

        # Send headers only
        response = (
            f"HTTP/1.1 200 OK\r\n"
            f"Content-Type: {content_type}\r\n"
            f"Content-Length: {file_size}\r\n"
            f"Accept-Ranges: bytes\r\n"
            f"\r\n"
        )
        writer.write(response.encode('utf-8'))

    async def _send_full_content(self, writer: asyncio.StreamWriter, file_path: Path,
                                  file_size: int, content_type: str) -> None:
        """
        Send full file content (200 OK).

        Args:
            writer: Stream writer
            file_path: Path to file
            file_size: File size in bytes
            content_type: Content-Type header value
        """
        # Send headers
        response = (
            f"HTTP/1.1 200 OK\r\n"
            f"Content-Type: {content_type}\r\n"
            f"Content-Length: {file_size}\r\n"
            f"Accept-Ranges: bytes\r\n"
            f"\r\n"
        )
        writer.write(response.encode('utf-8'))

        # Send file content in chunks
        with open(file_path, 'rb') as f:
            while True:
                chunk = f.read(HTTP_BUFFER_SIZE)
                if not chunk:
                    break
                writer.write(chunk)
                await writer.drain()

        logger.debug(f"Sent {file_size} bytes (200 OK)")

    async def _send_partial_content(self, writer: asyncio.StreamWriter, file_path: Path,
                                     range_header: str, file_size: int, content_type: str) -> None:
        """
        Send partial content (206 Partial Content).

        Args:
            writer: Stream writer
            file_path: Path to file
            range_header: Range header value
            file_size: File size in bytes
            content_type: Content-Type header value
        """
        # Parse range header
        try:
            start, end = self._parse_range_header(range_header, file_size)
        except ValueError:
            # Invalid range
            await self._send_error(writer, 416, "Range Not Satisfiable",
                                   extra_headers=[f"Content-Range: bytes */{file_size}"])
            return

        # Calculate content length
        content_length = end - start + 1

        # Send headers
        response = (
            f"HTTP/1.1 206 Partial Content\r\n"
            f"Content-Type: {content_type}\r\n"
            f"Content-Length: {content_length}\r\n"
            f"Content-Range: bytes {start}-{end}/{file_size}\r\n"
            f"Accept-Ranges: bytes\r\n"
            f"\r\n"
        )
        writer.write(response.encode('utf-8'))

        # Send file content from start to end
        with open(file_path, 'rb') as f:
            f.seek(start)
            remaining = content_length
            while remaining > 0:
                chunk_size = min(HTTP_BUFFER_SIZE, remaining)
                chunk = f.read(chunk_size)
                if not chunk:
                    break
                writer.write(chunk)
                await writer.drain()
                remaining -= len(chunk)

        logger.debug(f"Sent bytes {start}-{end}/{file_size} (206 Partial Content)")

    def _parse_range_header(self, range_header: str, file_size: int) -> Tuple[int, int]:
        """
        Parse Range header and return start/end positions.

        Args:
            range_header: Range header value (e.g., "bytes=0-1023")
            file_size: Total file size

        Returns:
            Tuple of (start, end) byte positions (inclusive)

        Raises:
            ValueError: If range is invalid or unsatisfiable
        """
        # Must start with "bytes="
        if not range_header.startswith('bytes='):
            raise ValueError("Invalid range unit")

        range_spec = range_header[6:]  # Remove "bytes="

        # Handle multiple ranges - for simplicity, just use first range
        if ',' in range_spec:
            range_spec = range_spec.split(',')[0].strip()

        # Parse range
        if range_spec.startswith('-'):
            # Suffix range: -500 means last 500 bytes
            suffix_length = int(range_spec[1:])
            if suffix_length <= 0:
                raise ValueError("Invalid suffix range")
            start = max(0, file_size - suffix_length)
            end = file_size - 1
        elif range_spec.endswith('-'):
            # Open-ended range: 500- means from 500 to end
            start = int(range_spec[:-1])
            if start >= file_size:
                raise ValueError("Range start beyond file size")
            end = file_size - 1
        else:
            # Normal range: 500-999
            parts = range_spec.split('-')
            if len(parts) != 2:
                raise ValueError("Invalid range format")
            start = int(parts[0])
            end = int(parts[1])

            if start > end:
                raise ValueError("Range start > end")
            if start >= file_size:
                raise ValueError("Range start beyond file size")

        # Clamp end to file size
        end = min(end, file_size - 1)

        return start, end

    def _resolve_path(self, path: str) -> Path:
        """
        Resolve URL path to file path within root directory.

        Security: Prevents directory traversal attacks.

        Args:
            path: URL path

        Returns:
            Resolved absolute path

        Raises:
            ValueError: If path escapes root directory
        """
        # Remove query string
        if '?' in path:
            path = path.split('?')[0]

        # Remove fragment
        if '#' in path:
            path = path.split('#')[0]

        # Remove leading slashes
        path = path.lstrip('/')

        # Reject path traversal attempts
        if '..' in path:
            raise ValueError("Path traversal detected")

        # Reject encoded path traversal
        if '..' in unquote(path):
            raise ValueError("Encoded path traversal detected")

        # Resolve path
        full_path = (self._root_dir / path).resolve()

        # Security check: ensure path is within root
        try:
            full_path.relative_to(self._root_dir)
        except ValueError:
            raise ValueError(f"Path escapes root directory: {path}")

        return full_path

    def _get_content_type(self, file_path: Path) -> str:
        """
        Get Content-Type for file based on extension.

        Args:
            file_path: Path to file

        Returns:
            Content-Type string
        """
        suffix = file_path.suffix.lower()

        # Boot file content types
        content_types = {
            '.ipxe': 'text/plain; charset=utf-8',
            '.cfg': 'text/plain; charset=utf-8',
            '.conf': 'text/plain; charset=utf-8',
            '.txt': 'text/plain; charset=utf-8',
            '.html': 'text/html; charset=utf-8',
            '.htm': 'text/html; charset=utf-8',
            '.css': 'text/css; charset=utf-8',
            '.js': 'application/javascript',
            '.json': 'application/json',
            '.xml': 'application/xml',
        }

        return content_types.get(suffix, 'application/octet-stream')

    async def _send_error(self, writer: asyncio.StreamWriter, code: int, message: str,
                          extra_headers: Optional[List[str]] = None,
                          body_only_headers: bool = False) -> None:
        """
        Send HTTP error response.

        Args:
            writer: Stream writer
            code: HTTP status code
            message: Status message
            extra_headers: Additional headers to include
            body_only_headers: If True, only send headers (for HEAD requests)
        """
        body = f"{code} {message}".encode('utf-8')

        headers = [
            f"HTTP/1.1 {code} {message}",
            f"Content-Type: text/plain; charset=utf-8",
            f"Content-Length: {len(body)}",
        ]

        if extra_headers:
            headers.extend(extra_headers)

        headers.append("")
        headers.append("")

        response = "\r\n".join(headers)
        writer.write(response.encode('utf-8'))

        if not body_only_headers:
            writer.write(body)

    def __repr__(self) -> str:
        status = "running" if self._running else "stopped"
        return (f"HTTPBootServer(host={self._config.host}, port={self._config.port}, "
                f"root={self._root_dir}, status={status}, connections={self._active_connections})")
