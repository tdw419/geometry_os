"""
PixelRTS Diff Engine
Compares two .rts.png files and extracts byte-level differences.
"""

import numpy as np
from typing import Dict, Optional, Any, List
from pathlib import Path
import logging

# Import decoder from existing module
try:
    from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder, HilbertCurve
except ImportError:
    from pixelrts_v2_core import PixelRTSDecoder, HilbertCurve

# Import scipy.ndimage for region labeling (graceful fallback)
try:
    from scipy import ndimage
    SCIPY_AVAILABLE = True
except ImportError:
    SCIPY_AVAILABLE = False

logger = logging.getLogger(__name__)


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

    def _get_regions(self, diff_mask: np.ndarray, grid_size: int) -> List[Dict[str, Any]]:
        """
        Map changed byte indices to Hilbert coordinates and group into connected regions.

        Args:
            diff_mask: Boolean numpy array where True indicates a changed byte
            grid_size: Size of the Hilbert grid (e.g., 256 for a 256x256 grid)

        Returns:
            List of region dicts sorted by pixel_count descending.
            Each region contains:
                - id: "R1", "R2", etc.
                - x_min, x_max, y_min, y_max (int)
                - pixel_count (int)
                - byte_count (pixel_count * 4, approximate)
        """
        if not SCIPY_AVAILABLE:
            logger.warning("scipy.ndimage not available, returning empty regions list")
            return []

        # No changes, no regions
        if not np.any(diff_mask):
            return []

        # Calculate Hilbert order from grid_size
        # grid_size = 2^order, so order = log2(grid_size)
        order = int(np.log2(grid_size))

        # Create HilbertCurve instance and generate LUT
        hilbert = HilbertCurve(order)
        lut = hilbert.generate_lut()

        # Create 2D boolean pixel_mask array
        pixel_mask = np.zeros((grid_size, grid_size), dtype=bool)

        # Map changed byte indices to Hilbert coordinates
        changed_indices = np.where(diff_mask)[0]

        for byte_idx in changed_indices:
            # Each pixel stores 4 bytes (RGBA), so pixel_idx = byte_idx // 4
            pixel_idx = byte_idx // 4

            # Guard against index out of bounds
            if pixel_idx >= len(lut):
                continue

            # Look up (x, y) from Hilbert LUT
            x, y = lut[pixel_idx]

            # Bounds check (should always pass if lut is correct size)
            if x < grid_size and y < grid_size:
                pixel_mask[y, x] = True

        # Use scipy.ndimage.label to find connected regions
        labeled, num_features = ndimage.label(pixel_mask)

        # Cap at 100 regions to prevent memory issues
        max_regions = min(num_features, 100)

        regions = []
        for i in range(1, max_regions + 1):
            # Extract coordinates for this region
            coords = np.where(labeled == i)
            if len(coords[0]) == 0:
                continue

            y_coords = coords[0]
            x_coords = coords[1]

            region = {
                'id': f"R{i}",
                'x_min': int(np.min(x_coords)),
                'x_max': int(np.max(x_coords)),
                'y_min': int(np.min(y_coords)),
                'y_max': int(np.max(y_coords)),
                'pixel_count': int(len(x_coords)),
                'byte_count': int(len(x_coords) * 4)  # Approximate: 4 bytes per pixel
            }
            regions.append(region)

        # Sort by pixel_count descending
        regions.sort(key=lambda r: r['pixel_count'], reverse=True)

        return regions

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
                'new_metadata': new_metadata,
                'old_grid_size': 256,
                'new_grid_size': 256,
                'grid_size_used': 256,
                'channel_stats': {
                    'per_channel': {'R': {'changed': 0, 'mean_delta': 0.0},
                                    'G': {'changed': 0, 'mean_delta': 0.0},
                                    'B': {'changed': 0, 'mean_delta': 0.0},
                                    'A': {'changed': 0, 'mean_delta': 0.0}},
                    'most_changed_channel': 'R',
                    'least_changed_channel': 'R'
                },
                'old_bytes': np.array([], dtype=np.uint8),
                'new_bytes': np.array([], dtype=np.uint8),
                'changed_regions': []
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

        # Use max of both grid sizes for region calculation
        grid_size_used = max(old_grid_size, new_grid_size)

        # Compute channel statistics
        channel_stats = self._compute_channel_stats(diff_mask, old_array, new_array)

        # Compute changed regions using Hilbert mapping
        changed_regions = self._get_regions(diff_mask, grid_size_used)

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
            'new_grid_size': new_grid_size,
            'grid_size_used': grid_size_used,
            'channel_stats': channel_stats,
            'old_bytes': old_array,
            'new_bytes': new_array,
            'changed_regions': changed_regions
        }

    def _compute_channel_stats(self, diff_mask: np.ndarray, old_arr: np.ndarray, new_arr: np.ndarray) -> dict:
        """
        Compute per-channel (RGBA) statistics for changed bytes.

        Args:
            diff_mask: Boolean array where True indicates a difference
            old_arr: Old byte array (padded to match new_arr length)
            new_arr: New byte array (padded to match old_arr length)

        Returns:
            Dictionary containing:
                - per_channel: dict mapping channel name to {changed: int, mean_delta: float}
                - most_changed_channel: channel name with most changes
                - least_changed_channel: channel name with fewest changes
        """
        channels = ['R', 'G', 'B', 'A']
        per_channel = {}

        for channel_idx, channel_name in enumerate(channels):
            # Get mask for bytes at this channel position (every 4th byte starting at channel_idx)
            byte_positions = np.arange(len(diff_mask))
            channel_mask = (byte_positions % 4) == channel_idx

            # Combine with diff_mask to find changed bytes in this channel
            changed_in_channel = diff_mask & channel_mask

            # Count changed bytes in this channel
            changed_count = int(np.sum(changed_in_channel))

            # Calculate mean absolute change for changed bytes
            if changed_count > 0:
                old_values = old_arr[changed_in_channel].astype(np.float64)
                new_values = new_arr[changed_in_channel].astype(np.float64)
                mean_delta = float(np.mean(np.abs(new_values - old_values)))
            else:
                mean_delta = 0.0

            per_channel[channel_name] = {
                'changed': changed_count,
                'mean_delta': mean_delta
            }

        # Find most and least changed channels
        changed_counts = {ch: per_channel[ch]['changed'] for ch in channels}
        most_changed = max(channels, key=lambda ch: changed_counts[ch])
        least_changed = min(channels, key=lambda ch: changed_counts[ch])

        return {
            'per_channel': per_channel,
            'most_changed_channel': most_changed,
            'least_changed_channel': least_changed
        }
