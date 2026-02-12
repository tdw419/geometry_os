#!/usr/bin/env python3
"""
Infinite Map FUSE Mounter v2 - Fragmented File Reading & VAT Integration

Mounts a Geometry OS Infinite Map (.rts.png) as a user-space filesystem.

Features:
- Fragmented file reading with cluster chain traversal
- VAT-based coordinate lookups for accurate file locations
- Full FUSE operations (getattr, readdir, read, open, release, statfs)
- Backward compatibility with v1 format

Task #2: Fragmented File Reading
- read_fragmented() method follows cluster chains from first to last
- Assembles complete files from fragments across multiple clusters
- Handles broken chains gracefully
- Tracks read progress for large files

Task #3: FUSE Operations with VAT
- getattr() uses VAT for accurate sizes
- readdir() lists VAT entries
- read() uses fragmented file reads
- statfs() provides accurate capacity stats
- open() and release() operations
"""

import os
import sys
import json
import stat
import errno
import struct
import threading
from typing import Dict, Any, List, Optional, Tuple, NamedTuple
from pathlib import Path
from collections import defaultdict
from dataclasses import dataclass
from functools import lru_cache
from collections import OrderedDict

# Ensure we can import from systems
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from systems.rts_fuse.filesystem import RTSFilesystem, FUSE, FuseOSError
from systems.rts_fuse.container import RTSContainer
from systems.rts_fuse.hilbert_lut import HilbertLUT
from systems.pixel_compiler.vat_parser import VATParser, VATInspector, VATNotFoundError
from systems.pixel_compiler.infinite_map_v2 import ClusterLocation, VisualAllocationTable
import numpy as np

@dataclass
class FileInfo:
    """File information with cluster chain for fragmented reads."""
    name: str
    size: int
    mode: int
    mtime: int
    first_cluster: Optional[ClusterLocation] = None
    cluster_chain: List[ClusterLocation] = None

    def __post_init__(self):
        if self.cluster_chain is None:
            self.cluster_chain = []

    @property
    def cluster_count(self) -> int:
        """Calculate number of clusters needed for this file."""
        return (self.size + 4095) // 4096  # 4KB clusters


class InfiniteMapContainer(RTSContainer):
    """
    Specialized container for Infinite Map OS.
    Parses Visual Allocation Table (VAT) from PNG metadata or
    falls back to legacy manifest parsing.

    Features:
    - VAT v2 parsing with cluster chain support
    - File handle tracking for open/release operations
    - Backward compatibility with v1 format
    """

    def __init__(self, container_path: str, use_vat_parser: bool = True):
        """
        Initialize Infinite Map container.

        Args:
            container_path: Path to .rts.png file
            use_vat_parser: If True, use VAT v2 parser first.
                          Falls back to legacy parsing if VAT not found.
        """
        # Initialize, but catch the metadata error from base
        self.suppress_metadata_error = True
        self.use_vat_parser = use_vat_parser
        super().__init__(container_path)

        # VAT storage
        self.vat: Optional[VisualAllocationTable] = None
        self.vat_parser = VATParser()

        # File info cache with cluster chains
        self.file_info: Dict[str, FileInfo] = {}

        # Track open files
        self.open_files: Dict[str, int] = {}
        self.open_lock = threading.Lock()

        # Try VAT v2 parsing first, then fallback to legacy manifest
        if use_vat_parser:
            self._try_parse_vat()
        else:
            self._parse_embedded_manifest()

    def _try_parse_vat(self):
        """
        Try to parse VAT v2 from PNG metadata.
        Falls back to legacy manifest if VAT not found.
        """
        print("[*] Attempting VAT v2 parsing...")

        try:
            inspector = VATInspector()
            vat = inspector.load_from_image(self.container_path)
            print(f"    VAT v2 loaded successfully!")
            print(f"    Grid: {vat.grid_size}x{vat.grid_size}")
            print(f"    Files in VAT: {len(vat.entries)}")

            # Store VAT for file location lookups
            self.vat = vat

            # Build file info from VAT entries
            for name, locs in vat.entries.items():
                if not locs:
                    continue

                clean_name = name.lstrip('/')

                # Try to get info from offsets (PNG metadata sidecar)
                size = 0
                mtime = 0
                mode = 0o644
                
                if clean_name in self.offsets:
                    off_info = self.offsets[clean_name]
                    size = off_info.get('size', 0)
                    mtime = off_info.get('mtime', 0)
                    mode = off_info.get('mode', 0o644)

                # Create file info with cluster chain
                self.file_info[clean_name] = FileInfo(
                    name=clean_name,
                    size=size,
                    mode=mode,
                    mtime=mtime,
                    first_cluster=locs[0] if locs else None,
                    cluster_chain=locs
                )

                # Build offsets for compatibility
                if locs:
                    first_loc = locs[0]
                    self.offsets[clean_name].update({
                        'start': 0,  # VAT uses spatial coords, not linear
                        'location': first_loc,
                        'vat_entries': locs  # Full cluster chain
                    })

            print(f"    Mapped {len(self.file_info)} files from VAT")

            # Try to get file sizes from embedded manifest (might overwrite with more detail)
            self._parse_embedded_manifest_for_sizes()

            return

        except VATNotFoundError as e:
            print(f"    VAT v2 not found, falling back to legacy manifest")
            print(f"    Reason: {e}")
            self._parse_embedded_manifest()
        except Exception as e:
            print(f"    VAT v2 parsing failed: {e}")
            print(f"    Falling back to legacy manifest")
            self._parse_embedded_manifest()

    def _parse_embedded_manifest_for_sizes(self):
        """Parse embedded manifest to get file sizes (for VAT v2)."""
        try:
            # Use existing manifest parsing
            if not hasattr(self, 'manifest') or 'files' not in self.manifest:
                self._parse_embedded_manifest()

            # Update file info with sizes from manifest
            if hasattr(self, 'manifest') and 'files' in self.manifest:
                for file_entry in self.manifest['files']:
                    name = file_entry['name'].lstrip('/')
                    size = file_entry['size']

                    if name in self.file_info:
                        self.file_info[name].size = size
                        self.file_info[name].mtime = file_entry.get('mtime', 0)
                        self.file_info[name].mode = file_entry.get('mode', 0o644)

                    # Also update offsets
                    if name in self.offsets:
                        self.offsets[name]['size'] = size

                print(f"    Updated {len(self.manifest['files'])} file sizes from manifest")

        except Exception as e:
            print(f"    Warning: Could not parse manifest for sizes: {e}")

    def _load_metadata(self):
        """Override to prevent failure if standard metadata is missing."""
        try:
            super()._load_metadata()
        except RuntimeError:
            if not getattr(self, 'suppress_metadata_error', False):
                raise
            print("    Standard metadata not found, proceeding to embedded manifest scan...")
            self.metadata = {}
        
    def _parse_embedded_manifest(self):
        """Read and parse the metadata JSON embedded at the end of the stream."""
        print("[*] Parsing Infinite Map embedded manifest...")
        
        # We need to read the end of the stream without loading everything
        # We can use a temporary RTSFilesystem-like approach or just use the loaded img_data directly
        # Since RTSContainer loads img_data into RAM (numpy array), we can use the LUT to extracting bytes
        
        # We'll use the RTSFilesystem's method if we were in the FS, 
        # but here we are inside the container. We need the LUT.
        from systems.rts_fuse.hilbert_lut import HilbertLUT
        
        order = int(self.grid_size.bit_length() - 1)
        lut = HilbertLUT.generate_lut(order)
        
        # Helper to extract bytes (copied logic from RTSFilesystem for independence)
        def extract_bytes(start, end):
            start_pixel = start // 4
            end_pixel = (end + 3) // 4
            indices = slice(start_pixel, end_pixel)
            coords = lut[indices]
            ys = coords[:, 1]
            xs = coords[:, 0]
            pixel_data = self.img_data[ys, xs]
            byte_data = pixel_data.flatten()
            local_start = start % 4
            return byte_data[local_start : local_start + (end - start)].tobytes()

        # The stream size is total pixels * 4
        total_size = self.grid_size * self.grid_size * 4
        
        # Read last 64KB to find metadata
        scan_size = 64 * 1024
        start_scan = max(0, total_size - scan_size)
        
        tail_data = extract_bytes(start_scan, total_size)
        
        # Look for JSON start '{' from the end backwards, or just try to decode
        # The builder does: image.extend(metadata.encode('utf-8'))
        # So it should be at the very end, possibly padded? 
        # The builder does NOT pad after metadata.
        
        # Try to find the last '}'
        last_brace = tail_data.rfind(b'}')
        if last_brace == -1:
            print("    Warning: No JSON end found in last 64KB")
            return

        # Try to find the matching '{'
        # This is heuristics; a robust solution would allow the builder to store the offset in the header/superblock
        # But for now we scan
        
        decoded = False
        for i in range(last_brace - 1, -1, -1):
            if tail_data[i] == ord('{'):
                try:
                    candidate = tail_data[i : last_brace + 1].decode('utf-8')
                    meta = json.loads(candidate)
                    if 'files' in meta:
                        self.manifest = meta
                        decoded = True
                        print(f"    Found manifest! ({len(candidate)} bytes)")
                        break
                except:
                    continue
        
        if not decoded:
            print("    Warning: Failed to decode embedded manifest")
            return

        # Reconstruct offsets from manifest
        # The builder packs: Superblock (4096) + File1 + File2 ...
        current_offset = 4096 # Superblock size
        
        for file_entry in self.manifest['files']:
            name = file_entry['name']
            size = file_entry['size']
            
            # Allow stripping leading slash for FUSE convenience
            clean_name = name.lstrip('/')
            
            self.offsets[clean_name] = {
                'start': current_offset,
                'end': current_offset + size,
                'size': size,
                'importance': file_entry.get('importance', 0),
                'location': file_entry.get('location', [0, 0])
            }
            
            current_offset += size
            
        print(f"    Mapped {len(self.offsets)} files from manifest")

    def get_cluster_chain(self, filename: str) -> List[ClusterLocation]:
        """
        Get cluster chain for a file.

        Args:
            filename: Name of file

        Returns:
            List of cluster locations, empty if not found
        """
        if filename in self.file_info:
            return self.file_info[filename].cluster_chain

        # Check offsets for VAT entries
        if filename in self.offsets and 'vat_entries' in self.offsets[filename]:
            return self.offsets[filename]['vat_entries']

        return []

    def get_file_info_extended(self, filename: str) -> Optional[FileInfo]:
        """
        Get extended file information including cluster chain.

        Args:
            filename: Name of file

        Returns:
            FileInfo object or None if not found
        """
        return self.file_info.get(filename)

    def open_file(self, filename: str) -> int:
        """
        Mark file as open.

        Args:
            filename: Name of file

        Returns:
            File handle (incrementing counter)
        """
        with self.open_lock:
            if filename not in self.open_files:
                self.open_files[filename] = 0
            self.open_files[filename] += 1
            return self.open_files[filename]

    def release_file(self, filename: str) -> int:
        """
        Mark file as released/closed.

        Args:
            filename: Name of file

        Returns:
            Remaining open count
        """
        with self.open_lock:
            if filename in self.open_files:
                self.open_files[filename] -= 1
                if self.open_files[filename] <= 0:
                    del self.open_files[filename]
                    return 0
                return self.open_files[filename]
            return 0


class InfiniteMapFilesystem(RTSFilesystem):
    """
    FUSE Filesystem for Infinite Map with VAT integration.

    Task #2: Fragmented File Reading
    - read_fragmented() method follows cluster chains
    - Handles files spanning multiple clusters
    - Gracefully handles broken chains

    Task #3: FUSE Operations with VAT
    - getattr() uses VAT for accurate sizes
    - readdir() lists VAT entries
    - read() uses fragmented file reads
    - statfs() provides accurate capacity
    - open() and release() operations
    """

    CLUSTER_SIZE = 4096  # 4KB clusters

    def __init__(self, container_path: str, max_workers: int = 4, enable_writes: bool = False):
        # Override container initialization to use our specialized class
        self.container = InfiniteMapContainer(container_path)
        self.img_data = self.container.img_data
        self.grid_size = self.container.grid_size
        self.max_workers = max_workers
        self.enable_writes = enable_writes

        # Init lock and stats
        self.lock = threading.RLock()
        self.stats = {
            "reads": 0,
            "bytes_read": 0,
            "bytes_written": 0,
            "cache_hits": 0,
            "cache_misses": 0,
            "fragmented_reads": 0,
            "cluster_chain_hops": 0
        }

        # Load LUT
        order = int(self.grid_size.bit_length() - 1)
        self.lut = HilbertLUT.generate_lut(order)

        # Cache for file handles
        self.file_handles: Dict[int, str] = {}
        self.next_handle = 1
        self.handle_lock = threading.Lock()

        # Track open files for write operations
        self._open_files: Dict[str, Dict] = {}

        print(f"[*] Infinite Map Filesystem initialized")

        if self.container.vat:
            print(f"    VAT: {len(self.container.vat.entries)} files")
        else:
            print(f"    VAT: Not available (using v1 mode)")

        if enable_writes:
            print("    Write support enabled (experimental)")

        # Phase 2.2: Access Pattern Tracking
        self.access_counts = defaultdict(int)
        self.access_log_path = str(Path(container_path).with_suffix('.access.json'))

    def destroy(self, path):
        """Called on filesystem unmount."""
        print(f"[*] Saving access stats to {self.access_log_path}...")
        print(f"    Access counts: {dict(self.access_counts)}")
        try:
            with open(self.access_log_path, 'w') as f:
                json.dump(self.access_counts, f, indent=2)
                f.flush()  # Ensure data is written
            print(f"    Successfully saved to {self.access_log_path}")
        except Exception as e:
            print(f"    Error saving access stats: {e}")
            import traceback
            traceback.print_exc()

    # ==========================================================================
    # Task #2: Fragmented File Reading
    # ==========================================================================

    def read_fragmented(
        self,
        filename: str,
        offset: int = 0,
        size: Optional[int] = None
    ) -> bytes:
        """
        Read a file that may be fragmented across multiple clusters.

        This method:
        1. Follows cluster chains from first to last cluster
        2. Assembles complete file from fragments
        3. Handles broken chains gracefully
        4. Tracks read progress for large files

        Args:
            filename: Name of file to read
            offset: Starting offset within the file (default: 0)
            size: Number of bytes to read (default: read to end)

        Returns:
            File data as bytes

        Raises:
            FileNotFoundError: If file not found
            RuntimeError: If cluster chain is broken
        """
        # Get cluster chain from VAT
        cluster_chain = self.container.get_cluster_chain(filename)

        if not cluster_chain:
            # Fall back to linear offset-based reading for v1
            return self._read_linear(filename, offset, size)

        # Get file info for size
        info = self.container.get_file_info(filename)
        if info is None:
            info = self.container.get_file_info_extended(filename)
            if info is None:
                raise FileNotFoundError(f"File not found: {filename}")

        file_size = info.get('size', 0) if isinstance(info, dict) else info.size

        # Determine read size
        if size is None:
            size = file_size - offset

        # Clamp to file bounds
        if offset >= file_size:
            return b''

        size = min(size, file_size - offset)

        # Calculate which clusters we need
        start_cluster = offset // self.CLUSTER_SIZE
        end_cluster = (offset + size + self.CLUSTER_SIZE - 1) // self.CLUSTER_SIZE

        # Clamp to available clusters
        end_cluster = min(end_cluster, len(cluster_chain))

        # Track progress
        bytes_read = 0
        result = bytearray()

        # Update stats
        with self.lock:
            self.stats["fragmented_reads"] += 1

        # Read from each cluster in range
        for cluster_idx in range(start_cluster, end_cluster):
            if cluster_idx >= len(cluster_chain):
                # Broken chain - stop here
                print(f"    Warning: Broken chain at cluster {cluster_idx} for {filename}")
                break

            cluster_loc = cluster_chain[cluster_idx]

            # Calculate read parameters for this cluster
            cluster_offset = cluster_idx * self.CLUSTER_SIZE
            read_offset_in_cluster = 0
            read_size_in_cluster = self.CLUSTER_SIZE

            # Adjust for file offset
            if cluster_idx == start_cluster:
                read_offset_in_cluster = offset % self.CLUSTER_SIZE
                read_size_in_cluster -= read_offset_in_cluster

            # Adjust for read size
            if cluster_idx == end_cluster - 1:
                remaining_bytes = size - bytes_read
                read_size_in_cluster = min(read_size_in_cluster, remaining_bytes)

            # Read from this cluster
            cluster_data = self._read_cluster(
                cluster_loc,
                read_offset_in_cluster,
                read_size_in_cluster
            )

            result.extend(cluster_data)
            bytes_read += len(cluster_data)

            # Update stats
            with self.lock:
                self.stats["cluster_chain_hops"] += 1

        return bytes(result)

    def _read_cluster(
        self,
        cluster_loc: ClusterLocation,
        offset: int,
        size: int
    ) -> bytes:
        """
        Read data from a specific cluster at (x, y) coordinates.

        Args:
            cluster_loc: Cluster location (x, y)
            offset: Offset within cluster (0-4095)
            size: Number of bytes to read

        Returns:
            Cluster data as bytes
        """
        # Get linear index for cluster location
        linear_idx = cluster_loc.to_linear_index(self.grid_size)

        # Calculate global byte offset
        global_offset = linear_idx * 4 + offset

        # Read bytes
        return self._extract_bytes(global_offset, global_offset + size)

    def _read_linear(
        self,
        filename: str,
        offset: int,
        size: Optional[int]
    ) -> bytes:
        """
        Read file using linear offset method (v1 compatibility).

        Args:
            filename: Name of file
            offset: Starting offset
            size: Number of bytes to read

        Returns:
            File data as bytes
        """
        info = self.container.get_file_info(filename)
        if info is None:
            raise FileNotFoundError(f"File not found: {filename}")

        file_start = info['start']
        file_size = info['size']

        if offset >= file_size:
            return b''

        if size is None:
            size = file_size - offset

        size = min(size, file_size - offset)

        global_start = file_start + offset
        global_end = global_start + size

        return self._extract_bytes(global_start, global_end)

    def _extract_bytes(self, global_start: int, global_end: int) -> bytes:
        """
        Extract bytes from image using Hilbert curve mapping.

        Args:
            global_start: Starting byte offset in container
            global_end: Ending byte offset in container

        Returns:
            Extracted bytes
        """
        # Pixel coordinates (4 bytes/pixel)
        start_pixel = global_start // 4
        end_pixel = (global_end + 3) // 4

        # Get pixel indices
        indices = slice(start_pixel, end_pixel)

        # Get (X, Y) coordinates for these pixels
        coords = self.lut[indices]

        # Advanced indexing into img_data
        ys = coords[:, 1]
        xs = coords[:, 0]

        pixel_data = self.img_data[ys, xs]

        # Flatten to bytes
        byte_data = pixel_data.flatten()

        # Calculate local offset within first pixel
        local_start = global_start % 4

        # Slice exact bytes
        return byte_data[local_start : local_start + (global_end - global_start)].tobytes()

    # ==========================================================================
    # Phase 2: Hot Zone Caching
    # ==========================================================================

    @lru_cache(maxsize=4096)  # Cache 16MB of hot data (4096 * 4KB)
    def _read_cluster_cached(self, cx: int, cy: int) -> bytes:
        """
        Read a full 4KB cluster with caching.
        
        Args:
            cx: Cluster X coordinate
            cy: Cluster Y coordinate
            
        Returns:
            4096 bytes of cluster data
        """
        # Create temporary ClusterLocation
        # (Avoid importing class if possible, or assume caller provides tuple)
        # But we need to use _extract_bytes with linear offset
        
        # Calculate linear index for this cluster
        # Using Hilbert curve logic inline or via helper
        # We need a way to get linear index from (cx, cy) without object allocation overhead?
        # Actually ClusterLocation involves some overhead.
        # But let's reuse _extract_bytes for now which uses the LUT efficiently.
        
        # Determine global offset for this cluster
        # We need the linear index of (cx, cy)
        # self.lut maps linear_index -> (x, y)
        # But we need (x, y) -> linear_index? 
        # The LUT is forward mapping: linear -> (x,y).
        # Inverse mapping: (x,y) -> linear is hard without reverse LUT or calculation.
        
        # Wait! The current implementation of _read_cluster:
        # linear_idx = cluster_loc.to_linear_index(self.grid_size)
        # global_offset = linear_idx * 4 + offset
        
        # ClusterLocation.to_linear_index uses `hilbert_curve` library or logic?
        # Let's check InfiniteMapV2 logic.
        
        # Assuming we can get linear index:
        # We need to construct a ClusterLocation to call to_linear_index
        # OR implement fast inverse Hilbert.
        
        # For now, rely on existing to_linear_index
        fake_loc = ClusterLocation(cx, cy)
        linear_idx = fake_loc.to_linear_index(self.grid_size)
        
        global_start = linear_idx * 4
        global_end = global_start + self.CLUSTER_SIZE
        
        # Update cache stats
        # (Note: lru_cache handles hits/misses internally, but we can track our own)
        
        return self._extract_bytes(global_start, global_end)

    def _read_cluster(
        self,
        cluster_loc: ClusterLocation,
        offset: int,
        size: int
    ) -> bytes:
        """
        Read data from a specific cluster at (x, y) coordinates with caching.

        Args:
            cluster_loc: Cluster location (x, y)
            offset: Offset within cluster (0-4095)
            size: Number of bytes to read

        Returns:
            Cluster data as bytes
        """
        # Try to use cached full cluster read
        try:
            # Get full 4KB cluster from cache
            cluster_data = self._read_cluster_cached(cluster_loc.x, cluster_loc.y)
            
            # Update stats (approximate, since lru_cache hides hits)
            # We can check cache_info() if needed
            
            # Slice the requested data
            return cluster_data[offset : offset + size]
            
        except Exception as e:
            # Fallback for debugging
            print(f"Cluster read error: {e}")
            return b'\x00' * size

    # ==========================================================================
    # Task #3: FUSE Operations with VAT
    # ==========================================================================

    def getattr(self, path: str, fh=None) -> dict:
        """
        Get file attributes using VAT for accurate sizes.

        Args:
            path: File path
            fh: File handle (optional)

        Returns:
            Dictionary with file attributes
        """
        if path == "/":
            return {
                'st_mode': (stat.S_IFDIR | 0o555),
                'st_nlink': 2,
                'st_size': 4096,
                'st_ctime': self.container.container_path.stat().st_ctime,
                'st_mtime': self.container.container_path.stat().st_mtime,
                'st_atime': self.container.container_path.stat().st_atime
            }

        filename = path.lstrip("/")

        # Try extended file info (VAT) first
        file_info = self.container.get_file_info_extended(filename)
        if file_info is not None:
            return {
                'st_mode': (stat.S_IFREG | file_info.mode),
                'st_nlink': 1,
                'st_size': file_info.size,
                'st_ctime': file_info.mtime,
                'st_mtime': file_info.mtime,
                'st_atime': self.container.container_path.stat().st_atime
            }

        # Fall back to offsets (v1 compatibility)
        info = self.container.get_file_info(filename)

        if info is None:
            raise FuseOSError(errno.ENOENT)

        return {
            'st_mode': (stat.S_IFREG | 0o444),
            'st_nlink': 1,
            'st_size': info.get('size', 0),
            'st_ctime': self.container.container_path.stat().st_ctime,
            'st_mtime': self.container.container_path.stat().st_mtime,
            'st_atime': self.container.container_path.stat().st_atime
        }

    def readdir(self, path: str, fh=None) -> list:
        """
        List directory contents using VAT entries.

        Args:
            path: Directory path
            fh: File handle (unused)

        Returns:
            List of filenames
        """
        if path != "/":
            raise FuseOSError(errno.ENOTDIR)

        # List files from file_info (VAT)
        vat_files = list(self.container.file_info.keys())

        # Merge with offset files (for v1 compatibility)
        offset_files = list(self.container.offsets.keys())

        # Combine and deduplicate
        all_files = sorted(set(vat_files + offset_files))

        return ['.', '..'] + all_files

    def read(self, path: str, length: int, offset: int, fh=None) -> bytes:
        """
        Read file data using fragmented file reads.

        Args:
            path: File path
            length: Number of bytes to read
            offset: Starting offset in file
            fh: File handle (optional)

        Returns:
            File data as bytes
        """
        filename = path.lstrip("/")

        # Check _open_files first for files that have been written
        if filename in self._open_files:
            file_info = self._open_files[filename]
            clusters = file_info.get('clusters', [])
            if clusters:
                # Read from the clusters we've written to
                data = self._read_from_clusters(clusters, offset, length, file_info['size'])
                with self.lock:
                    self.stats["reads"] += 1
                    self.stats["bytes_read"] += len(data)
                    self.access_counts[filename] += 1
                return data

        # Check if file has cluster chain (VAT v2)
        cluster_chain = self.container.get_cluster_chain(filename)

        if cluster_chain:
            # Use fragmented read for VAT files
            data = self.read_fragmented(filename, offset, length)
        else:
            # Use linear read for v1 files
            data = self._read_linear(filename, offset, length)

        # Update statistics
        with self.lock:
            self.stats["reads"] += 1
            self.stats["bytes_read"] += len(data)
            self.access_counts[filename] += 1

        return data

    def _read_from_clusters(self, clusters: list, offset: int, length: int, file_size: int) -> bytes:
        """
        Read data from a list of clusters.

        Args:
            clusters: List of ClusterLocation objects
            offset: Starting offset in file
            length: Number of bytes to read
            file_size: Total file size

        Returns:
            File data as bytes
        """
        if offset >= file_size:
            return b''

        # Clamp length to available data
        actual_length = min(length, file_size - offset)
        if actual_length <= 0:
            return b''

        result = bytearray()
        bytes_read = 0

        while bytes_read < actual_length:
            cluster_idx = (offset + bytes_read) // 4096
            cluster_offset = (offset + bytes_read) % 4096

            if cluster_idx >= len(clusters):
                break

            cluster = clusters[cluster_idx]
            bytes_to_read = min(4096 - cluster_offset, actual_length - bytes_read)

            cluster_data = self._read_cluster_for_write(cluster, cluster_offset, bytes_to_read)
            result.extend(cluster_data)
            bytes_read += len(cluster_data)

        return bytes(result)

    def _read_cluster_for_write(self, cluster, offset: int, size: int) -> bytes:
        """
        Read data from a cluster that was written via write().

        Args:
            cluster: ClusterLocation
            offset: Offset within cluster (0-4095)
            size: Number of bytes to read

        Returns:
            Cluster data as bytes
        """
        linear_idx = cluster.to_linear_index(self.grid_size)
        result = bytearray()

        for i in range(size):
            byte_pos = offset + i
            pixel_idx = linear_idx + (byte_pos // 4)
            channel = byte_pos % 4

            if pixel_idx < len(self.lut):
                x, y = self.lut[pixel_idx]
                byte_val = self.img_data[y, x, channel]
                result.append(byte_val)
            else:
                result.append(0)

        return bytes(result)

    def create(self, path: str, mode: int, fi=None) -> int:
        """
        Create a new file.

        Args:
            path: File path to create
            mode: File permissions (ignored, uses 0o644)
            fi: File info (unused)

        Returns:
            0 on success, or negative errno on failure
        """
        if not self.enable_writes:
            raise FuseOSError(errno.EROFS)

        # Normalize path
        if path.startswith('/'):
            filename = path[1:]
        else:
            filename = path

        # Check if file already exists
        if filename in self.container.vat.entries:
            raise FuseOSError(errno.EEXIST)

        # Allocate cluster for new file
        try:
            # Allocate initial cluster (empty file)
            clusters = self.container.vat.allocate_sequential(filename, 0)
            if not clusters:
                raise FuseOSError(errno.ENOSPC)

            # Track as open file
            self._open_files[filename] = {
                'name': filename,
                'size': 0,
                'clusters': clusters,
                'modified': True
            }

            # Update statistics
            with self.lock:
                self.stats["bytes_written"] += 0  # Empty file

            print(f"[*] Created file: {filename} (cluster {clusters[0]})")

            return 0
        except FuseOSError:
            raise
        except Exception as e:
            print(f"Error creating file {path}: {e}")
            raise FuseOSError(errno.EIO)

    def write(self, path: str, data: bytes, offset: int, fh=None) -> int:
        """
        Write data to a file.

        Args:
            path: File path
            data: Data to write
            offset: Starting offset in file
            fh: File handle (unused)

        Returns:
            Number of bytes written
        """
        if not self.enable_writes:
            raise FuseOSError(errno.EROFS)

        # Normalize path
        filename = path[1:] if path.startswith('/') else path

        # Get or create file info
        if filename not in self.container.vat.entries:
            result = self.create(path, 0o644)
            if result < 0:
                return result

        # Get file info from _open_files or create
        file_info = self._open_files.get(filename)
        if not file_info:
            locs = self.container.vat.entries.get(filename, [])
            file_info = {
                'name': filename,
                'size': 0,
                'clusters': locs,
                'modified': False
            }
            self._open_files[filename] = file_info

        # Calculate clusters needed
        total_size = max(file_info['size'], offset + len(data))
        clusters_needed = (total_size + 4095) // 4096

        # Allocate more clusters if needed
        while len(file_info['clusters']) < clusters_needed:
            try:
                new_clusters = self.container.vat.allocate_sequential(
                    filename, 4096
                )
                file_info['clusters'].extend(new_clusters)
            except Exception:
                return -errno.ENOSPC

        # Write data to clusters
        data_offset = 0
        while data_offset < len(data):
            cluster_idx = (offset + data_offset) // 4096
            cluster_offset = (offset + data_offset) % 4096

            if cluster_idx >= len(file_info['clusters']):
                break

            cluster = file_info['clusters'][cluster_idx]
            bytes_to_write = min(4096 - cluster_offset, len(data) - data_offset)

            self._write_cluster(
                cluster,
                data[data_offset:data_offset + bytes_to_write],
                cluster_offset
            )
            data_offset += bytes_to_write

        file_info['size'] = total_size
        file_info['modified'] = True
        self.stats["bytes_written"] += len(data)
        return len(data)

    def _write_cluster(self, cluster, data: bytes, offset: int) -> None:
        """
        Write data to a cluster at given offset.

        Args:
            cluster: ClusterLocation to write to
            data: Data bytes to write
            offset: Offset within the cluster (0-4095)
        """
        linear_idx = cluster.to_linear_index(self.grid_size)

        for i, byte_val in enumerate(data):
            byte_pos = offset + i
            pixel_idx = linear_idx + (byte_pos // 4)
            channel = byte_pos % 4

            if pixel_idx < len(self.lut):
                x, y = self.lut[pixel_idx]
                # Write to img_data at correct position
                self.img_data[y, x, channel] = byte_val

    def open(self, path: str, flags: int) -> int:
        """
        Open a file and return file handle.

        Args:
            path: File path
            flags: Open flags

        Returns:
            File handle
        """
        filename = path.lstrip("/")

        # Check if file exists
        cluster_chain = self.container.get_cluster_chain(filename)
        if not cluster_chain and filename not in self.container.offsets:
            raise FuseOSError(errno.ENOENT)

        # Check write permissions
        if (flags & os.O_WRONLY) or (flags & os.O_RDWR):
            if not self.enable_writes:
                raise FuseOSError(errno.EROFS)

        # Mark file as open
        self.container.open_file(filename)

        # Allocate file handle
        with self.handle_lock:
            handle = self.next_handle
            self.file_handles[handle] = filename
            self.next_handle += 1

        return handle

    def release(self, path: str, flags: int, fh: int) -> int:
        """
        Release/close a file.

        Args:
            path: File path
            flags: Open flags (unused)
            fh: File handle

        Returns:
            0 on success
        """
        filename = path.lstrip("/")

        # Release file
        self.container.release_file(filename)

        # Free file handle
        with self.handle_lock:
            if fh in self.file_handles:
                del self.file_handles[fh]

        return 0

    def statfs(self, path: str) -> dict:
        """
        Get filesystem statistics with accurate capacity.

        Args:
            path: File path (unused)

        Returns:
            Dictionary with filesystem stats
        """
        # Total capacity
        total_capacity = self.grid_size * self.grid_size * 4

        # Calculate used capacity from VAT
        used_clusters = sum(
            len(chain)
            for chain in self.container.get_cluster_chain(f)
            for f in [self.container.file_info.keys()]
            if self.container.get_cluster_chain(f)
        ) if self.container.vat else 0

        # Alternative: count from file_info
        if self.container.vat:
            used_clusters = sum(
                len(info.cluster_chain)
                for info in self.container.file_info.values()
            )

        used_capacity = used_clusters * self.CLUSTER_SIZE

        # Free capacity
        free_capacity = total_capacity - used_capacity

        # File count
        file_count = len(self.container.file_info)

        block_size = self.CLUSTER_SIZE
        total_blocks = total_capacity // block_size
        free_blocks = free_capacity // block_size

        return {
            'f_bsize': block_size,
            'f_frsize': block_size,
            'f_blocks': total_blocks,
            'f_bfree': free_blocks,
            'f_bavail': free_blocks,
            'f_files': file_count,
            'f_ffree': 0,
            'f_fsid': 0,
            'f_flag': 0,
            'f_namemax': 255
        }

    def get_stats(self) -> dict:
        """
        Get filesystem performance statistics.

        Returns:
            Dictionary with performance metrics including fragmented read stats
        """
        with self.lock:
            return self.stats.copy()

    def reset_stats(self):
        """Reset performance statistics."""
        with self.lock:
            self.stats = {
                "reads": 0,
                "bytes_read": 0,
                "bytes_written": 0,
                "cache_hits": 0,
                "cache_misses": 0,
                "fragmented_reads": 0,
                "cluster_chain_hops": 0
            }

def mount_infinite_map(
    container_path: str,
    mountpoint: str,
    foreground: bool = True,
    read_only: bool = True,
    max_workers: int = 4
):
    """
    Mount the Infinite Map with VAT support.

    Args:
        container_path: Path to .rts.png file
        mountpoint: Mount point directory
        foreground: Run in foreground (default: True)
        read_only: Mount as read-only (default: True)
        max_workers: Maximum worker threads
    """
    if not os.path.exists(mountpoint):
        os.makedirs(mountpoint)

    print(f"*** Infinite Map OS FUSE v2 (VAT Integration) ***")
    print(f"Mounting {container_path} -> {mountpoint}")
    print(f"Mode: {'read-only' if read_only else 'read-write'}")
    print(f"Workers: {max_workers}")

    fs = InfiniteMapFilesystem(container_path, max_workers=max_workers)

    FUSE(
        fs,
        mountpoint,
        foreground=foreground,
        ro=read_only,
        allow_other=True
    )

if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser(
        description='Mount Geometry OS Infinite Map v2 with VAT support'
    )
    parser.add_argument('image', help='Path to .rts.png image')
    parser.add_argument('mountpoint', help='Mount point directory')
    parser.add_argument('--background', action='store_true', help='Run in background')
    parser.add_argument('--rw', action='store_true', help='Read-write mode (experimental)')
    parser.add_argument('--workers', type=int, default=4, help='Worker threads')

    args = parser.parse_args()

    mount_infinite_map(
        args.image,
        args.mountpoint,
        foreground=not args.background,
        read_only=not args.rw,
        max_workers=args.workers
    )
