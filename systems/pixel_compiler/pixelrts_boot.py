"""
PixelRTS v2 Boot Performance Module

Implements kernel pre-loading, initrd optimization, parallel boot loading,
lazy file access, and boot configuration management for faster boot times.
"""

import asyncio
import json
import struct
import time
import threading
from concurrent.futures import ThreadPoolExecutor
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Any, Callable, BinaryIO
import hashlib
import zlib


class BootStage(Enum):
    """Boot stages for tracking progress."""
    INIT = 0
    KERNEL_LOAD = 1
    INITRD_LOAD = 2
    ROOT_MOUNT = 3
    INIT_START = 4
    COMPLETE = 5
    FAILED = 6


class LoadPriority(Enum):
    """Priority levels for boot file loading."""
    CRITICAL = 0    # Must load immediately
    HIGH = 1        # Load in first wave
    MEDIUM = 2      # Load in second wave
    LOW = 3         # Load lazily on demand
    BACKGROUND = 4  # Load in background


class AccessPattern(Enum):
    """File access patterns for optimization."""
    SEQUENTIAL = 0   # Read sequentially
    RANDOM = 1       # Random access
    SPARSE = 2       # Sparse access pattern
    ONCE = 3         # Read once at boot


@dataclass
class BootFile:
    """Represents a file needed during boot."""
    name: str
    path: str
    size: int
    priority: LoadPriority
    access_pattern: AccessPattern
    zone: str = "HOT"
    hash: str = ""
    preload: bool = False
    cache_in_memory: bool = False
    load_offset: int = 0
    load_size: int = 0

    def to_dict(self) -> Dict[str, Any]:
        return {
            'name': self.name,
            'path': self.path,
            'size': self.size,
            'priority': self.priority.name,
            'access_pattern': self.access_pattern.name,
            'zone': self.zone,
            'hash': self.hash,
            'preload': self.preload,
            'cache_in_memory': self.cache_in_memory
        }


@dataclass
class BootConfig:
    """Boot configuration parameters."""
    root_device: str = "/dev/sda1"
    init: str = "/sbin/init"
    console: str = "ttyS0"
    root_flags: str = "ro"
    quiet: bool = False
    debug: bool = False
    boot_timeout: int = 30
    kernel_params: List[str] = field(default_factory=list)
    environment: Dict[str, str] = field(default_factory=dict)

    def to_dict(self) -> Dict[str, Any]:
        return {
            'root_device': self.root_device,
            'init': self.init,
            'console': self.console,
            'root_flags': self.root_flags,
            'quiet': self.quiet,
            'debug': self.debug,
            'boot_timeout': self.boot_timeout,
            'kernel_params': self.kernel_params,
            'environment': self.environment
        }

    def to_cmdline(self) -> str:
        """Convert to kernel command line string."""
        parts = [
            f"root={self.root_device}",
            f"init={self.init}",
            f"console={self.console}",
            f"rootflags={self.root_flags}"
        ]
        if self.quiet:
            parts.append("quiet")
        if self.debug:
            parts.append("debug")
        parts.extend(self.kernel_params)
        return " ".join(parts)

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> 'BootConfig':
        return cls(
            root_device=data.get('root_device', '/dev/sda1'),
            init=data.get('init', '/sbin/init'),
            console=data.get('console', 'ttyS0'),
            root_flags=data.get('root_flags', 'ro'),
            quiet=data.get('quiet', False),
            debug=data.get('debug', False),
            boot_timeout=data.get('boot_timeout', 30),
            kernel_params=data.get('kernel_params', []),
            environment=data.get('environment', {})
        )


@dataclass
class BootMetrics:
    """Metrics for boot performance tracking."""
    start_time: float = 0.0
    kernel_load_time: float = 0.0
    initrd_load_time: float = 0.0
    root_mount_time: float = 0.0
    init_start_time: float = 0.0
    complete_time: float = 0.0
    total_bytes_loaded: int = 0
    cache_hits: int = 0
    cache_misses: int = 0
    parallel_loads: int = 0

    def total_time(self) -> float:
        return self.complete_time - self.start_time

    def to_dict(self) -> Dict[str, Any]:
        return {
            'start_time': self.start_time,
            'kernel_load_time': self.kernel_load_time,
            'initrd_load_time': self.initrd_load_time,
            'root_mount_time': self.root_mount_time,
            'init_start_time': self.init_start_time,
            'complete_time': self.complete_time,
            'total_time': self.total_time(),
            'total_bytes_loaded': self.total_bytes_loaded,
            'cache_hits': self.cache_hits,
            'cache_misses': self.cache_misses,
            'parallel_loads': self.parallel_loads
        }


class BootConfigStore:
    """
    Centralized boot configuration storage.
    Allows modification without rebuilding the entire image.
    """

    CONFIG_MAGIC = b"PRTSBOOT"
    CONFIG_VERSION = 1

    def __init__(self):
        self.config = BootConfig()
        self.overrides: Dict[str, Any] = {}
        self._listeners: List[Callable[[str, Any], None]] = []

    def load(self, config_data: bytes) -> bool:
        """
        Load configuration from binary data.

        Args:
            config_data: Binary configuration data

        Returns:
            True if loaded successfully
        """
        if not config_data.startswith(self.CONFIG_MAGIC):
            return False

        try:
            version = struct.unpack('>I', config_data[8:12])[0]
            if version != self.CONFIG_VERSION:
                return False

            json_len = struct.unpack('>I', config_data[12:16])[0]
            json_data = config_data[16:16+json_len].decode('utf-8')
            config_dict = json.loads(json_data)

            self.config = BootConfig.from_dict(config_dict)
            return True
        except Exception:
            return False

    def save(self) -> bytes:
        """
        Save configuration to binary data.

        Returns:
            Binary configuration data
        """
        json_data = json.dumps(self.config.to_dict(), separators=(',', ':'))
        json_bytes = json_data.encode('utf-8')

        return (
            self.CONFIG_MAGIC +
            struct.pack('>I', self.CONFIG_VERSION) +
            struct.pack('>I', len(json_bytes)) +
            json_bytes
        )

    def get(self, key: str, default: Any = None) -> Any:
        """Get configuration value with override support."""
        if key in self.overrides:
            return self.overrides[key]
        return getattr(self.config, key, default)

    def set(self, key: str, value: Any, override: bool = False):
        """Set configuration value."""
        if override:
            self.overrides[key] = value
        else:
            if hasattr(self.config, key):
                setattr(self.config, key, value)
                self._notify_listeners(key, value)

    def add_listener(self, callback: Callable[[str, Any], None]):
        """Add a listener for configuration changes."""
        self._listeners.append(callback)

    def _notify_listeners(self, key: str, value: Any):
        """Notify listeners of configuration change."""
        for listener in self._listeners:
            try:
                listener(key, value)
            except Exception:
                pass

    def detect_boot_params(self, proc_cmdline: str = None) -> Dict[str, str]:
        """
        Auto-detect boot parameters from /proc/cmdline or defaults.

        Args:
            proc_cmdline: Optional content of /proc/cmdline

        Returns:
            Dictionary of detected parameters
        """
        params = {}

        # Try to read from /proc/cmdline if not provided
        if proc_cmdline is None:
            try:
                with open('/proc/cmdline', 'r') as f:
                    proc_cmdline = f.read().strip()
            except Exception:
                proc_cmdline = ""

        # Parse command line
        if proc_cmdline:
            for part in proc_cmdline.split():
                if '=' in part:
                    key, value = part.split('=', 1)
                    params[key] = value
                else:
                    params[part] = "true"

        # Apply detected parameters
        if 'root' in params:
            self.config.root_device = params['root']
        if 'init' in params:
            self.config.init = params['init']
        if 'console' in params:
            self.config.console = params['console']
        if 'rootflags' in params:
            self.config.root_flags = params['rootflags']
        if 'quiet' in params:
            self.config.quiet = True
        if 'debug' in params:
            self.config.debug = True

        return params


class KernelPreloader:
    """
    Pre-loads kernel sections for faster boot.
    Identifies critical sections and loads them into memory.
    """

    # Standard kernel section names and their load priorities
    KERNEL_SECTIONS = {
        '.text': LoadPriority.CRITICAL,
        '.data': LoadPriority.HIGH,
        '.rodata': LoadPriority.HIGH,
        '.bss': LoadPriority.MEDIUM,
        '.init.text': LoadPriority.CRITICAL,
        '.init.data': LoadPriority.HIGH,
        '.exit.text': LoadPriority.LOW,
    }

    def __init__(self):
        self.sections: Dict[str, bytes] = {}
        self.section_info: Dict[str, Dict[str, Any]] = {}
        self.preloaded = False

    def analyze_kernel(self, kernel_data: bytes) -> Dict[str, Dict[str, Any]]:
        """
        Analyze kernel binary to identify sections.

        Args:
            kernel_data: Raw kernel binary data

        Returns:
            Dictionary of section information
        """
        sections = {}

        # Check for ELF magic
        if kernel_data[:4] == b'\x7fELF':
            sections.update(self._analyze_elf(kernel_data))
        # Check for compressed kernel (gzip)
        elif kernel_data[:2] == b'\x1f\x8b':
            sections.update(self._analyze_compressed(kernel_data))
        else:
            # Assume raw binary - use heuristic sections
            sections.update(self._analyze_raw(kernel_data))

        self.section_info = sections
        return sections

    def _analyze_elf(self, data: bytes) -> Dict[str, Dict[str, Any]]:
        """Analyze ELF format kernel."""
        sections = {}

        # Simple ELF section header parsing
        try:
            # ELF64 header
            e_shoff = struct.unpack('<Q', data[40:48])[0]
            e_shentsize = struct.unpack('<H', data[58:60])[0]
            e_shnum = struct.unpack('<H', data[60:62])[0]

            # Parse section headers
            for i in range(min(e_shnum, 64)):  # Limit to 64 sections
                offset = e_shoff + i * e_shentsize
                if offset + e_shentsize > len(data):
                    break

                sh_name = struct.unpack('<I', data[offset:offset+4])[0]
                sh_type = struct.unpack('<I', data[offset+4:offset+8])[0]
                sh_offset = struct.unpack('<Q', data[offset+24:offset+32])[0]
                sh_size = struct.unpack('<Q', data[offset+32:offset+40])[0]

                # Get section name (simplified)
                name = f"section_{i}"
                priority = LoadPriority.MEDIUM

                sections[name] = {
                    'offset': sh_offset,
                    'size': sh_size,
                    'type': sh_type,
                    'priority': priority.name
                }
        except Exception:
            pass

        return sections

    def _analyze_compressed(self, data: bytes) -> Dict[str, Dict[str, Any]]:
        """Analyze compressed kernel."""
        return {
            'compressed_kernel': {
                'offset': 0,
                'size': len(data),
                'priority': LoadPriority.CRITICAL.name
            }
        }

    def _analyze_raw(self, data: bytes) -> Dict[str, Dict[str, Any]]:
        """Analyze raw kernel binary."""
        size = len(data)
        chunk_size = size // 4

        return {
            'text': {
                'offset': 0,
                'size': chunk_size,
                'priority': LoadPriority.CRITICAL.name
            },
            'data': {
                'offset': chunk_size,
                'size': chunk_size,
                'priority': LoadPriority.HIGH.name
            },
            'rodata': {
                'offset': chunk_size * 2,
                'size': chunk_size,
                'priority': LoadPriority.HIGH.name
            },
            'bss': {
                'offset': chunk_size * 3,
                'size': size - chunk_size * 3,
                'priority': LoadPriority.MEDIUM.name
            }
        }

    def preload_section(self, kernel_data: bytes, section_name: str) -> bytes:
        """
        Pre-load a specific kernel section.

        Args:
            kernel_data: Full kernel data
            section_name: Section to preload

        Returns:
            Section data
        """
        if section_name not in self.section_info:
            return b''

        info = self.section_info[section_name]
        offset = info['offset']
        size = info['size']

        section_data = kernel_data[offset:offset+size]
        self.sections[section_name] = section_data
        return section_data

    def preload_critical(self, kernel_data: bytes) -> int:
        """
        Pre-load all critical sections.

        Args:
            kernel_data: Full kernel data

        Returns:
            Total bytes pre-loaded
        """
        total = 0

        for name, info in self.section_info.items():
            priority = LoadPriority[info.get('priority', 'MEDIUM')]
            if priority in [LoadPriority.CRITICAL, LoadPriority.HIGH]:
                data = self.preload_section(kernel_data, name)
                total += len(data)

        self.preloaded = True
        return total


class InitrdOptimizer:
    """
    Optimizes initrd for faster mount and file access.
    Implements compressed block structure and lazy loading.
    """

    BLOCK_SIZE = 4096
    HEADER_MAGIC = b"PINITRD\x00"  # 8 bytes, null-padded
    HEADER_VERSION = 1

    def __init__(self):
        self.blocks: Dict[int, bytes] = {}
        self.index: Dict[str, Dict[str, Any]] = {}
        self.compressed_blocks: set = set()

    def build_optimized(self, file_list: List[Tuple[str, bytes]]) -> bytes:
        """
        Build optimized initrd from file list.

        Args:
            file_list: List of (path, data) tuples

        Returns:
            Optimized initrd binary data
        """
        # Build file index
        current_offset = 0
        blocks = []
        file_index = {}

        for path, data in file_list:
            compressed = self._should_compress(path, data)
            if compressed:
                data = zlib.compress(data, level=6)

            # Pad to block size
            padded_size = ((len(data) + self.BLOCK_SIZE - 1) // self.BLOCK_SIZE) * self.BLOCK_SIZE
            padded_data = data + b'\x00' * (padded_size - len(data))

            file_index[path] = {
                'offset': current_offset,
                'size': len(data),
                'original_size': len(file_list[[p for p, _ in file_list].index(path)][1]),
                'compressed': compressed,
                'blocks': padded_size // self.BLOCK_SIZE
            }

            blocks.append(padded_data)
            current_offset += padded_size

        # Build header
        index_json = json.dumps(file_index, separators=(',', ':'))
        index_data = index_json.encode('utf-8')
        index_size = len(index_data)

        header = (
            self.HEADER_MAGIC +
            struct.pack('>I', self.HEADER_VERSION) +
            struct.pack('>I', index_size) +
            struct.pack('>I', len(file_list)) +
            index_data
        )

        # Pad header to block size
        header_padded = header + b'\x00' * (self.BLOCK_SIZE - (len(header) % self.BLOCK_SIZE))

        return header_padded + b''.join(blocks)

    def _should_compress(self, path: str, data: bytes) -> bool:
        """Determine if file should be compressed."""
        # Don't compress already compressed files
        compressed_extensions = ['.gz', '.bz2', '.xz', '.zst', '.png', '.jpg']
        for ext in compressed_extensions:
            if path.endswith(ext):
                return False

        # Compress text files and small binaries
        if len(data) < 512:
            return False  # Too small to benefit

        # Check entropy - high entropy means already compressed/random
        entropy = self._calculate_entropy(data)
        return entropy < 7.5

    def _calculate_entropy(self, data: bytes) -> float:
        """Calculate byte entropy of data."""
        if not data:
            return 0.0

        import math
        byte_counts = [0] * 256
        for b in data[:8192]:  # Sample first 8KB
            byte_counts[b] += 1

        total = sum(byte_counts)
        entropy = 0.0
        for count in byte_counts:
            if count > 0:
                p = count / total
                entropy -= p * math.log2(p)

        return entropy

    def load_index(self, initrd_data: bytes) -> Dict[str, Dict[str, Any]]:
        """
        Load file index from initrd.

        Args:
            initrd_data: Raw initrd data

        Returns:
            File index dictionary
        """
        if not initrd_data.startswith(self.HEADER_MAGIC):
            # Legacy initrd - build simple index
            return {'legacy_initrd': {'offset': 0, 'size': len(initrd_data)}}

        try:
            index_size = struct.unpack('>I', initrd_data[12:16])[0]
            index_json = initrd_data[20:20+index_size].decode('utf-8')

            self.index = json.loads(index_json)
            return self.index
        except (struct.error, UnicodeDecodeError, json.JSONDecodeError):
            # Corrupted or invalid index
            return {'legacy_initrd': {'offset': 0, 'size': len(initrd_data)}}

    def extract_file(self, initrd_data: bytes, path: str) -> Optional[bytes]:
        """
        Extract a single file from optimized initrd.

        Args:
            initrd_data: Raw initrd data
            path: File path to extract

        Returns:
            File data or None if not found
        """
        if not self.index:
            self.load_index(initrd_data)

        if path not in self.index:
            return None

        info = self.index[path]
        index_size = struct.unpack('>I', initrd_data[12:16])[0]
        header_size = 20 + index_size
        header_size = ((header_size + self.BLOCK_SIZE - 1) // self.BLOCK_SIZE) * self.BLOCK_SIZE

        offset = header_size + info['offset']
        data = initrd_data[offset:offset + info['size']]

        if info.get('compressed', False):
            data = zlib.decompress(data)

        return data


class ParallelBootLoader:
    """
    Loads kernel and initrd in parallel for faster boot.
    Uses thread pool for concurrent loading.
    """

    def __init__(self, max_workers: int = 4):
        self.max_workers = max_workers
        self.executor = ThreadPoolExecutor(max_workers=max_workers)
        self.metrics = BootMetrics()
        self._cache: Dict[str, bytes] = {}
        self._lock = threading.Lock()

    def load_parallel(
        self,
        files: List[Tuple[str, Callable[[], bytes]]],
        callback: Callable[[str, bytes], None] = None
    ) -> Dict[str, bytes]:
        """
        Load multiple files in parallel.

        Args:
            files: List of (name, loader_function) tuples
            callback: Optional callback when each file loads

        Returns:
            Dictionary of name -> data
        """
        results = {}
        futures = {}

        # Submit all load tasks
        for name, loader in files:
            future = self.executor.submit(self._load_with_cache, name, loader)
            futures[future] = name

        # Collect results
        for future in futures:
            name = futures[future]
            try:
                data = future.result(timeout=30)
                results[name] = data
                if callback:
                    callback(name, data)
            except Exception as e:
                results[name] = None

        self.metrics.parallel_loads += len(files)
        return results

    def _load_with_cache(self, name: str, loader: Callable[[], bytes]) -> bytes:
        """Load file with caching."""
        with self._lock:
            if name in self._cache:
                self.metrics.cache_hits += 1
                return self._cache[name]

        self.metrics.cache_misses += 1
        data = loader()
        self.metrics.total_bytes_loaded += len(data)

        with self._lock:
            self._cache[name] = data

        return data

    def preload_critical(
        self,
        kernel_loader: Callable[[], bytes],
        initrd_loader: Callable[[], bytes]
    ) -> Tuple[Optional[bytes], Optional[bytes]]:
        """
        Preload kernel and initrd in parallel.

        Args:
            kernel_loader: Function to load kernel
            initrd_loader: Function to load initrd

        Returns:
            Tuple of (kernel_data, initrd_data)
        """
        self.metrics.start_time = time.time()

        results = self.load_parallel([
            ('kernel', kernel_loader),
            ('initrd', initrd_loader)
        ])

        self.metrics.kernel_load_time = time.time()
        self.metrics.initrd_load_time = time.time()

        return results.get('kernel'), results.get('initrd')

    def clear_cache(self):
        """Clear the file cache."""
        with self._lock:
            self._cache.clear()


class LazyFileAccessor:
    """
    Implements lazy (demand-paged) file access with read-ahead caching.
    """

    def __init__(self, block_size: int = 4096, cache_size: int = 64):
        self.block_size = block_size
        self.cache_size = cache_size  # Number of blocks to cache
        self._cache: Dict[Tuple[str, int], bytes] = {}
        self._access_log: List[Tuple[str, int]] = []
        self._lock = threading.Lock()
        self._readahead_enabled = True
        self._readahead_size = 4  # Number of blocks to read ahead

    def read_block(
        self,
        file_handle: BinaryIO,
        path: str,
        block_num: int,
        read_ahead: bool = True
    ) -> bytes:
        """
        Read a block with caching and optional read-ahead.

        Args:
            file_handle: Open file handle
            path: File path (for cache key)
            block_num: Block number to read
            read_ahead: Whether to perform read-ahead

        Returns:
            Block data
        """
        cache_key = (path, block_num)

        with self._lock:
            if cache_key in self._cache:
                return self._cache[cache_key]

        # Read the block
        offset = block_num * self.block_size
        file_handle.seek(offset)
        data = file_handle.read(self.block_size)

        # Cache it
        with self._lock:
            self._cache[cache_key] = data
            self._access_log.append(cache_key)

            # Evict old entries if cache is full
            while len(self._cache) > self.cache_size:
                old_key = self._access_log.pop(0)
                if old_key in self._cache:
                    del self._cache[old_key]

        # Read-ahead
        if read_ahead and self._readahead_enabled:
            self._do_readahead(file_handle, path, block_num)

        return data

    def _do_readahead(self, file_handle: BinaryIO, path: str, start_block: int):
        """Perform read-ahead caching."""
        for i in range(1, self._readahead_size + 1):
            cache_key = (path, start_block + i)
            with self._lock:
                if cache_key in self._cache:
                    continue

            offset = (start_block + i) * self.block_size
            file_handle.seek(offset)
            data = file_handle.read(self.block_size)

            if not data:
                break

            with self._lock:
                self._cache[cache_key] = data

    def read_range(
        self,
        file_handle: BinaryIO,
        path: str,
        offset: int,
        size: int
    ) -> bytes:
        """
        Read a byte range with caching.

        Args:
            file_handle: Open file handle
            path: File path (for cache key)
            offset: Byte offset
            size: Number of bytes to read

        Returns:
            Data bytes
        """
        start_block = offset // self.block_size
        end_block = (offset + size - 1) // self.block_size

        result_parts = []
        for block_num in range(start_block, end_block + 1):
            block_data = self.read_block(file_handle, path, block_num)
            result_parts.append(block_data)

        result = b''.join(result_parts)
        block_offset = offset % self.block_size
        return result[block_offset:block_offset + size]

    def get_stats(self) -> Dict[str, int]:
        """Get cache statistics."""
        with self._lock:
            return {
                'cache_entries': len(self._cache),
                'access_log_size': len(self._access_log),
                'cache_size_bytes': sum(len(v) for v in self._cache.values())
            }


class BootManager:
    """
    Main boot management class that coordinates all boot optimization components.
    """

    def __init__(self):
        self.config_store = BootConfigStore()
        self.kernel_preloader = KernelPreloader()
        self.initrd_optimizer = InitrdOptimizer()
        self.parallel_loader = ParallelBootLoader()
        self.lazy_accessor = LazyFileAccessor()
        self.metrics = BootMetrics()
        self._boot_files: Dict[str, BootFile] = {}
        self._stage = BootStage.INIT
        self._stage_callbacks: Dict[BootStage, List[Callable]] = {}

    def register_boot_file(self, file: BootFile):
        """Register a file needed for boot."""
        self._boot_files[file.path] = file

    def get_boot_file(self, path: str) -> Optional[BootFile]:
        """Get registered boot file."""
        return self._boot_files.get(path)

    def set_stage(self, stage: BootStage):
        """Update boot stage and notify listeners."""
        self._stage = stage
        callbacks = self._stage_callbacks.get(stage, [])
        for callback in callbacks:
            try:
                callback(stage)
            except Exception:
                pass

    def on_stage(self, stage: BootStage, callback: Callable):
        """Register callback for a boot stage."""
        if stage not in self._stage_callbacks:
            self._stage_callbacks[stage] = []
        self._stage_callbacks[stage].append(callback)

    def boot(self, kernel_data: bytes, initrd_data: bytes) -> bool:
        """
        Execute optimized boot sequence.

        Args:
            kernel_data: Kernel binary data
            initrd_data: Initrd data

        Returns:
            True if boot succeeded
        """
        self.metrics.start_time = time.time()
        self.set_stage(BootStage.INIT)

        try:
            # Stage 1: Analyze kernel
            self.kernel_preloader.analyze_kernel(kernel_data)

            # Stage 2: Load kernel
            self.set_stage(BootStage.KERNEL_LOAD)
            preloaded = self.kernel_preloader.preload_critical(kernel_data)
            self.metrics.kernel_load_time = time.time()
            self.metrics.total_bytes_loaded += preloaded

            # Stage 3: Load initrd
            self.set_stage(BootStage.INITRD_LOAD)
            self.initrd_optimizer.load_index(initrd_data)
            self.metrics.initrd_load_time = time.time()

            # Stage 4: Mount root (simulated)
            self.set_stage(BootStage.ROOT_MOUNT)
            time.sleep(0.01)  # Simulated mount
            self.metrics.root_mount_time = time.time()

            # Stage 5: Start init (simulated)
            self.set_stage(BootStage.INIT_START)
            self.metrics.init_start_time = time.time()

            # Stage 6: Complete
            self.set_stage(BootStage.COMPLETE)
            self.metrics.complete_time = time.time()

            return True

        except Exception as e:
            self.set_stage(BootStage.FAILED)
            return False

    def get_boot_metadata(self) -> Dict[str, Any]:
        """
        Get boot metadata for embedding in PNG.

        Returns:
            Boot metadata dictionary
        """
        return {
            'config': self.config_store.config.to_dict(),
            'kernel_sections': self.kernel_preloader.section_info,
            'initrd_index': self.initrd_optimizer.index,
            'metrics': self.metrics.to_dict(),
            'boot_files': {k: v.to_dict() for k, v in self._boot_files.items()}
        }

    def create_boot_config_section(self) -> bytes:
        """Create binary boot configuration section."""
        return self.config_store.save()


def create_boot_manager(
    kernel_path: str = None,
    initrd_path: str = None,
    config: BootConfig = None
) -> BootManager:
    """
    Create a boot manager with standard configuration.

    Args:
        kernel_path: Optional kernel file path
        initrd_path: Optional initrd file path
        config: Optional boot configuration

    Returns:
        Configured BootManager
    """
    manager = BootManager()

    if config:
        manager.config_store.config = config

    if kernel_path:
        manager.register_boot_file(BootFile(
            name='kernel',
            path=kernel_path,
            size=0,  # Will be filled during boot
            priority=LoadPriority.CRITICAL,
            access_pattern=AccessPattern.SEQUENTIAL,
            preload=True,
            cache_in_memory=True
        ))

    if initrd_path:
        manager.register_boot_file(BootFile(
            name='initrd',
            path=initrd_path,
            size=0,
            priority=LoadPriority.HIGH,
            access_pattern=AccessPattern.RANDOM,
            preload=True,
            cache_in_memory=True
        ))

    # Add standard boot files
    manager.register_boot_file(BootFile(
        name='init',
        path='/sbin/init',
        size=0,
        priority=LoadPriority.CRITICAL,
        access_pattern=AccessPattern.ONCE,
        zone='HOT'
    ))

    return manager
