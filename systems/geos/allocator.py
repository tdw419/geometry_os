"""
Geometry OS Spatial Allocator
Manages VRAM allocation using Hilbert space bitmap logic.
"""

from typing import Dict, List, Optional, Tuple
import numpy as np
from .core import hilbert_d2xy, hilbert_xy2d

class SpatialAllocator:
    """Manages spatial allocation in the 4096x4096 VRAM stratum."""
    
    def __init__(self, grid_size: int = 4096, page_size: int = 4096):
        self.grid_size = grid_size
        self.page_size = page_size
        self.total_pages = (grid_size * grid_size) // page_size
        
        # Free space bitmap (0.0 = free, 1.0 = occupied)
        self.bitmap = np.zeros(self.total_pages, dtype=np.float32)
        
        # Reserved regions
        self.reserve_page(0) # Window Manager
        
    def reserve_page(self, page_idx: int):
        """Mark a specific page as occupied."""
        if 0 <= page_idx < self.total_pages:
            self.bitmap[page_idx] = 1.0
            
    def allocate(self, num_pages: int = 1) -> Optional[int]:
        """Find and allocate contiguous pages. Returns base Hilbert index."""
        # Simplified: find first free block
        for i in range(self.total_pages - num_pages + 1):
            if np.all(self.bitmap[i:i+num_pages] == 0.0):
                self.bitmap[i:i+num_pages] = 1.0
                return i * self.page_size
        return None
        
    def free(self, base_addr: int, num_pages: int = 1):
        """Free a block of pages."""
        page_idx = base_addr // self.page_size
        if 0 <= page_idx < self.total_pages:
            self.bitmap[page_idx:page_idx+num_pages] = 0.0
            
    def get_status(self) -> Dict:
        """Get allocation statistics."""
        occupied = np.sum(self.bitmap)
        return {
            "total_pages": int(self.total_pages),
            "occupied_pages": int(occupied),
            "free_pages": int(self.total_pages - occupied),
            "fragmentation": self._calculate_fragmentation(),
        }
        
    def _calculate_fragmentation(self) -> float:
        """Simple fragmentation metric."""
        if np.sum(self.bitmap) == 0: return 0.0
        # Count transitions from free to occupied
        diff = np.diff(self.bitmap)
        transitions = np.sum(np.abs(diff))
        return float(transitions / self.total_pages)

    def to_texture_coords(self, base_addr: int) -> List[Tuple[int, int]]:
        """Convert an allocated range to a list of (x, y) coordinates for the debugger."""
        coords = []
        for i in range(self.page_size):
            coords.append(hilbert_d2xy(self.grid_size, base_addr + i))
        return coords
