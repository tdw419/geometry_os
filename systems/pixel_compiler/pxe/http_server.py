"""
Async HTTP Server for PXE Container Serving.

Provides HTTP server functionality for iPXE clients to download
OS container files (.rts.png) after bootloader loads.

Usage:
    python -m systems.pixel_compiler.pxe.http_server -r /var/containers

Or programmatically:
    from systems.pixel_compiler.pxe import HTTPServer, HTTPServerConfig

    config = HTTPServerConfig(root_dir="/var/containers")
    server = HTTPServer(config)
    asyncio.run(server.serve_forever())
"""

import argparse
import asyncio
import logging
import os
from dataclasses import dataclass
from typing import Optional

from aiohttp import web

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)
logger = logging.getLogger(__name__)


# =============================================================================
# HTTP Server Configuration
# =============================================================================

@dataclass
class HTTPServerConfig:
    """Configuration for HTTP server."""
    interface: str = "0.0.0.0"       # Interface to bind
    listen_port: int = 8080          # HTTP server port
    root_dir: str = "/tftpboot"      # Directory containing container files
    max_file_size: int = 0           # Max file size (0 = unlimited)
    enable_range_requests: bool = True  # Support range requests for large files


# =============================================================================
# HTTP Server
# =============================================================================

class HTTPServer:
    """Async HTTP server for serving .rts.png containers to iPXE clients."""

    def __init__(self, config: HTTPServerConfig):
        self.config = config
        self._app: Optional[web.Application] = None
        self._runner: Optional[web.AppRunner] = None
        self._site: Optional[web.TCPSite] = None
        self._status_task: Optional[asyncio.Task] = None

    async def start(self):
        """Start HTTP server on configured port."""
        self._app = web.Application()
        self._app.router.add_get('/', self._handle_index)
        self._app.router.add_get('/{filename}', self._handle_file)

        self._runner = web.AppRunner(self._app)
        await self._runner.setup()

        self._site = web.TCPSite(
            self._runner,
            self.config.interface,
            self.config.listen_port
        )
        await self._site.start()

        logger.info(f"[HTTP] Server started on {self.config.interface}:{self.config.listen_port}")
        logger.info(f"[HTTP] Root directory: {self.config.root_dir}")

    async def stop(self):
        """Stop HTTP server gracefully."""
        if self._status_task and not self._status_task.done():
            self._status_task.cancel()

        if self._runner:
            await self._runner.cleanup()
            logger.info("[HTTP] Server stopped")

    async def serve_forever(self):
        """Start and run with periodic status logging."""
        await self.start()

        async def log_status():
            while True:
                await asyncio.sleep(300)
                logger.info(f"[HTTP] Status: Server running on port {self.config.listen_port}")

        self._status_task = asyncio.create_task(log_status())

        try:
            await asyncio.Future()
        except asyncio.CancelledError:
            pass
        finally:
            await self.stop()

    # =========================================================================
    # Request Handlers
    # =========================================================================

    async def _handle_index(self, request: web.Request) -> web.Response:
        """Handle GET / to list available containers."""
        try:
            files = []
            for f in os.listdir(self.config.root_dir):
                if f.endswith('.rts.png'):
                    filepath = os.path.join(self.config.root_dir, f)
                    stat = os.stat(filepath)
                    files.append({
                        'name': f,
                        'size': stat.st_size,
                        'url': f'/{f}'
                    })

            return web.json_response({
                'containers': files,
                'count': len(files)
            })
        except PermissionError:
            raise web.HTTPForbidden(text="Permission denied")
        except FileNotFoundError:
            raise web.HTTPNotFound(text="Root directory not found")

    async def _handle_file(self, request: web.Request) -> web.StreamResponse:
        """Handle GET /{filename} to serve container files."""
        filename = request.match_info.get('filename', '')

        # Security: sanitize filename
        if not self._is_safe_filename(filename):
            logger.warning(f"[HTTP] Rejected unsafe filename: {filename}")
            raise web.HTTPBadRequest(text="Invalid filename")

        # Only serve .rts.png files
        if not filename.endswith('.rts.png'):
            raise web.HTTPNotFound(text="File not found")

        filepath = os.path.join(self.config.root_dir, filename)

        # Check file exists
        if not os.path.isfile(filepath):
            logger.warning(f"[HTTP] File not found: {filename}")
            raise web.HTTPNotFound(text="File not found")

        file_size = os.path.getsize(filepath)
        client_ip = request.remote or "unknown"

        # Handle range request for large files
        range_header = request.headers.get('Range')

        if range_header and self.config.enable_range_requests:
            return await self._serve_range(request, filepath, file_size, range_header, client_ip)
        else:
            return await self._serve_full(request, filepath, file_size, client_ip)

    # =========================================================================
    # File Serving Helpers
    # =========================================================================

    async def _serve_full(self, request: web.Request, filepath: str,
                          file_size: int, client_ip: str) -> web.FileResponse:
        """Serve complete file with Content-Length header."""
        logger.info(f"[HTTP] GET {filepath} ({file_size} bytes) from {client_ip}")

        response = web.FileResponse(filepath)
        response.headers['Content-Length'] = str(file_size)
        response.headers['Accept-Ranges'] = 'bytes'
        return response

    async def _serve_range(self, request: web.Request, filepath: str,
                           file_size: int, range_header: str,
                           client_ip: str) -> web.StreamResponse:
        """Serve partial content for range requests (HTTP 206)."""
        # Parse Range header (format: "bytes=start-end" or "bytes=start-")
        try:
            if not range_header.startswith('bytes='):
                raise ValueError("Invalid range unit")

            range_spec = range_header[6:]  # Remove "bytes="
            parts = range_spec.split('-')

            if len(parts) != 2:
                raise ValueError("Invalid range format")

            start = int(parts[0]) if parts[0] else 0
            end = int(parts[1]) if parts[1] else file_size - 1

            # Validate range
            if start < 0 or end >= file_size or start > end:
                raise ValueError("Range not satisfiable")

        except (ValueError, IndexError) as e:
            # Return 416 Range Not Satisfiable with valid range
            logger.warning(f"[HTTP] Invalid range request from {client_ip}: {range_header}")
            response = web.Response(status=416)
            response.headers['Content-Range'] = f'bytes */{file_size}'
            return response

        content_length = end - start + 1

        logger.info(
            f"[HTTP] GET {filepath} bytes {start}-{end}/{file_size} "
            f"({content_length} bytes) from {client_ip}"
        )

        # Build response
        response = web.StreamResponse(
            status=206,
            headers={
                'Content-Type': 'application/octet-stream',
                'Content-Length': str(content_length),
                'Content-Range': f'bytes {start}-{end}/{file_size}',
                'Accept-Ranges': 'bytes',
            }
        )
        await response.prepare(request)

        # Stream file content
        with open(filepath, 'rb') as f:
            f.seek(start)
            remaining = content_length
            chunk_size = 65536  # 64KB chunks

            while remaining > 0:
                read_size = min(chunk_size, remaining)
                data = f.read(read_size)
                if not data:
                    break
                await response.write(data)
                remaining -= len(data)

        return response

    # =========================================================================
    # Security Helpers
    # =========================================================================

    def _is_safe_filename(self, filename: str) -> bool:
        """Check if filename is safe (no path traversal)."""
        # Reject path traversal attempts
        if '..' in filename or filename.startswith('/'):
            return False

        # Reject hidden files
        if filename.startswith('.'):
            return False

        # Reject absolute paths
        if os.path.isabs(filename):
            return False

        # Only allow basenames
        if os.path.dirname(filename):
            return False

        return True


# =============================================================================
# CLI Entry Point
# =============================================================================

def create_argument_parser() -> argparse.ArgumentParser:
    """Create CLI argument parser."""
    parser = argparse.ArgumentParser(
        description='Async HTTP Server for PXE Container Serving',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Start HTTP server on default port 8080
  python -m systems.pixel_compiler.pxe.http_server -r /var/containers

  # Start on custom port with verbose logging
  python -m systems.pixel_compiler.pxe.http_server -p 3000 -r /var/containers -v
"""
    )

    parser.add_argument('--interface', '-i', default='0.0.0.0',
                       help='Interface to bind (default: 0.0.0.0)')
    parser.add_argument('--port', '-p', type=int, default=8080,
                       help='HTTP port (default: 8080)')
    parser.add_argument('--root-dir', '-r', default='/tftpboot',
                       help='Root directory for container files')
    parser.add_argument('--no-range', action='store_true',
                       help='Disable range request support')
    parser.add_argument('--verbose', '-v', action='store_true',
                       help='Enable debug logging')

    return parser


async def main():
    """Main entry point."""
    parser = create_argument_parser()
    args = parser.parse_args()

    if args.verbose:
        logging.getLogger().setLevel(logging.DEBUG)

    config = HTTPServerConfig(
        interface=args.interface,
        listen_port=args.port,
        root_dir=args.root_dir,
        enable_range_requests=not args.no_range,
    )

    server = HTTPServer(config)

    try:
        await server.serve_forever()
    except KeyboardInterrupt:
        logger.info("[HTTP] Shutdown requested")
    except Exception as e:
        logger.error(f"[HTTP] Fatal error: {e}")
        raise


if __name__ == '__main__':
    asyncio.run(main())
