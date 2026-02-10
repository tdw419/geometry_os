"""
PixelRTS Blueprint Analyzer

Analyzes binary data to generate structural blueprint metadata.
Supports ELF binary analysis and entropy-based component detection.
"""

import math
from typing import List, Dict, Optional
from dataclasses import dataclass

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

    def __init__(self):
        """Initialize blueprint analyzer."""
        self.entropy_window_size = 4096
        self.entropy_threshold_low = 2.0
        self.entropy_threshold_high = 7.5

    def is_elf_binary(self, data: bytes) -> bool:
        """
        Check if data is an ELF binary.

        Args:
            data: Binary data to check

        Returns:
            True if data has valid ELF header
        """
        return len(data) >= 4 and data[:4] == b'\x7fELF'

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
        """
        blueprint = PixelRTSBlueprint(
            system_name=system_name,
            system_type=system_type,
            architecture=architecture
        )

        # Analyze ELF structure if available
        if self.is_elf_binary(data) and ELFTOOLS_AVAILABLE:
            self._analyze_elf_structure(data, blueprint, grid_size)
        else:
            # Fallback to entropy-based analysis
            self._analyze_by_entropy(data, blueprint, grid_size)

        # Infer memory map
        blueprint.memory_map = self._infer_memory_map(data)

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
        """
        if window_size is None:
            window_size = self.entropy_window_size

        regions = []
        offset = 0

        while offset < len(data):
            window_end = min(offset + window_size, len(data))
            window = data[offset:window_end]

            if len(window) > 0:
                entropy = self._calculate_entropy(window)
                profile = self._entropy_to_profile(entropy)

                regions.append(EntropyRegion(
                    offset=offset,
                    size=len(window),
                    entropy=entropy,
                    entropy_profile=profile
                ))

            offset += window_size

        return regions

    def _calculate_entropy(self, data: bytes) -> float:
        """
        Calculate Shannon entropy of data.

        Args:
            data: Binary data

        Returns:
            Entropy value between 0 and 8
        """
        if len(data) == 0:
            return 0.0

        # Count byte frequencies
        frequencies = [0] * 256
        for byte in data:
            frequencies[byte] += 1

        # Calculate entropy
        entropy = 0.0
        data_len = len(data)

        for freq in frequencies:
            if freq > 0:
                probability = freq / data_len
                entropy -= probability * math.log2(probability)

        return entropy

    def _entropy_to_profile(self, entropy: float) -> str:
        """Convert entropy value to profile category."""
        if entropy < self.entropy_threshold_low:
            return "low"
        elif entropy < self.entropy_threshold_high:
            return "medium"
        else:
            return "high"
