"""
GPU-accelerated PixelRTS encoder/decoder using PyTorch CUDA.
Provides significant speedup for large files on NVIDIA GPUs.
"""

from pathlib import Path
from typing import Optional
import hashlib
import json

try:
    import torch
    TORCH_AVAILABLE = True
except ImportError:
    TORCH_AVAILABLE = False
    torch = None

try:
    import numpy as np
except ImportError:
    raise ImportError("numpy required: pip install numpy")

try:
    from PIL import Image
    from PIL import PngImagePlugin
    from io import BytesIO
except ImportError:
    raise ImportError("Pillow required: pip install Pillow")

from .pixelrts_v2_core import (
    PixelRTSMetadata,
    calculate_grid_size,
    HilbertCurve
)


class GPUPixelRTSEncoder:
    """
    GPU-accelerated encoder using PyTorch CUDA.

    Falls back to CPU if CUDA is not available.
    """

    def __init__(self, mode: str = "standard", device: Optional[str] = None):
        """
        Initialize GPU encoder.

        Args:
            mode: Encoding mode ("standard" or "code")
            device: Device to use ("cuda", "cpu", or None for auto-detect)
        """
        if not TORCH_AVAILABLE:
            raise ImportError("PyTorch required for GPU encoder: pip install torch")

        self.mode = mode

        if device is None:
            self.device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
        else:
            self.device = torch.device(device)

        # Initialize Hilbert curve (CPU-side)
        self._hilbert_cache = {}

    def _get_hilbert_lut(self, grid_size: int):
        """
        Get or create Hilbert LUT for grid size.

        Args:
            grid_size: Grid size (power of 2)

        Returns:
            Hilbert curve LUT as list of (x, y) tuples
        """
        if grid_size not in self._hilbert_cache:
            order = int(np.log2(grid_size))
            hilbert = HilbertCurve(order=order)
            self._hilbert_cache[grid_size] = hilbert.generate_lut()
        return self._hilbert_cache[grid_size]

    def encode(
        self,
        data: bytes,
        metadata: Optional[dict] = None,
        grid_size: Optional[int] = None
    ) -> bytes:
        """
        Encode binary data to PNG using GPU acceleration.

        Args:
            data: Binary data to encode
            metadata: Optional metadata dict
            grid_size: Explicit grid size (auto-calculated if None)

        Returns:
            PNG image as bytes
        """
        # Calculate grid size
        if grid_size is None:
            grid_size = calculate_grid_size(len(data))

        # Verify grid size is power of 2
        if grid_size & (grid_size - 1) != 0:
            raise ValueError(f"Grid size must be power of 2, got {grid_size}")

        # Get Hilbert LUT
        lut = self._get_hilbert_lut(grid_size)

        # Convert data to bytes tensor
        data_len = len(data)
        pixels_needed = (data_len + 3) // 4

        # Pad data to multiple of 4
        padded_len = pixels_needed * 4
        padded_data = data + b'\x00' * (padded_len - data_len)

        # Create tensor on GPU (make a copy to avoid non-writable buffer warning)
        data_tensor = torch.tensor(
            list(padded_data),
            dtype=torch.uint8,
            device=self.device
        )

        # Reshape to (pixels_needed, 4)
        data_tensor = data_tensor.view(-1, 4)

        # Create pixel array on GPU
        pixel_array = torch.zeros(
            (grid_size, grid_size, 4),
            dtype=torch.uint8,
            device=self.device
        )

        # Apply Hilbert mapping
        # For GPU acceleration, we use vectorized indexing where possible
        # The Hilbert LUT provides coordinates for each pixel index
        for pixel_idx in range(min(pixels_needed, len(lut))):
            x, y = lut[pixel_idx]
            pixel_array[y, x, :] = data_tensor[pixel_idx]

        # Transfer to CPU for PIL
        pixel_array_cpu = pixel_array.cpu().numpy()

        # Create PNG image
        image = Image.fromarray(pixel_array_cpu, mode='RGBA')

        # Prepare metadata
        if metadata is None:
            metadata = {}

        encoding_mode = "RGBA-dense" if self.mode == "standard" else "RGBA-code"
        full_metadata = PixelRTSMetadata.create_metadata(
            grid_size=grid_size,
            encoding_mode=encoding_mode,
            segments=metadata.get("segments")
        )

        # Add custom fields
        for key, value in metadata.items():
            if key not in full_metadata or key == "segments":
                if key == "version":
                    full_metadata["content_version"] = value
                else:
                    full_metadata[key] = value

        full_metadata["data_size"] = data_len
        full_metadata["data_hash"] = hashlib.sha256(data).hexdigest()
        full_metadata["encoding_mode"] = encoding_mode
        full_metadata["gpu_encoded"] = True

        # Save PNG with metadata
        buffer = BytesIO()
        metadata_text = PixelRTSMetadata.encode_png_text(full_metadata).decode("utf-8")
        pnginfo = PngImagePlugin.PngInfo()
        pnginfo.add_text("PixelRTS", metadata_text)

        image.save(buffer, format='PNG', pnginfo=pnginfo)

        self._last_metadata = full_metadata
        return buffer.getvalue()

    def save(
        self,
        data: bytes,
        output_path: str,
        metadata: Optional[dict] = None,
        grid_size: Optional[int] = None
    ):
        """
        Encode and save to file.

        Args:
            data: Binary data to encode
            output_path: Output PNG file path
            metadata: Optional metadata dict
            grid_size: Explicit grid size
        """
        png_bytes = self.encode(data, metadata, grid_size)

        with open(output_path, 'wb') as f:
            f.write(png_bytes)

        # Save sidecar
        metadata = self.get_metadata()
        if metadata:
            if output_path.endswith('.png'):
                sidecar_path = output_path.replace('.png', '.meta.json')
            else:
                sidecar_path = output_path + '.meta.json'

            with open(sidecar_path, 'w') as f:
                json.dump(metadata, f, indent=2)

    def get_metadata(self) -> dict:
        """Get metadata from last encode operation."""
        return getattr(self, '_last_metadata', None)


class GPUPixelRTSDecoder:
    """
    GPU-accelerated decoder using PyTorch CUDA.
    """

    def __init__(self, device: Optional[str] = None):
        """
        Initialize GPU decoder.

        Args:
            device: Device to use ("cuda", "cpu", or None for auto-detect)
        """
        if not TORCH_AVAILABLE:
            raise ImportError("PyTorch required for GPU decoder: pip install torch")

        if device is None:
            self.device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
        else:
            self.device = torch.device(device)

        self._hilbert_cache = {}
        self._metadata = None

    def _get_hilbert_lut(self, grid_size: int):
        """
        Get or create Hilbert LUT for grid size.

        Args:
            grid_size: Grid size (power of 2)

        Returns:
            Hilbert curve LUT as list of (x, y) tuples
        """
        if grid_size not in self._hilbert_cache:
            order = int(np.log2(grid_size))
            hilbert = HilbertCurve(order=order)
            self._hilbert_cache[grid_size] = hilbert.generate_lut()
        return self._hilbert_cache[grid_size]

    def decode(self, png_data: bytes, expected_size: Optional[int] = None) -> bytes:
        """
        Decode binary data from PNG using GPU acceleration.

        Args:
            png_data: PNG image bytes
            expected_size: Expected data size (for validation)

        Returns:
            Decoded binary data
        """
        # Load PNG image
        image = Image.open(BytesIO(png_data))

        # Extract metadata
        if self._metadata is None:
            for key, value in image.text.items():
                if "PixelRTS" in key or "PixelRTS" in value:
                    try:
                        self._metadata = PixelRTSMetadata.decode_png_text(value.encode("utf-8"))
                        break
                    except ValueError:
                        continue

        # Get image dimensions
        width, height = image.size
        grid_size = width

        # Get Hilbert LUT
        lut = self._get_hilbert_lut(grid_size)

        # Transfer pixel array to GPU
        pixel_array = np.array(image, dtype=np.uint8)
        pixel_tensor = torch.from_numpy(pixel_array).to(self.device)

        # Determine data size
        if self._metadata and "data_size" in self._metadata:
            max_pixels = (self._metadata["data_size"] + 3) // 4
        elif expected_size:
            max_pixels = (expected_size + 3) // 4
        else:
            max_pixels = len(lut)

        # Decode using inverse Hilbert mapping
        # For better GPU performance, we collect all pixels at once
        pixel_tensors = []

        for pixel_idx in range(max_pixels):
            x, y = lut[pixel_idx]
            pixel_tensors.append(pixel_tensor[y, x, :])

        # Stack and flatten
        if pixel_tensors:
            stacked = torch.stack(pixel_tensors)
            flattened = stacked.flatten().cpu().numpy()
            data = flattened.tobytes()
        else:
            data = b''

        # Trim to expected size
        if self._metadata and "data_size" in self._metadata:
            data = data[:self._metadata["data_size"]]
        elif expected_size:
            data = data[:expected_size]

        return data

    def load(self, input_path: str, verify_hash: bool = False) -> bytes:
        """
        Load and decode PNG file.

        Args:
            input_path: Input PNG file path
            verify_hash: Whether to verify SHA256 hash

        Returns:
            Decoded binary data

        Raises:
            ValueError: If hash verification fails
        """
        input_path = Path(input_path)

        # Try to load sidecar metadata
        meta_path = Path(str(input_path) + '.meta.json')
        if meta_path.exists():
            with open(meta_path, 'r') as f:
                self._metadata = json.load(f)

        with open(input_path, 'rb') as f:
            png_data = f.read()

        data = self.decode(png_data)

        # Verify hash
        if verify_hash and self._metadata and 'data_hash' in self._metadata:
            expected_hash = self._metadata['data_hash']
            actual_hash = hashlib.sha256(data).hexdigest()
            if actual_hash != expected_hash:
                raise ValueError(f"Hash mismatch: expected {expected_hash}, got {actual_hash}")

        return data

    def get_metadata(self) -> dict:
        """Get metadata from last decode operation."""
        return self._metadata


def is_gpu_available() -> bool:
    """
    Check if GPU acceleration is available.

    Returns:
        True if PyTorch with CUDA is available
    """
    if not TORCH_AVAILABLE:
        return False
    return torch.cuda.is_available()


def get_device_info() -> dict:
    """
    Get information about available GPU devices.

    Returns:
        Dictionary with device information
    """
    if not TORCH_AVAILABLE:
        return {
            "available": False,
            "reason": "PyTorch not installed"
        }

    if not torch.cuda.is_available():
        return {
            "available": False,
            "reason": "CUDA not available"
        }

    return {
        "available": True,
        "device_count": torch.cuda.device_count(),
        "device_name": torch.cuda.get_device_name(0),
        "device_capability": torch.cuda.get_device_capability(0),
        "memory_total": torch.cuda.get_device_properties(0).total_memory,
        "memory_total_gb": torch.cuda.get_device_properties(0).total_memory / (1024**3)
    }
