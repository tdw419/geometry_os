"""
PixelRTS Diff Engine
Compares two .rts.png files and extracts byte-level differences.
"""

import numpy as np
from typing import Dict, Optional, Any
from pathlib import Path

# Import decoder from existing module
try:
    from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder
except ImportError:
    from pixelrts_v2_core import PixelRTSDecoder


class PixelRTSDiffer:
    """
    Compares two .rts.png files and produces byte-level diff statistics.

    Uses PixelRTSDecoder to extract raw bytes, then computes:
    - added_bytes: bytes that are 0 in old, non-zero in new
    - removed_bytes: bytes that are non-zero in old, 0 in new
    - changed_bytes: bytes different in both (both non-zero)
    - unchanged_bytes: bytes that are the same
    """

    def __init__(self):
        """Initialize differ with decoder instance."""
        self._decoder = PixelRTSDecoder()

    def diff(self, old_path: str, new_path: str) -> Dict[str, Any]:
        """
        Compare two .rts.png files and return byte-level statistics.

        Args:
            old_path: Path to the original .rts.png file
            new_path: Path to the new/modified .rts.png file

        Returns:
            Dictionary containing:
                - old_file: path to old file
                - new_file: path to new file
                - added_bytes: count of bytes added (0 in old, non-zero in new)
                - removed_bytes: count of bytes removed (non-zero in old, 0 in new)
                - changed_bytes: count of bytes changed (both non-zero, different values)
                - unchanged_bytes: count of bytes unchanged
                - total_bytes: max length of the two files
                - change_percent: percentage of bytes changed (0-100, rounded to 2 decimals)
                - diff_mask: boolean numpy array where True = difference
                - old_metadata: metadata from old file decode
                - new_metadata: metadata from new file decode
        """
        # Read old file
        old_path_obj = Path(old_path)
        new_path_obj = Path(new_path)

        if not old_path_obj.exists():
            raise FileNotFoundError(f"Old file not found: {old_path}")
        if not new_path_obj.exists():
            raise FileNotFoundError(f"New file not found: {new_path}")

        # Read PNG bytes
        with open(old_path, 'rb') as f:
            old_png_bytes = f.read()

        with open(new_path, 'rb') as f:
            new_png_bytes = f.read()

        # Reset decoder metadata before each decode
        self._decoder._metadata = None

        # Decode old file
        old_data = self._decoder.decode(old_png_bytes)
        old_metadata = self._decoder.get_metadata()

        # Reset decoder metadata for new file
        self._decoder._metadata = None

        # Decode new file
        new_data = self._decoder.decode(new_png_bytes)
        new_metadata = self._decoder.get_metadata()

        # Handle empty files
        if len(old_data) == 0 and len(new_data) == 0:
            return {
                'old_file': str(old_path),
                'new_file': str(new_path),
                'added_bytes': 0,
                'removed_bytes': 0,
                'changed_bytes': 0,
                'unchanged_bytes': 0,
                'total_bytes': 0,
                'change_percent': 0.0,
                'diff_mask': np.array([], dtype=bool),
                'old_metadata': old_metadata,
                'new_metadata': new_metadata
            }

        # Convert to numpy arrays
        old_array = np.frombuffer(old_data, dtype=np.uint8)
        new_array = np.frombuffer(new_data, dtype=np.uint8)

        # Get total length (max of both)
        total_bytes = max(len(old_array), len(new_array))

        # Pad shorter array with zeros
        if len(old_array) < total_bytes:
            old_array = np.pad(old_array, (0, total_bytes - len(old_array)), mode='constant')
        if len(new_array) < total_bytes:
            new_array = np.pad(new_array, (0, total_bytes - len(new_array)), mode='constant')

        # Calculate diff masks
        # Added: old is 0, new is non-zero
        added_mask = (old_array == 0) & (new_array != 0)

        # Removed: old is non-zero, new is 0
        removed_mask = (old_array != 0) & (new_array == 0)

        # Changed: both non-zero and different
        changed_mask = (old_array != new_array) & (old_array != 0) & (new_array != 0)

        # Combined diff mask for downstream use
        diff_mask = added_mask | removed_mask | changed_mask

        # Count bytes in each category
        added_bytes = int(np.sum(added_mask))
        removed_bytes = int(np.sum(removed_mask))
        changed_bytes = int(np.sum(changed_mask))
        unchanged_bytes = total_bytes - added_bytes - removed_bytes - changed_bytes

        # Calculate change percentage
        if total_bytes > 0:
            change_percent = round(((added_bytes + removed_bytes + changed_bytes) / total_bytes) * 100, 2)
        else:
            change_percent = 0.0

        # Extract grid_size from metadata if available
        old_grid_size = 256  # default
        new_grid_size = 256  # default
        if old_metadata and 'grid_size' in old_metadata:
            old_grid_size = old_metadata['grid_size']
        if new_metadata and 'grid_size' in new_metadata:
            new_grid_size = new_metadata['grid_size']

        return {
            'old_file': str(old_path),
            'new_file': str(new_path),
            'added_bytes': added_bytes,
            'removed_bytes': removed_bytes,
            'changed_bytes': changed_bytes,
            'unchanged_bytes': unchanged_bytes,
            'total_bytes': total_bytes,
            'change_percent': change_percent,
            'diff_mask': diff_mask,
            'old_metadata': old_metadata,
            'new_metadata': new_metadata,
            'old_grid_size': old_grid_size,
            'new_grid_size': new_grid_size
        }
