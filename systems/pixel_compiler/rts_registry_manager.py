#!/usr/bin/env python3
"""
RTS Registry Manager
Manages the catalog of all .rts cartridges.

This provides a centralized registry to track, search, and verify .rts files.
Supports both legacy .rts files and PixelRTS v2 .rts.png visual containers.
"""

import os
import sys
import json
import hashlib
import argparse
from pathlib import Path
from typing import Dict, List, Optional
from datetime import datetime


def _get_default_registry_path() -> str:
    """Get default registry path from environment or use sensible default."""
    # Check environment variable first
    if "RTS_REGISTRY_PATH" in os.environ:
        return os.environ["RTS_REGISTRY_PATH"]

    # Use user's home directory as default
    home = os.path.expanduser("~")
    return os.path.join(home, ".rts", "registry.json")


class RTSRegistryManager:
    """
    Manage .rts cartridge catalog.
    
    Provides:
    - Registration of new cartridges
    - Search and listing
    - Checksum verification
    - Metadata management
    """
    
    def __init__(self, registry_path: str = None):
        self.registry_path = registry_path or _get_default_registry_path()
        self.registry = self._load_registry()
    
    def _load_registry(self) -> Dict:
        """Load registry from file or create new."""
        if os.path.exists(self.registry_path):
            with open(self.registry_path, 'r') as f:
                return json.load(f)
        else:
            # Create new registry
            registry = {
                "version": "1.0",
                "created": datetime.now().isoformat(),
                "cartridges": []
            }
            self._save_registry(registry)
            return registry
    
    def _save_registry(self, registry: Optional[Dict] = None):
        """Save registry to file."""
        if registry is None:
            registry = self.registry
        
        registry["updated"] = datetime.now().isoformat()
        
        # Ensure directory exists
        os.makedirs(os.path.dirname(self.registry_path), exist_ok=True)
        
        with open(self.registry_path, 'w') as f:
            json.dump(registry, f, indent=2)
    
    def register(self, rts_path: str, metadata: Optional[Dict] = None,
                 cartridge_id: Optional[str] = None) -> str:
        """
        Add .rts or .rts.png to registry.

        Args:
            rts_path: Path to .rts or .rts.png file
            metadata: Optional metadata dictionary
            cartridge_id: Optional custom ID (auto-generated if not provided)

        Returns:
            Cartridge ID
        """
        if not os.path.exists(rts_path):
            raise FileNotFoundError(f"RTS file not found: {rts_path}")

        # Detect format and route to appropriate handler
        if rts_path.endswith('.png'):
            return self._register_pixelrts_v2(rts_path, metadata, cartridge_id)
        else:
            return self._register_legacy_rts(rts_path, metadata, cartridge_id)

    def _register_legacy_rts(self, rts_path: str, metadata: Optional[Dict] = None,
                            cartridge_id: Optional[str] = None) -> str:
        """
        Register legacy .rts cartridge.

        Args:
            rts_path: Path to .rts file
            metadata: Optional metadata dictionary
            cartridge_id: Optional custom ID (auto-generated if not provided)

        Returns:
            Cartridge ID
        """
        # Load metadata from .meta.json if available
        meta_path = rts_path + ".meta.json"
        if os.path.exists(meta_path):
            with open(meta_path, 'r') as f:
                file_meta = json.load(f)
        else:
            file_meta = {}

        # Determine cartridge ID (priority: metadata > file metadata > filename)
        if cartridge_id is None:
            if metadata and "name" in metadata:
                cartridge_id = metadata["name"].lower().replace(' ', '-').replace('_', '-')
            elif file_meta.get("name"):
                cartridge_id = file_meta["name"].lower().replace(' ', '-').replace('_', '-')
            else:
                basename = os.path.basename(rts_path).replace('.rts', '')
                cartridge_id = basename.lower().replace(' ', '-').replace('_', '-')

        # Determine name (priority: metadata > file metadata > cartridge_id)
        if metadata and "name" in metadata:
            name = metadata["name"]
        elif file_meta.get("name"):
            name = file_meta["name"]
        else:
            name = cartridge_id

        # Determine type (priority: metadata > file metadata > default)
        if metadata and "type" in metadata:
            cart_type = metadata["type"]
        elif file_meta.get("type"):
            cart_type = file_meta["type"]
        else:
            cart_type = "unknown"

        # Calculate checksum
        checksum = self._calculate_checksum(rts_path)

        # Build cartridge entry
        cartridge = {
            "id": cartridge_id,
            "name": name,
            "version": metadata.get("version", file_meta.get("version", "1.0")) if metadata else file_meta.get("version", "1.0"),
            "type": cart_type,
            "path": os.path.abspath(rts_path),
            "size": os.path.getsize(rts_path),
            "checksum": checksum,
            "registered": datetime.now().isoformat(),
            "format": "rts-legacy",
            "metadata": {
                "description": metadata.get("description", "") if metadata else "",
                "dependencies": metadata.get("dependencies", []) if metadata else [],
                **file_meta
            }
        }

        # Check if cartridge already exists
        existing = self._find_cartridge(cartridge_id)
        if existing:
            print(f"[!] Updating existing cartridge: {cartridge_id}")
            self.registry["cartridges"].remove(existing)

        # Add to registry
        self.registry["cartridges"].append(cartridge)
        self._save_registry()

        print(f"[✓] Registered cartridge: {cartridge_id}")
        return cartridge_id

    def _register_pixelrts_v2(self, png_path: str, metadata: Optional[Dict] = None,
                             cartridge_id: Optional[str] = None) -> str:
        """
        Register PixelRTS v2 .rts.png cartridge.

        Extracts metadata from PNG tEXt chunks and sidecar JSON.

        Args:
            png_path: Path to .rts.png file
            metadata: Optional metadata dictionary (overrides PNG metadata)
            cartridge_id: Optional custom ID (auto-generated if not provided)

        Returns:
            Cartridge ID

        Raises:
            ValueError: If PNG is not a valid PixelRTS v2 container
        """
        try:
            from PIL import Image
            from PIL import PngImagePlugin
        except ImportError:
            raise ImportError("PIL/Pillow is required to register .rts.png files")

        print(f"[*] Registering PixelRTS v2 cartridge: {png_path}")

        # Extract metadata from PNG tEXt chunks
        png_metadata = {}
        grid_size = None
        encoding_mode = None
        format_version = None

        try:
            img = Image.open(png_path)

            # Check for PixelRTS metadata in tEXt chunks
            for key, value in img.text.items():
                if "PixelRTS" in key or "pixelrts" in key.lower():
                    try:
                        png_metadata = json.loads(value)
                        print(f"    Found PixelRTS metadata in PNG tEXt chunk")
                        break
                    except json.JSONDecodeError:
                        # Try to find metadata with PixelRTS prefix
                        if value.startswith("PixelRTS"):
                            try:
                                # Decode PixelRTS v2 format
                                from geometry_os.systems.pixel_compiler.pixelrts_v2_core import PixelRTSMetadata
                                png_metadata = PixelRTSMetadata.decode_png_text(value.encode("utf-8"))
                                print(f"    Decoded PixelRTS v2 metadata from PNG")
                                break
                            except (ValueError, ImportError):
                                pass

            # Get grid size from image dimensions
            width, height = img.size
            if width == height and (width & (width - 1)) == 0:  # Power of 2 check
                grid_size = width

            img.close()

        except Exception as e:
            print(f"[!] Warning: Could not fully read PNG metadata: {e}")

        # Try to load from sidecar JSON as fallback
        if not png_metadata:
            meta_path = png_path + ".meta.json"
            if os.path.exists(meta_path):
                with open(meta_path, 'r') as f:
                    png_metadata = json.load(f)
                print(f"    Loaded metadata from sidecar JSON")
            else:
                print(f"    [!] No PixelRTS metadata found in PNG or sidecar")
                # Create minimal metadata
                png_metadata = {
                    "format": "PixelRTS-2.0",
                    "version": 2,
                    "grid_size": grid_size or 1024,
                    "encoding": {"type": "RGBA-dense", "bytes_per_pixel": 4}
                }

        # Extract key metadata fields
        format_version = png_metadata.get("format", png_metadata.get("version", "PixelRTS-2.0"))
        encoding_info = png_metadata.get("encoding", {})
        encoding_mode = encoding_info.get("type", "RGBA-dense")
        grid_size = png_metadata.get("grid_size", grid_size)

        # Calculate checksum
        checksum = self._calculate_checksum(png_path)

        # Get file size
        file_size = os.path.getsize(png_path)

        # Extract hashes if available
        hashes = png_metadata.get("hashes", {})

        # Determine cartridge ID (priority: metadata > PNG metadata > filename)
        if cartridge_id is None:
            if metadata and "name" in metadata:
                cartridge_id = metadata["name"].lower().replace(' ', '-').replace('_', '-')
            elif png_metadata.get("name"):
                cartridge_id = png_metadata["name"].lower().replace(' ', '-').replace('_', '-')
            else:
                basename = os.path.basename(png_path).replace('.rts.png', '').replace('.png', '')
                cartridge_id = basename.lower().replace(' ', '-').replace('_', '-')

        # Determine name (priority: metadata > PNG metadata > cartridge_id)
        if metadata and "name" in metadata:
            name = metadata["name"]
        elif png_metadata.get("name"):
            name = png_metadata["name"]
        else:
            name = cartridge_id

        # Determine type (priority: metadata > PNG metadata > default)
        if metadata and "type" in metadata:
            cart_type = metadata["type"]
        elif png_metadata.get("type"):
            cart_type = png_metadata["type"]
        else:
            cart_type = "visual-container"

        # Build cartridge entry
        cartridge = {
            "id": cartridge_id,
            "name": name,
            "version": metadata.get("version", "2.0") if metadata else "2.0",
            "type": cart_type,
            "path": os.path.abspath(png_path),
            "size": file_size,
            "checksum": checksum,
            "registered": datetime.now().isoformat(),
            "format": "pixelrts-v2",
            "pixelrts": {
                "format_version": format_version,
                "grid_size": grid_size,
                "encoding_mode": encoding_mode,
                "bytes_per_pixel": encoding_info.get("bytes_per_pixel", 4),
                "mapping": encoding_info.get("mapping", "Hilbert space-filling curve"),
                "hashes": hashes
            },
            "metadata": {
                "description": metadata.get("description", "") if metadata else "",
                "dependencies": metadata.get("dependencies", []) if metadata else [],
                "offsets": png_metadata.get("offsets", {}),
                "entropy": png_metadata.get("entropy", {}),
                "original_metadata": png_metadata.get("original_rts", {})
            }
        }

        # Check if cartridge already exists
        existing = self._find_cartridge(cartridge_id)
        if existing:
            print(f"[!] Updating existing cartridge: {cartridge_id}")
            self.registry["cartridges"].remove(existing)

        # Add to registry
        self.registry["cartridges"].append(cartridge)
        self._save_registry()

        print(f"[✓] Registered PixelRTS v2 cartridge: {cartridge_id}")
        print(f"    Format: {format_version}")
        print(f"    Grid: {grid_size}×{grid_size}" if grid_size else f"    Grid: unknown")
        print(f"    Encoding: {encoding_mode}")

        return cartridge_id
    
    def unregister(self, cartridge_id: str) -> bool:
        """
        Remove .rts from registry.
        
        Args:
            cartridge_id: Cartridge ID to remove
            
        Returns:
            True if removed, False if not found
        """
        cartridge = self._find_cartridge(cartridge_id)
        if not cartridge:
            print(f"[!] Cartridge not found: {cartridge_id}")
            return False
        
        self.registry["cartridges"].remove(cartridge)
        self._save_registry()
        
        print(f"[✓] Unregistered cartridge: {cartridge_id}")
        return True
    
    def find(self, query: str) -> List[Dict]:
        """
        Search registry.
        
        Args:
            query: Search query (matches ID, name, or description)
            
        Returns:
            List of matching cartridges
        """
        query = query.lower()
        results = []
        
        for cartridge in self.registry["cartridges"]:
            # Search in ID, name, and description
            if (query in cartridge["id"].lower() or
                query in cartridge["name"].lower() or
                query in cartridge["metadata"].get("description", "").lower()):
                results.append(cartridge)
        
        return results
    
    def list(self, cartridge_type: Optional[str] = None) -> List[Dict]:
        """
        List all cartridges.
        
        Args:
            cartridge_type: Optional filter by type (tool, os, kernel, etc.)
            
        Returns:
            List of cartridges
        """
        cartridges = self.registry["cartridges"]
        
        if cartridge_type:
            cartridges = [c for c in cartridges if c["type"] == cartridge_type]
        
        return cartridges
    
    def verify(self, cartridge_id: str) -> bool:
        """
        Verify cartridge integrity.
        
        Args:
            cartridge_id: Cartridge ID to verify
            
        Returns:
            True if checksum matches, False otherwise
        """
        cartridge = self._find_cartridge(cartridge_id)
        if not cartridge:
            print(f"[!] Cartridge not found: {cartridge_id}")
            return False
        
        rts_path = cartridge["path"]
        if not os.path.exists(rts_path):
            print(f"[!] RTS file not found: {rts_path}")
            return False
        
        # Calculate current checksum
        current_checksum = self._calculate_checksum(rts_path)
        registered_checksum = cartridge["checksum"]
        
        if current_checksum == registered_checksum:
            print(f"[✓] Cartridge verified: {cartridge_id}")
            return True
        else:
            print(f"[!] Cartridge corrupted: {cartridge_id}")
            print(f"    Expected: {registered_checksum}")
            print(f"    Got:      {current_checksum}")
            return False
    
    def get(self, cartridge_id: str) -> Optional[Dict]:
        """
        Get cartridge by ID.
        
        Args:
            cartridge_id: Cartridge ID
            
        Returns:
            Cartridge dictionary or None if not found
        """
        return self._find_cartridge(cartridge_id)
    
    def _find_cartridge(self, cartridge_id: str) -> Optional[Dict]:
        """Find cartridge by ID."""
        for cartridge in self.registry["cartridges"]:
            if cartridge["id"] == cartridge_id:
                return cartridge
        return None
    
    def _calculate_checksum(self, file_path: str) -> str:
        """Calculate SHA256 checksum of file."""
        sha256_hash = hashlib.sha256()
        with open(file_path, "rb") as f:
            for byte_block in iter(lambda: f.read(4096), b""):
                sha256_hash.update(byte_block)
        return "sha256:" + sha256_hash.hexdigest()
    
    def print_list(self, cartridges: List[Dict], verbose: bool = False):
        """
        Print list of cartridges.

        Args:
            cartridges: List of cartridges to print
            verbose: Whether to show detailed information
        """
        if not cartridges:
            print("[*] No cartridges found")
            return

        print(f"\n[*] Found {len(cartridges)} cartridge(s):\n")

        for cartridge in cartridges:
            print(f"  ID:     {cartridge['id']}")
            print(f"  Name:   {cartridge['name']}")
            print(f"  Type:   {cartridge['type']}")

            # Show format if available
            if 'format' in cartridge:
                print(f"  Format: {cartridge['format']}")

            print(f"  Path:   {cartridge['path']}")
            print(f"  Size:   {_format_size(cartridge['size'])}")

            if verbose:
                print(f"  Version:  {cartridge['version']}")
                print(f"  Checksum: {cartridge['checksum']}")
                print(f"  Registered: {cartridge['registered']}")

                # Show PixelRTS v2 specific info
                if 'pixelrts' in cartridge:
                    pixelrts = cartridge['pixelrts']
                    print(f"  PixelRTS:")
                    print(f"    Format: {pixelrts.get('format_version', 'Unknown')}")
                    if pixelrts.get('grid_size'):
                        gs = pixelrts['grid_size']
                        print(f"    Grid: {gs}×{gs} ({gs * gs * pixelrts.get('bytes_per_pixel', 4):,} bytes capacity)")
                    print(f"    Encoding: {pixelrts.get('encoding_mode', 'Unknown')}")

                desc = cartridge['metadata'].get('description', '')
                if desc:
                    print(f"  Description: {desc}")

                deps = cartridge['metadata'].get('dependencies', [])
                if deps:
                    print(f"  Dependencies: {', '.join(deps)}")

                # Show hashes if available
                hashes = cartridge['metadata'].get('offsets', {})
                if hashes:
                    print(f"  Segments:")
                    for name, info in hashes.items():
                        if isinstance(info, dict):
                            print(f"    {name}: {info.get('size', 0):,} bytes")
                        else:
                            print(f"    {name}")

            print()


def _format_size(size_bytes: int) -> str:
    """Format size in human-readable format."""
    for unit in ['B', 'KB', 'MB', 'GB']:
        if size_bytes < 1024:
            return f"{size_bytes:.1f} {unit}"
        size_bytes /= 1024
    return f"{size_bytes:.1f} TB"


def main():
    """CLI interface for RTS Registry Manager."""
    parser = argparse.ArgumentParser(
        description="RTS Registry Manager - Manage .rts cartridge catalog"
    )

    parser.add_argument(
        '--registry',
        help='Path to registry file (default: ~/.rts/registry.json or $RTS_REGISTRY_PATH)'
    )

    subparsers = parser.add_subparsers(dest='command', help='Command to execute')
    
    # Register command
    register_parser = subparsers.add_parser('register', help='Register a .rts or .rts.png cartridge')
    register_parser.add_argument('rts_path', help='Path to .rts or .rts.png file')
    register_parser.add_argument('--id', help='Custom cartridge ID')
    register_parser.add_argument('--name', help='Cartridge name')
    register_parser.add_argument('--type', help='Cartridge type (tool, os, kernel, etc.)')
    register_parser.add_argument('--version', default='1.0', help='Cartridge version')
    register_parser.add_argument('--description', help='Cartridge description')
    
    # Unregister command
    unregister_parser = subparsers.add_parser('unregister', help='Unregister a cartridge')
    unregister_parser.add_argument('cartridge_id', help='Cartridge ID to remove')
    
    # List command
    list_parser = subparsers.add_parser('list', help='List cartridges')
    list_parser.add_argument('--type', help='Filter by type')
    list_parser.add_argument('-v', '--verbose', action='store_true', help='Verbose output')
    
    # Find command
    find_parser = subparsers.add_parser('find', help='Search cartridges')
    find_parser.add_argument('query', help='Search query')
    find_parser.add_argument('-v', '--verbose', action='store_true', help='Verbose output')
    
    # Verify command
    verify_parser = subparsers.add_parser('verify', help='Verify cartridge integrity')
    verify_parser.add_argument('cartridge_id', help='Cartridge ID to verify')
    
    # Get command
    get_parser = subparsers.add_parser('get', help='Get cartridge details')
    get_parser.add_argument('cartridge_id', help='Cartridge ID')
    
    args = parser.parse_args()
    
    if not args.command:
        parser.print_help()
        sys.exit(1)

    manager = RTSRegistryManager(registry_path=args.registry)
    
    try:
        if args.command == 'register':
            metadata = {}
            if args.name:
                metadata['name'] = args.name
            if args.type:
                metadata['type'] = args.type
            if args.description:
                metadata['description'] = args.description
            metadata['version'] = args.version
            
            manager.register(args.rts_path, metadata, args.id)
        
        elif args.command == 'unregister':
            manager.unregister(args.cartridge_id)
        
        elif args.command == 'list':
            cartridges = manager.list(args.type)
            manager.print_list(cartridges, verbose=args.verbose)
        
        elif args.command == 'find':
            cartridges = manager.find(args.query)
            manager.print_list(cartridges, verbose=args.verbose)
        
        elif args.command == 'verify':
            success = manager.verify(args.cartridge_id)
            sys.exit(0 if success else 1)
        
        elif args.command == 'get':
            cartridge = manager.get(args.cartridge_id)
            if cartridge:
                manager.print_list([cartridge], verbose=True)
            else:
                print(f"[!] Cartridge not found: {args.cartridge_id}")
                sys.exit(1)
    
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
