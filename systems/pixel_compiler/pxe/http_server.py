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
from dataclasses import dataclass, field
from typing import Optional, List, Dict, TYPE_CHECKING

from aiohttp import web

if TYPE_CHECKING:
    from systems.pixel_compiler.catalog.catalog_scanner import CatalogEntry


# =============================================================================
# PXE Container Info
# =============================================================================

@dataclass
class PXEContainerInfo:
    """Extended info for PXE-available containers."""
    entry_id: str
    entry: 'CatalogEntry'
    pxe_enabled: bool = True
    pxe_boot_order: int = 0  # Lower = higher priority in boot menu
    # Menu customization
    pxe_name: Optional[str] = None        # Custom display name (None = use entry.name)
    pxe_description: Optional[str] = None  # Custom description (None = use distro/arch)

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
    # Catalog integration
    watch_paths: Optional[List[str]] = None  # Directories to scan for containers
    use_vision: bool = False  # Vision analysis for catalog
    # Menu configuration
    default_entry: str = "local"     # Default boot entry ID or "local"
    menu_timeout: int = 10           # Auto-boot timeout in seconds (0 = no timeout)


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
        # Catalog integration
        self._catalog: Dict[str, 'CatalogEntry'] = {}  # entry_id -> CatalogEntry
        self._scanner = None  # CatalogScanner instance
        # PXE availability tracking
        self._pxe_containers: Dict[str, PXEContainerInfo] = {}

    async def start(self):
        """Start HTTP server on configured port."""
        # Initialize catalog scanner if watch_paths configured
        if self.config.watch_paths:
            try:
                from systems.pixel_compiler.catalog.catalog_scanner import CatalogScanner
                self._scanner = CatalogScanner(
                    watch_paths=self.config.watch_paths,
                    use_vision=self.config.use_vision
                )
                self._refresh_catalog()
                logger.info(f"[HTTP] Catalog initialized with {len(self._catalog)} entries")
            except ImportError:
                logger.warning("[HTTP] CatalogScanner not available, using file-based serving")

        self._app = web.Application()
        self._app.router.add_get('/', self._handle_index)
        self._app.router.add_get('/containers', self._handle_containers_list)
        self._app.router.add_get('/containers/{entry_id}', self._handle_container_by_id)
        self._app.router.add_get('/files/{filename}', self._handle_file)
        self._app.router.add_post('/catalog/refresh', self._handle_catalog_refresh)
        self._app.router.add_get('/pxe', self._handle_pxe_list)
        self._app.router.add_post('/pxe/{entry_id}/toggle', self._handle_pxe_toggle)
        self._app.router.add_post('/pxe/{entry_id}/menu', self._handle_pxe_menu_update)
            # iPXE boot script endpoints
        self._app.router.add_get('/pxe/boot.ipxe', self._handle_boot_script)
        self._app.router.add_get('/pxe/menu.ipxe', self._handle_menu_script)


        self._runner = web.AppRunner(self._app)

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
    # Catalog Methods
    # =========================================================================

    def _refresh_catalog(self) -> int:
        """Refresh catalog entries from filesystem preserving PXE customization."""
        if not self._scanner:
            return 0

        entries = self._scanner.scan()
        self._catalog = {entry.id: entry for entry in entries}

        # Preserve PXE settings including customization for existing entries
        old_pxe = self._pxe_containers.copy()
        self._pxe_containers = {}

        for entry in entries:
            if entry.id in old_pxe:
                # Preserve existing PXE settings including name and description
                self._pxe_containers[entry.id] = old_pxe[entry.id]
                self._pxe_containers[entry.id].entry = entry
            else:
                # New entry - enable PXE by default, name/description default to None
                self._pxe_containers[entry.id] = PXEContainerInfo(
                    entry_id=entry.id,
                    entry=entry,
                    pxe_enabled=True,
                    pxe_boot_order=len(self._pxe_containers),
                    pxe_name=None,
                    pxe_description=None,
                )

        logger.info(f"[HTTP] Refreshed catalog: {len(self._catalog)} entries")

        return len(self._catalog)        """Refresh catalog entries from filesystem."""
        if not self._scanner:
            return 0

        entries = self._scanner.scan()
        self._catalog = {entry.id: entry for entry in entries}

        # Preserve PXE settings for existing entries
        old_pxe = self._pxe_containers.copy()
        self._pxe_containers = {}

        for entry in entries:
            if entry.id in old_pxe:
                # Preserve existing PXE settings
                self._pxe_containers[entry.id] = old_pxe[entry.id]
                self._pxe_containers[entry.id].entry = entry
            else:
                # New entry - enable PXE by default
                self._pxe_containers[entry.id] = PXEContainerInfo(
                    entry_id=entry.id,
                    entry=entry,
                    pxe_enabled=True,
                    pxe_boot_order=len(self._pxe_containers)
                )

        logger.info(f"[HTTP] Refreshed catalog: {len(self._catalog)} entries")

        return len(self._catalog)

    def set_pxe_availability(self, entry_id: str, enabled: bool) -> bool:
        """Set PXE availability for a container."""
        if entry_id not in self._pxe_containers:
            return False

        self._pxe_containers[entry_id].pxe_enabled = enabled
        status = "enabled" if enabled else "disabled"
        logger.info(f"[HTTP] PXE {status} for container {entry_id}")
        return True

    def get_pxe_containers(self) -> List[PXEContainerInfo]:
        """Get list of PXE-enabled containers."""
        return [
            info for info in self._pxe_containers.values()
            if info.pxe_enabled
        ]

    # =========================================================================
    # Request Handlers
    # =========================================================================

    async def _handle_index(self, request: web.Request) -> web.Response:
        """Handle GET / to show server info and available endpoints."""
        return web.json_response({
            'server': 'PixelRTS PXE HTTP Server',
            'version': '1.0.0',
            'endpoints': {
                '/': 'This help',
                '/containers': 'List all available containers',
                '/containers/{id}': 'Download container by catalog ID',
                '/files/{filename}': 'Download file by name (fallback)',
                '/catalog/refresh': 'POST to rescan filesystem',
            },
            'catalog': {
                'enabled': bool(self._catalog),
                'count': len(self._catalog)
            },
            'config': {
                'port': self.config.listen_port,
                'root_dir': self.config.root_dir,
                'range_requests': self.config.enable_range_requests
            }
        })

    async def _handle_containers_list(self, request: web.Request) -> web.Response:
        """Handle GET /containers to list all available containers."""
        if not self._catalog:
            # Fall back to file-based listing
            try:
                files = []
                for f in os.listdir(self.config.root_dir):
                    if f.endswith('.rts.png'):
                        filepath = os.path.join(self.config.root_dir, f)
                        stat = os.stat(filepath)
                        files.append({
                            'id': f.replace('.rts.png', ''),
                            'name': f,
                            'size': stat.st_size,
                            'url': f'/files/{f}'
                        })

                return web.json_response({
                    'containers': files,
                    'count': len(files)
                })
            except PermissionError:
                raise web.HTTPForbidden(text="Permission denied")
            except FileNotFoundError:
                raise web.HTTPNotFound(text="Root directory not found")

        # Use catalog-based listing
        containers = []
        for entry in self._catalog.values():
            containers.append({
                'id': entry.id,
                'name': entry.name,
                'size': entry.size,
                'url': f'/containers/{entry.id}',
                'kernel_version': entry.kernel_version,
                'distro': entry.distro,
                'architecture': entry.architecture,
            })

        return web.json_response({
            'containers': containers,
            'count': len(containers)
        })

    async def _handle_container_by_id(self, request: web.Request) -> web.StreamResponse:
        """Handle GET /containers/{entry_id} to serve container by catalog ID."""
        entry_id = request.match_info.get('entry_id', '')

        # Look up entry in catalog
        entry = self._catalog.get(entry_id)
        if not entry:
            logger.warning(f"[HTTP] Container not found: {entry_id}")
            raise web.HTTPNotFound(text=f"Container not found: {entry_id}")

        # Serve the file
        return await self._serve_entry(request, entry)

    async def _handle_catalog_refresh(self, request: web.Request) -> web.Response:
        """Handle POST /catalog/refresh to rescan filesystem."""
        if not self._scanner:
            raise web.HTTPBadRequest(text="Catalog scanning not enabled")

        count = self._refresh_catalog()

        return web.json_response({
            'success': True,
            'count': count,
            'message': f'Refreshed catalog with {count} entries'
        })

    async def _handle_pxe_list(self, request: web.Request) -> web.Response:
        """Handle GET /pxe to list PXE-enabled containers with customization."""
        containers = []
        for info in self.get_pxe_containers():
            containers.append({
                'id': info.entry_id,
                'name': info.pxe_name or info.entry.name,
                'url': f'/containers/{info.entry_id}',
                'boot_order': info.pxe_boot_order,
                'size': info.entry.size,
                'pxe_name': info.pxe_name,
                'pxe_description': info.pxe_description,
            })

        return web.json_response({
            'pxe_containers': containers,
            'count': len(containers)
        })

    async def _handle_pxe_toggle(self, request: web.Request) -> web.Response:
        """Handle POST /pxe/{entry_id}/toggle to enable/disable PXE."""
        entry_id = request.match_info.get('entry_id', '')

        if entry_id not in self._pxe_containers:
            raise web.HTTPNotFound(text=f"Container not found: {entry_id}")

        # Parse request body
        try:
            data = await request.json()
            enabled = data.get('enabled', True)
        except Exception:
            enabled = True

        success = self.set_pxe_availability(entry_id, enabled)

        return web.json_response({
            'success': success,
            'entry_id': entry_id,
            'pxe_enabled': enabled
        })

    async def _handle_pxe_menu_update(self, request: web.Request) -> web.Response:
        """Handle POST /pxe/{entry_id}/menu to update menu customization."""
        entry_id = request.match_info.get('entry_id', '')

        if entry_id not in self._pxe_containers:
            raise web.HTTPNotFound(text=f"Container not found: {entry_id}")

        try:
            data = await request.json()
        except Exception:
            raise web.HTTPBadRequest(text="Invalid JSON body")

        info = self._pxe_containers[entry_id]

        # Update fields if provided
        if 'name' in data:
            info.pxe_name = data['name']
        if 'description' in data:
            info.pxe_description = data['description']
        if 'boot_order' in data:
            info.pxe_boot_order = int(data['boot_order'])

        logger.info(f"[HTTP] Updated menu entry for {entry_id}")

        return web.json_response({
            'success': True,
            'entry_id': entry_id,
            'name': info.pxe_name or info.entry.name,
            'description': info.pxe_description,
            'boot_order': info.pxe_boot_order
        })

    # =========================================================================
    # iPXE Boot Script Handlers
    # =========================================================================

    async def _handle_boot_script(self, request: web.Request) -> web.Response:
        """Handle GET /pxe/boot.ipxe to serve the iPXE boot script.

        This is the initial script iPXE loads after DHCP/TFTP boot.
        It chains to the dynamic menu script.
        """
        # Extract server address from request host
        host = request.host or f"{self.config.interface}:{self.config.listen_port}"

        # Generate boot script
        script = f"""#!ipxe
# PixelRTS PXE Boot Menu
chain http://{host}/pxe/menu.ipxe
"""

        logger.info(f"[HTTP] Serving boot script to {request.remote or 'unknown'}")

        return web.Response(
            text=script,
            content_type='text/plain',
            charset='utf-8'
        )

    async def _handle_menu_script(self, request: web.Request) -> web.Response:
        """Handle GET /pxe/menu.ipxe to serve dynamic iPXE menu script.

        Generates menu items from PXE-enabled containers with metadata
        (size, distro) displayed alongside container names.

        Uses menu configuration:
        - default_entry: Pre-selected boot option
        - menu_timeout: Auto-boot timeout in seconds (0 = no timeout)
        - pxe_name: Custom display name (overrides entry.name)
        - pxe_description: Custom description (overrides distro/arch display)
        """
        # Extract server address from request host
        host = request.host or f"{self.config.interface}:{self.config.listen_port}"

        # Get PXE-enabled containers sorted by boot order
        pxe_containers = sorted(
            self.get_pxe_containers(),
            key=lambda info: info.pxe_boot_order
        )

        # Build menu script
        lines = [
            "#!ipxe",
            "# PixelRTS Container Selection Menu",
            "",
            "# Set default selection",
            f"isset ${{menu-default}} || set menu-default {self.config.default_entry}",
            "",
            "menu PixelRTS Boot Menu",
            "item --key 0 local Boot from local disk",
            "",
        ]

        # Add container items with metadata
        for idx, info in enumerate(pxe_containers, start=1):
            entry = info.entry
            # Use custom name if set, otherwise entry name
            display_name = info.pxe_name if info.pxe_name else entry.name
            # Use custom description if set, otherwise generate from metadata
            if info.pxe_description:
                description = info.pxe_description
            else:
                # Calculate size in MB
                size_mb = entry.size // (1024 * 1024)
                # Get distro or "Unknown"
                distro = getattr(entry, 'distro', 'Unknown') or 'Unknown'
                description = f"({size_mb}MB, {distro})"
            # Use entry_id as the boot target
            lines.append(f"item --key {idx} {info.entry_id} {display_name} {description}")

        lines.append("")

        # Build choose command with optional timeout
        if self.config.menu_timeout > 0:
            lines.append(f"choose --default ${{menu-default}} --timeout {self.config.menu_timeout} selected || goto local")
        else:
            lines.append(f"choose --default ${{menu-default}} selected || goto local")

        lines.append("")
        lines.append("echo Booting ${{selected}}...")
        lines.append("goto ${{selected}}")
        lines.append("")

        # Local boot fallback
        lines.append(":local")
        lines.append("echo Booting from local disk...")
        lines.append("sanboot --no-describe 0x80")
        lines.append("")

        # Add per-container boot labels
        for info in pxe_containers:
            lines.append(f":{info.entry_id}")
            lines.append(f"chain http://{host}/containers/{info.entry_id} || goto failed")
            lines.append("")

        lines.append(":failed")
        lines.append("echo Boot failed, returning to menu...")
        lines.append("sleep 3")
        lines.append("goto start")

        script = "\n".join(lines)

        logger.info(
            f"[HTTP] Serving menu script with {len(pxe_containers)} containers "
            f"(default={self.config.default_entry}, timeout={self.config.menu_timeout}s) "
            f"to {request.remote or 'unknown'}"
        )

        return web.Response(
            text=script,
            content_type='text/plain',
            charset='utf-8'
        )

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

    async def _serve_entry(self, request: web.Request, entry: 'CatalogEntry') -> web.StreamResponse:
        """Serve a catalog entry file."""
        filepath = entry.path
        file_size = entry.size
        client_ip = request.remote or "unknown"

        # Check file still exists
        if not os.path.isfile(filepath):
            logger.error(f"[HTTP] File missing for entry {entry.id}: {filepath}")
            raise web.HTTPNotFound(text="File not found")

        # Handle range request
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
