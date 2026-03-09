"""
Delta Server for HTTP-based Delta Updates

Provides HTTP endpoints for serving delta manifests and byte ranges
to enable efficient network transfers of .rts.png file updates.

Key Features:
    - Serves delta manifests via /delta/<file>.json endpoint
    - Lists available deltas via /delta/list endpoint
    - Integrates with existing HTTPBootServer for byte-range support
    - Caches manifests for efficient repeated access

Usage:
    server = DeltaServer(container_path, http_root)
    manifest = server.generate_manifest_for_version(old_version_path)
"""

import json
import logging
import os
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Any
from datetime import datetime, timezone

logger = logging.getLogger(__name__)


@dataclass
class DeltaServer:
    """
    Server for managing and serving delta manifests.

    Attributes:
        container_path: Path to the current .rts.png file
        http_root: Root directory for HTTP-served files
        _manifest_cache: Cache of generated manifests by version
    """
    container_path: str
    http_root: str
    _manifest_cache: Dict[str, Any] = field(default_factory=dict)

    def __post_init__(self):
        """Initialize the delta server."""
        self.container_path = Path(self.container_path).resolve()
        self.http_root = Path(self.http_root).resolve()
        self._delta_dir = self.http_root / "delta"
        self._ensure_delta_directory()

    def _ensure_delta_directory(self) -> None:
        """Ensure the delta directory exists under http_root."""
        self._delta_dir.mkdir(parents=True, exist_ok=True)
        logger.info(f"Delta directory: {self._delta_dir}")

    def generate_manifest_for_version(
        self,
        old_version_path: str,
        version_tag: Optional[str] = None
    ) -> str:
        """
        Generate a delta manifest between old version and current container.

        Args:
            old_version_path: Path to the old .rts.png file
            version_tag: Optional tag for the manifest (default: auto-generated)

        Returns:
            Path to the generated manifest file

        Raises:
            FileNotFoundError: If old_version_path doesn't exist
            ValueError: If manifest generation fails
        """
        from systems.pixel_compiler.delta_manifest import generate_delta_manifest

        old_path = Path(old_version_path)
        if not old_path.exists():
            raise FileNotFoundError(f"Old version not found: {old_version_path}")

        # Generate manifest
        manifest = generate_delta_manifest(str(old_path), str(self.container_path))

        # Determine version tag
        if version_tag is None:
            version_tag = old_path.stem.replace('.rts', '')

        # Cache the manifest
        self._manifest_cache[version_tag] = manifest

        # Save manifest to delta directory
        manifest_filename = f"{self.container_path.stem}.json"
        manifest_path = self._delta_dir / manifest_filename
        manifest.save(str(manifest_path))

        logger.info(f"Generated delta manifest: {manifest_path}")
        logger.info(f"  Regions: {len(manifest.regions)}")
        logger.info(f"  Compression ratio: {manifest.compression_ratio}%")

        return str(manifest_path)

    def get_cached_manifest(self, version_tag: str) -> Optional[Any]:
        """
        Get a cached manifest by version tag.

        Args:
            version_tag: Tag of the version to retrieve

        Returns:
            DeltaManifest if cached, None otherwise
        """
        # Check in-memory cache first
        if version_tag in self._manifest_cache:
            return self._manifest_cache[version_tag]

        # Try to load from disk
        manifest_filename = f"{self.container_path.stem}.json"
        manifest_path = self._delta_dir / manifest_filename

        if manifest_path.exists():
            from systems.pixel_compiler.delta_manifest import DeltaManifest
            try:
                manifest = DeltaManifest.load(str(manifest_path))
                self._manifest_cache[version_tag] = manifest
                return manifest
            except Exception as e:
                logger.warning(f"Failed to load manifest: {e}")

        return None

    def list_available_deltas(self) -> List[Dict[str, Any]]:
        """
        List all available delta manifests.

        Returns:
            List of dicts with manifest info (version, path, timestamp)
        """
        deltas = []

        if not self._delta_dir.exists():
            return deltas

        for manifest_file in self._delta_dir.glob("*.json"):
            try:
                from systems.pixel_compiler.delta_manifest import DeltaManifest
                manifest = DeltaManifest.load(str(manifest_file))

                deltas.append({
                    'file': manifest_file.name,
                    'old_file': manifest.old_file,
                    'new_file': manifest.new_file,
                    'old_size': manifest.old_size,
                    'new_size': manifest.new_size,
                    'regions_count': len(manifest.regions),
                    'compression_ratio': manifest.compression_ratio,
                    'generated_at': manifest.generated_at
                })
            except Exception as e:
                logger.warning(f"Failed to read manifest {manifest_file}: {e}")

        return deltas

    def clear_cache(self) -> None:
        """Clear the manifest cache."""
        self._manifest_cache.clear()
        logger.info("Manifest cache cleared")


def generate_delta_for_container(
    container_path: str,
    old_version_path: str,
    http_root: str,
    version_tag: Optional[str] = None
) -> str:
    """
    Generate a delta manifest for a container and save to http_root.

    Convenience function that creates a DeltaServer and generates a manifest.

    Args:
        container_path: Path to the current .rts.png file
        old_version_path: Path to the old .rts.png file
        http_root: Root directory for HTTP-served files
        version_tag: Optional tag for the manifest

    Returns:
        Path to the generated manifest file
    """
    server = DeltaServer(container_path, http_root)
    return server.generate_manifest_for_version(old_version_path, version_tag)


def create_delta_handler(delta_server: DeltaServer):
    """
    Create an HTTP handler function for delta requests.

    Returns a function suitable for integration with HTTPBootServer
    to handle /delta/* requests.

    Args:
        delta_server: DeltaServer instance

    Returns:
        Async handler function for delta requests
    """
    import asyncio

    async def handle_delta_request(
        path: str,
        headers: dict,
        writer: asyncio.StreamWriter
    ) -> bool:
        """
        Handle delta-related HTTP requests.

        Routes:
            GET /delta/list - List available deltas
            GET /delta/<file>.json - Get specific manifest

        Args:
            path: Request path
            headers: Request headers
            writer: Stream writer for response

        Returns:
            True if request was handled, False otherwise
        """
        if not path.startswith('/delta/'):
            return False

        # Handle /delta/list
        if path == '/delta/list':
            deltas = delta_server.list_available_deltas()
            response_body = json.dumps({'deltas': deltas}, indent=2)

            response = (
                f"HTTP/1.1 200 OK\r\n"
                f"Content-Type: application/json\r\n"
                f"Content-Length: {len(response_body)}\r\n"
                f"\r\n"
            )
            writer.write(response.encode('utf-8'))
            writer.write(response_body.encode('utf-8'))
            await writer.drain()
            return True

        # Handle /delta/<file>.json
        if path.endswith('.json'):
            filename = path[7:]  # Remove '/delta/'
            manifest_path = delta_server._delta_dir / filename

            if not manifest_path.exists():
                response = (
                    f"HTTP/1.1 404 Not Found\r\n"
                    f"Content-Type: text/plain\r\n"
                    f"Content-Length: 9\r\n"
                    f"\r\n"
                    f"Not Found"
                )
                writer.write(response.encode('utf-8'))
                await writer.drain()
                return True

            # Read and serve manifest
            with open(manifest_path, 'r') as f:
                manifest_content = f.read()

            response = (
                f"HTTP/1.1 200 OK\r\n"
                f"Content-Type: application/json\r\n"
                f"Content-Length: {len(manifest_content)}\r\n"
                f"Access-Control-Allow-Origin: *\r\n"
                f"\r\n"
            )
            writer.write(response.encode('utf-8'))
            writer.write(manifest_content.encode('utf-8'))
            await writer.drain()
            return True

        # Unknown delta path
        return False

    return handle_delta_request


class DeltaHTTPHandler:
    """
    HTTP handler class for delta requests.

    Provides a class-based handler for integration with HTTPBootServer.
    """

    def __init__(self, delta_server: DeltaServer):
        """
        Initialize the handler.

        Args:
            delta_server: DeltaServer instance
        """
        self.delta_server = delta_server
        self._async_handler = create_delta_handler(delta_server)

    async def handle(self, path: str, headers: dict, writer) -> bool:
        """
        Handle a delta request.

        Args:
            path: Request path
            headers: Request headers
            writer: Stream writer

        Returns:
            True if handled, False otherwise
        """
        return await self._async_handler(path, headers, writer)
