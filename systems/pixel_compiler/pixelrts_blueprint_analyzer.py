"""
PixelRTS Blueprint Analyzer

Analyzes binary data to generate structural blueprint metadata.
Supports ELF binary analysis and entropy-based component detection.
"""

import math
import logging
from typing import List, Dict, Optional, TYPE_CHECKING, Iterator, Tuple
from dataclasses import dataclass
from pathlib import Path

try:
    from elftools.elf.elffile import ELFFile
    from elftools.elf.sections import SymbolTableSection
    ELFTOOLS_AVAILABLE = True
except ImportError:
    ELFTOOLS_AVAILABLE = False

from .pixelrts_blueprint import (
    PixelRTSBlueprint, Component, ComponentType, HilbertRange,
    MemoryRegion, SecurityInfo
)
from .pixelrts_v2_core import HilbertCurve
from .pixelrts_blueprint_exceptions import (
    InvalidBinaryFormatError,
    EmptyDataError,
)

logger = logging.getLogger(__name__)

if TYPE_CHECKING:
    from .pixelrts_progress import ProgressCallback


@dataclass
class EntropyRegion:
    """A region of data with specific entropy characteristics."""
    offset: int
    size: int
    entropy: float
    entropy_profile: str  # "low", "medium", "high"


class BlueprintAnalyzer:
    """
    Analyzes binary data to generate blueprint metadata.

    Features:
    - ELF binary structure analysis (sections, symbols)
    - Entropy-based component detection
    - Automatic Hilbert range calculation
    """

    def __init__(self, progress_callback: Optional['ProgressCallback'] = None):
        """
        Initialize blueprint analyzer.

        Args:
            progress_callback: Optional callback for progress updates
        """
        self.entropy_window_size = 4096
        self.entropy_threshold_low = 2.0
        self.entropy_threshold_high = 7.5
        self._progress = progress_callback

        # Streaming analysis configuration (Phase 8.2: Memory Optimization)
        self.streaming_chunk_size = 1024 * 1024  # 1MB chunks for streaming
        self.streaming_threshold_mb = 50  # Use streaming for files > 50MB

    def is_elf_binary(self, data: bytes) -> bool:
        """
        Check if data is an ELF binary.

        Args:
            data: Binary data to check

        Returns:
            True if data has valid ELF header
        """
        if data is None:
            return False
        if not isinstance(data, (bytes, bytearray)):
            return False
        return len(data) >= 4 and data[:4] == b'\x7fELF'

    def detect_binary_format(self, data: bytes) -> str:
        """
        Detect binary format from magic bytes.

        Args:
            data: Binary data to check

        Returns:
            Format name: 'elf', 'mz' (PE), 'zip', 'riff', 'unknown'
        """
        if data is None or len(data) < 4:
            return 'unknown'

        # Check magic bytes
        if data[:4] == b'\x7fELF':
            return 'elf'
        elif data[:2] == b'MZ':
            return 'mz'
        elif data[:4] == b'PK\x03\x04':
            return 'zip'
        elif data[:4] == b'RIFF':
            return 'riff'
        else:
            return 'unknown'

    def analyze(
        self,
        data: bytes,
        system_name: str = "",
        system_type: str = "",
        architecture: str = "",
        grid_size: Optional[int] = None
    ) -> PixelRTSBlueprint:
        """
        Analyze binary data and generate blueprint.

        Args:
            data: Binary data to analyze
            system_name: Optional system name
            system_type: Optional system type
            architecture: Optional architecture
            grid_size: Optional grid size for Hilbert calculation

        Returns:
            PixelRTSBlueprint with detected components

        Raises:
            EmptyDataError: If data is None or empty
            InvalidBinaryFormatError: If data format is unrecognized
        """
        # Validate input
        if data is None:
            raise EmptyDataError("Cannot analyze None data")

        if not isinstance(data, (bytes, bytearray)):
            raise TypeError(f"Expected bytes, got {type(data).__name__}")

        if len(data) == 0:
            logger.warning("Analyzing empty data - returning empty blueprint")
            return PixelRTSBlueprint(
                system_name=system_name,
                system_type=system_type,
                architecture=architecture
            )

        self._emit_phase("initializing", "Starting blueprint analysis")

        # Detect binary format
        format_type = self.detect_binary_format(data)
        logger.debug(f"Detected binary format: {format_type}")

        blueprint = PixelRTSBlueprint(
            system_name=system_name,
            system_type=system_type,
            architecture=architecture
        )

        # Analyze ELF structure if available
        if format_type == 'elf' and ELFTOOLS_AVAILABLE:
            self._emit_phase("elf_parsing", "Parsing ELF structure")
            try:
                self._analyze_elf_structure(data, blueprint, grid_size)
            except Exception as e:
                logger.warning(f"ELF parsing failed, falling back to entropy: {e}")
                self._analyze_by_entropy(data, blueprint, grid_size)
        else:
            # Fallback to entropy-based analysis
            logger.debug(f"Using entropy-based analysis for format: {format_type}")
            self._analyze_by_entropy(data, blueprint, grid_size)

        # Infer memory map
        self._emit_phase("memory_inference", "Inferring memory layout")
        try:
            blueprint.memory_map = self._infer_memory_map(data)
        except Exception as e:
            logger.warning(f"Memory map inference failed: {e}")
            blueprint.memory_map = []

        self._emit_complete("Blueprint analysis complete")

        return blueprint

    def _analyze_elf_structure(
        self,
        data: bytes,
        blueprint: PixelRTSBlueprint,
        grid_size: Optional[int] = None
    ):
        """Analyze ELF binary structure."""
        from io import BytesIO

        try:
            elf = ELFFile(BytesIO(data))

            # Set architecture from ELF
            if not blueprint.architecture:
                arch_map = {3: 'x86', 62: 'x86_64', 40: 'arm', 183: 'aarch64'}
                ei_class = elf.header.e_ident['EI_CLASS']
                blueprint.architecture = arch_map.get(ei_class, 'unknown')

            # Calculate grid size if not provided
            if grid_size is None:
                from .pixelrts_v2_core import calculate_grid_size
                grid_size = calculate_grid_size(len(data))

            # Create Hilbert curve for coordinate mapping
            from .pixelrts_v2_core import HilbertCurve
            hilbert = HilbertCurve(order=int(math.log2(grid_size)))

            # Extract sections as components
            for section in elf.iter_sections():
                if section.header.sh_type in ('SHT_NULL', 'SHT_NOBITS'):
                    continue

                start_idx = section.header.sh_offset // 4
                end_idx = (section.header.sh_offset + section.header.sh_size) // 4

                # Calculate pixel coordinates from Hilbert index
                try:
                    pixel_start = hilbert.index_to_coord(start_idx % (grid_size * grid_size))
                    pixel_end = hilbert.index_to_coord(end_idx % (grid_size * grid_size))
                except (IndexError, ValueError):
                    pixel_start = (0, 0)
                    pixel_end = (0, 0)

                component = Component(
                    id=section.name,
                    type=self._get_section_component_type(section),
                    description=f"Section: {section.name}",
                    hilbert_range=HilbertRange(
                        start_index=start_idx,
                        end_index=end_idx,
                        pixel_start=pixel_start,
                        pixel_end=pixel_end
                    ),
                    entropy_profile=self._calculate_section_entropy(section.data()),
                    visual_hint=self._get_section_visual_hint(section)
                )
                blueprint.components.append(component)

            # Get entry point
            entry_point = elf.header.e_entry
            if entry_point:
                blueprint.entry_point = f"0x{entry_point:x}"

        except Exception as e:
            # Fall back to entropy analysis if ELF parsing fails
            self._analyze_by_entropy(data, blueprint, grid_size)

    def _analyze_by_entropy(
        self,
        data: bytes,
        blueprint: PixelRTSBlueprint,
        grid_size: Optional[int] = None
    ):
        """Analyze by entropy regions when ELF analysis unavailable."""
        if grid_size is None:
            from .pixelrts_v2_core import calculate_grid_size
            grid_size = calculate_grid_size(len(data))

        from .pixelrts_v2_core import HilbertCurve
        hilbert = HilbertCurve(order=int(math.log2(grid_size)))
        regions = self.calculate_entropy_regions(data)

        for i, region in enumerate(regions):
            try:
                pixel_start = hilbert.index_to_coord(
                    region.offset // 4 % (grid_size * grid_size)
                )
                pixel_end = hilbert.index_to_coord(
                    (region.offset + region.size) // 4 % (grid_size * grid_size)
                )
            except (IndexError, ValueError):
                pixel_start = (0, 0)
                pixel_end = (0, 0)

            component = Component(
                id=f"region_{i}",
                type=ComponentType.DATA,
                description=f"Data region {i}",
                hilbert_range=HilbertRange(
                    start_index=region.offset // 4,
                    end_index=(region.offset + region.size) // 4,
                    pixel_start=pixel_start,
                    pixel_end=pixel_end
                ),
                entropy_profile=region.entropy_profile,
                visual_hint=self._entropy_to_visual_hint(region.entropy_profile)
            )
            blueprint.components.append(component)

    def _get_section_component_type(self, section) -> ComponentType:
        """Determine component type from section properties."""
        name = section.name.lower()

        if '.text' in name or '.code' in name:
            return ComponentType.EXECUTABLE
        elif '.data' in name or '.bss' in name:
            return ComponentType.DATA
        elif '.rodata' in name or '.ro' in name:
            return ComponentType.CONFIG
        else:
            return ComponentType.DATA

    def _calculate_section_entropy(self, data: bytes) -> str:
        """Calculate entropy profile for section data."""
        if len(data) == 0:
            return "low"

        entropy = self._calculate_entropy(data)
        return self._entropy_to_profile(entropy)

    def _get_section_visual_hint(self, section) -> str:
        """Get visual hint for section based on its properties."""
        name = section.name.lower()

        if '.text' in name or '.code' in name:
            return "red_dominant"
        elif '.data' in name:
            return "green_dominant"
        elif '.bss' in name:
            return "dark_blue"
        elif '.rodata' in name:
            return "textured_green"
        else:
            return "gray"

    def _entropy_to_visual_hint(self, profile: str) -> str:
        """Map entropy profile to visual hint."""
        hint_map = {
            "low": "dark_blue",
            "medium": "textured_green",
            "high": "red_dominant"
        }
        return hint_map.get(profile, "gray")

    def _infer_memory_map(self, data: bytes) -> List[MemoryRegion]:
        """Infer memory regions from binary structure."""
        regions = []

        # Default regions
        regions.append(MemoryRegion(region=".text", permissions="rx"))
        regions.append(MemoryRegion(region=".data", permissions="rw"))
        regions.append(MemoryRegion(region=".rodata", permissions="r"))

        return regions

    def calculate_entropy_regions(
        self,
        data: bytes,
        window_size: Optional[int] = None
    ) -> List[EntropyRegion]:
        """
        Calculate entropy for sliding windows across data.

        Args:
            data: Binary data to analyze
            window_size: Size of sliding window (default from config)

        Returns:
            List of EntropyRegion objects

        Raises:
            EmptyDataError: If data is None or empty
            ValueError: If window_size is invalid
        """
        if data is None:
            raise EmptyDataError("Cannot calculate entropy for None data")

        if len(data) == 0:
            logger.debug("Empty data provided for entropy calculation")
            return []

        if window_size is None:
            window_size = self.entropy_window_size

        if window_size <= 0:
            raise ValueError(f"Invalid window_size: {window_size}, must be > 0")

        # Emit phase for entropy analysis
        self._emit_phase("entropy_analysis", "Calculating entropy regions")

        total_windows = (len(data) + window_size - 1) // window_size
        current_window = 0

        # Start progress tracking
        if self._progress is not None:
            self._progress.start(total=total_windows, message="Analyzing entropy")

        regions = []
        offset = 0

        try:
            while offset < len(data):
                window_end = min(offset + window_size, len(data))
                window = data[offset:window_end]

                if len(window) > 0:
                    try:
                        entropy = self._calculate_entropy(window)
                        profile = self._entropy_to_profile(entropy)

                        regions.append(EntropyRegion(
                            offset=offset,
                            size=len(window),
                            entropy=entropy,
                            entropy_profile=profile
                        ))
                    except (ValueError, ZeroDivisionError) as e:
                        logger.warning(f"Error calculating entropy at offset {offset}: {e}")
                        # Add default entry for failed windows
                        regions.append(EntropyRegion(
                            offset=offset,
                            size=len(window),
                            entropy=0.0,
                            entropy_profile="low"
                        ))

                offset += window_size
                current_window += 1

                # Report progress
                self._emit_update(current_window)

        except Exception as e:
            logger.error(f"Unexpected error during entropy calculation: {e}")
            # Return what we have so far
            return regions

        return regions

    def _calculate_entropy(self, data: bytes) -> float:
        """
        Calculate Shannon entropy of data.

        Args:
            data: Binary data

        Returns:
            Entropy value between 0 and 8
        """
        if data is None or len(data) == 0:
            return 0.0

        # Count byte frequencies
        frequencies = [0] * 256
        try:
            for byte in data:
                if isinstance(byte, int):
                    frequencies[byte] += 1
                elif isinstance(byte, str):
                    frequencies[ord(byte)] += 1
        except (IndexError, TypeError) as e:
            logger.warning(f"Invalid byte value in entropy calculation: {e}")
            return 0.0

        # Calculate entropy
        entropy = 0.0
        data_len = len(data)

        if data_len == 0:
            return 0.0

        try:
            for freq in frequencies:
                if freq > 0:
                    probability = freq / data_len
                    entropy -= probability * math.log2(probability)
        except (ValueError, ZeroDivisionError) as e:
            logger.warning(f"Error in entropy calculation: {e}")
            return 0.0

        return entropy

    def _entropy_to_profile(self, entropy: float) -> str:
        """Convert entropy value to profile category."""
        if entropy < self.entropy_threshold_low:
            return "low"
        elif entropy < self.entropy_threshold_high:
            return "medium"
        else:
            return "high"

    # Progress callback helpers (Phase 8.6)

    def _emit_phase(self, phase: str, message: str = "") -> None:
        """Emit phase change to progress callback if available."""
        if self._progress is not None:
            self._progress.set_phase(phase, message)

    def _emit_update(self, completed: int, message: str = "") -> None:
        """Emit progress update if callback available."""
        if self._progress is not None:
            self._progress.update(completed, message)

    def _emit_complete(self, message: str = "") -> None:
        """Emit completion if callback available."""
        if self._progress is not None:
            self._progress.complete(message)

    # ===== Phase 8.2: Streaming Analysis for Memory Efficiency =====

    def analyze_streaming(
        self,
        file_path: str,
        system_name: Optional[str] = None,
        system_type: str = "",
        architecture: str = "",
        grid_size: Optional[int] = None
    ) -> PixelRTSBlueprint:
        """
        Analyze binary file using streaming mode for memory efficiency.

        This method reads the file in chunks to avoid loading the entire
        file into memory. Ideal for large files (> 50MB).

        Args:
            file_path: Path to binary file to analyze
            system_name: Optional system name (defaults to filename)
            system_type: Optional system type
            architecture: Optional architecture
            grid_size: Optional grid size for Hilbert calculation

        Returns:
            PixelRTSBlueprint with detected components

        Raises:
            FileNotFoundError: If file_path doesn't exist
        """
        path = Path(file_path)
        if not path.exists():
            raise FileNotFoundError(f"File not found: {file_path}")

        # Default system name to filename stem
        if system_name is None:
            system_name = path.stem

        # Get file size for grid calculation
        file_size = path.stat().st_size

        # Calculate grid size if not provided
        if grid_size is None:
            from .pixelrts_v2_core import calculate_grid_size
            grid_size = calculate_grid_size(file_size)

        blueprint = PixelRTSBlueprint(
            system_name=system_name,
            system_type=system_type,
            architecture=architecture
        )

        # Check if file is large enough for streaming mode
        file_size_mb = file_size / (1024 * 1024)
        if file_size_mb >= self.streaming_threshold_mb:
            # Use full streaming analysis
            self._analyze_streaming_entropy(path, blueprint, grid_size, file_size)
        else:
            # For smaller files, read normally (more efficient)
            data = path.read_bytes()
            if self.is_elf_binary(data) and ELFTOOLS_AVAILABLE:
                self._analyze_elf_structure(data, blueprint, grid_size)
            else:
                self._analyze_by_entropy(data, blueprint, grid_size)

        # Infer memory map
        blueprint.memory_map = self._infer_memory_map_from_file(path)

        return blueprint

    def _analyze_streaming_entropy(
        self,
        file_path: Path,
        blueprint: PixelRTSBlueprint,
        grid_size: int,
        file_size: int
    ):
        """
        Perform entropy analysis using streaming chunk reads.

        This method processes the file in chunks to keep memory usage low.
        Entropy is calculated incrementally and regions are merged.

        Args:
            file_path: Path to file
            blueprint: Blueprint to populate
            grid_size: Grid size for Hilbert mapping
            file_size: Total file size in bytes
        """
        # Create Hilbert curve for coordinate mapping
        hilbert = HilbertCurve(order=int(math.log2(grid_size)))

        # Read file in chunks and compute entropy regions
        entropy_regions = []
        offset = 0

        with open(file_path, 'rb') as f:
            while offset < file_size:
                # Read chunk
                chunk_size = min(self.streaming_chunk_size, file_size - offset)
                chunk = f.read(chunk_size)

                if not chunk:
                    break

                # Calculate entropy for chunk
                chunk_regions = self._calculate_chunk_entropy(
                    chunk, offset, self.entropy_window_size
                )
                entropy_regions.extend(chunk_regions)

                offset += len(chunk)

                # Report progress if callback available
                if self._progress:
                    progress = offset / file_size
                    self._progress('analyzing', progress, f"Analyzed {offset}/{file_size} bytes")

        # Merge adjacent regions with same profile
        merged_regions = self._merge_entropy_regions(entropy_regions)

        # Create components from merged regions
        for i, region in enumerate(merged_regions):
            try:
                pixel_start = hilbert.index_to_coord(
                    region.offset // 4 % (grid_size * grid_size)
                )
                pixel_end = hilbert.index_to_coord(
                    (region.offset + region.size) // 4 % (grid_size * grid_size)
                )
            except (IndexError, ValueError):
                pixel_start = (0, 0)
                pixel_end = (0, 0)

            component = Component(
                id=f"region_{i}",
                type=ComponentType.DATA,
                description=f"Data region {i} ({region.entropy_profile} entropy)",
                hilbert_range=HilbertRange(
                    start_index=region.offset // 4,
                    end_index=(region.offset + region.size) // 4,
                    pixel_start=pixel_start,
                    pixel_end=pixel_end
                ),
                entropy_profile=region.entropy_profile,
                visual_hint=self._entropy_to_visual_hint(region.entropy_profile)
            )
            blueprint.components.append(component)

    def _calculate_chunk_entropy(
        self,
        chunk: bytes,
        base_offset: int,
        window_size: int
    ) -> List[EntropyRegion]:
        """
        Calculate entropy regions for a chunk of data.

        Args:
            chunk: Data chunk to analyze
            base_offset: Base offset of this chunk in the file
            window_size: Window size for entropy calculation

        Returns:
            List of entropy regions within this chunk
        """
        regions = []
        chunk_offset = 0

        while chunk_offset < len(chunk):
            window_end = min(chunk_offset + window_size, len(chunk))
            window = chunk[chunk_offset:window_end]

            if len(window) > 0:
                entropy = self._calculate_entropy(window)
                profile = self._entropy_to_profile(entropy)

                regions.append(EntropyRegion(
                    offset=base_offset + chunk_offset,
                    size=len(window),
                    entropy=entropy,
                    entropy_profile=profile
                ))

            chunk_offset += window_size

        return regions

    def _merge_entropy_regions(
        self,
        regions: List[EntropyRegion]
    ) -> List[EntropyRegion]:
        """
        Merge adjacent entropy regions with the same profile.

        This reduces the number of components and improves memory efficiency.

        Args:
            regions: List of entropy regions to merge

        Returns:
            Merged list of entropy regions
        """
        if not regions:
            return []

        merged = [regions[0]]

        for region in regions[1:]:
            last = merged[-1]

            # Merge if adjacent and same profile
            if (last.entropy_profile == region.entropy_profile and
                last.offset + last.size == region.offset):
                # Extend last region
                last.size += region.size
                # Update weighted average entropy
                total_bytes = last.size
                last.entropy = (
                    (last.entropy * (last.size - region.size) + region.entropy * region.size)
                    / total_bytes
                )
            else:
                # Add new region
                merged.append(region)

        return merged

    def _infer_memory_map_from_file(self, file_path: Path) -> List[MemoryRegion]:
        """
        Infer memory regions from file path and basic structure.

        Args:
            file_path: Path to binary file

        Returns:
            List of memory regions
        """
        regions = []

        # Default regions
        regions.append(MemoryRegion(region=".text", permissions="rx"))
        regions.append(MemoryRegion(region=".data", permissions="rw"))
        regions.append(MemoryRegion(region=".rodata", permissions="r"))

        return regions

    def _stream_file_chunks(
        self,
        file_path: Path,
        chunk_size: Optional[int] = None
    ) -> Iterator[bytes]:
        """
        Stream file contents as chunks.

        Args:
            file_path: Path to file
            chunk_size: Chunk size (defaults to streaming_chunk_size)

        Yields:
            Chunks of file data
        """
        if chunk_size is None:
            chunk_size = self.streaming_chunk_size

        with open(file_path, 'rb') as f:
            while True:
                chunk = f.read(chunk_size)
                if not chunk:
                    break
                yield chunk
