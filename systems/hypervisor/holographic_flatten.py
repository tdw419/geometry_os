"""
3D Holographic Substrate flattening to 2D boot texture.

Uses Z-order (Morton) curve bit interleaving to fold 3D coordinates
into 2D while preserving spatial locality. This allows the Holographic
Substrate to be packed into a flat bootable texture.

For order=8: 256^3 = 16M voxels -> 4096x4096 texture

Bit interleaving pattern (3D to 24-bit Morton code, then split to x2d/y2d):
- x bits -> positions 0, 3, 6, 9, ... (mod 3 = 0)
- y bits -> positions 1, 4, 7, 10, ... (mod 3 = 1)
- z bits -> positions 2, 5, 8, 11, ... (mod 3 = 2)

The 24-bit result is split into:
- x2d = lower 12 bits (positions 0-11)
- y2d = upper 12 bits (positions 12-23)
"""

import numpy as np


def _interleave_3d(x: int, y: int, z: int, order: int) -> int:
    """
    Interleave bits from x, y, z coordinates into a single value.

    Bit positions:
    - x at 0, 3, 6, 9, ...  (every 3rd starting at 0)
    - y at 1, 4, 7, 10, ... (every 3rd starting at 1)
    - z at 2, 5, 8, 11, ... (every 3rd starting at 2)

    Args:
        x: X coordinate (order bits)
        y: Y coordinate (order bits)
        z: Z coordinate (order bits)
        order: Number of bits per coordinate

    Returns:
        Interleaved value with 3*order bits
    """
    result = 0
    for i in range(order):
        x_bit = (x >> i) & 1
        y_bit = (y >> i) & 1
        z_bit = (z >> i) & 1

        result |= (x_bit << (3 * i))
        result |= (y_bit << (3 * i + 1))
        result |= (z_bit << (3 * i + 2))

    return result


def _deinterleave_3d(value: int, order: int) -> tuple:
    """
    Deinterleave a value back to x, y, z coordinates.

    Args:
        value: Interleaved value (3*order bits)
        order: Number of bits per coordinate

    Returns:
        Tuple of (x, y, z) coordinates
    """
    x = 0
    y = 0
    z = 0

    for i in range(order):
        x_bit = (value >> (3 * i)) & 1
        y_bit = (value >> (3 * i + 1)) & 1
        z_bit = (value >> (3 * i + 2)) & 1

        x |= (x_bit << i)
        y |= (y_bit << i)
        z |= (z_bit << i)

    return x, y, z


def flatten_coordinate(x: int, y: int, z: int, order: int = 8) -> tuple:
    """
    Flatten a 3D coordinate to 2D using Z-order (Morton) curve.

    The 3D coordinate (x, y, z) is mapped to 2D (x2d, y2d) by:
    - Interleaving x, y, z bits into a 24-bit Morton code
    - Splitting into x2d (lower 12 bits) and y2d (upper 12 bits)

    This preserves spatial locality: nearby 3D points map to nearby 2D points.

    Args:
        x: X coordinate (0 to 2^order - 1)
        y: Y coordinate (0 to 2^order - 1)
        z: Z coordinate (0 to 2^order - 1)
        order: Number of bits per coordinate dimension (default 8 for 256^3)

    Returns:
        Tuple (x2d, y2d) - the flattened 2D coordinate

    Example:
        >>> flatten_coordinate(0, 0, 0, order=4)
        (0, 0)
        >>> x2d, y2d = flatten_coordinate(1, 2, 3, order=4)
        >>> 0 <= x2d < 256 and 0 <= y2d < 256
        True
    """
    # Validate inputs
    max_coord = (1 << order) - 1
    if not (0 <= x <= max_coord and 0 <= y <= max_coord and 0 <= z <= max_coord):
        raise ValueError(
            f"Coordinates must be in range [0, {max_coord}]. "
            f"Got ({x}, {y}, {z})"
        )

    # Interleave all three coordinates
    morton = _interleave_3d(x, y, z, order)

    # Split into x2d (lower half) and y2d (upper half)
    # For order=8: 24 bits -> lower 12 bits for x2d, upper 12 for y2d
    half_bits = (3 * order) // 2  # For order=8: 12 bits
    x2d = morton & ((1 << half_bits) - 1)  # Lower 12 bits
    y2d = morton >> half_bits               # Upper 12 bits

    return x2d, y2d


def unflatten_coordinate(x2d: int, y2d: int, order: int = 8) -> tuple:
    """
    Unflatten a 2D coordinate back to 3D.

    This is the inverse of flatten_coordinate, ensuring a bijective mapping
    with no data loss.

    Args:
        x2d: 2D X coordinate
        y2d: 2D Y coordinate
        order: Number of bits per coordinate dimension (default 8)

    Returns:
        Tuple (x, y, z) - the original 3D coordinate

    Example:
        >>> unflatten_coordinate(0, 0, order=4)
        (0, 0, 0)
        >>> x, y, z = 5, 7, 3
        >>> x2d, y2d = flatten_coordinate(x, y, z, order=4)
        >>> unflatten_coordinate(x2d, y2d, order=4)
        (5, 7, 3)
    """
    half_bits = (3 * order) // 2
    max_2d = (1 << half_bits) - 1

    if not (0 <= x2d <= max_2d and 0 <= y2d <= max_2d):
        raise ValueError(
            f"2D coordinates must be in range [0, {max_2d}] x [0, {max_2d}]. "
            f"Got ({x2d}, {y2d})"
        )

    # Reconstruct the Morton code
    morton = x2d | (y2d << half_bits)

    # Deinterleave to get x, y, z
    x, y, z = _deinterleave_3d(morton, order)

    return x, y, z


def calculate_output_size(order: int = 8) -> tuple:
    """
    Calculate the output 2D texture dimensions for a given order.

    For order=8 (256^3 cube):
    - 256 x 256 x 256 = 16,777,216 voxels
    - Output: 4096 x 4096 = 16,777,216 pixels

    The 3D coordinates (24 bits total) are split into two 12-bit 2D coordinates.

    Args:
        order: Number of bits per coordinate dimension (default 8)

    Returns:
        Tuple (width, height) for the output 2D texture
    """
    # For order=8: (3*8)//2 = 12 bits per 2D dimension
    half_bits = (3 * order) // 2
    size = 1 << half_bits  # 2^12 = 4096 for order=8

    return size, size


def flatten_texture(texture_3d: np.ndarray) -> np.ndarray:
    """
    Flatten a full 3D texture to 2D.

    Args:
        texture_3d: 3D numpy array of shape (depth, height, width) or
                    (Z, Y, X) in coordinate terms

    Returns:
        2D numpy array with voxels mapped according to Z-order curve

    Note:
        Input is expected to be (Z, Y, X) = (256, 256, 256) for order=8
        Output will be (4096, 4096) for order=8
    """
    if texture_3d.ndim != 3:
        raise ValueError(f"Expected 3D texture, got {texture_3d.ndim}D")

    depth, height, width = texture_3d.shape

    # Determine order from dimensions (must be power of 2)
    # For 256^3, order=8 (2^8 = 256)
    max_dim = max(depth, height, width)
    order = max_dim.bit_length() - 1 if (max_dim & (max_dim - 1)) == 0 else max_dim.bit_length()

    # Calculate output size
    out_width, out_height = calculate_output_size(order)

    # Create output texture
    texture_2d = np.zeros((out_height, out_width), dtype=texture_3d.dtype)

    # Process each voxel
    # Input is (Z, Y, X), so we iterate accordingly
    for z in range(depth):
        for y in range(height):
            for x in range(width):
                x2d, y2d = flatten_coordinate(x, y, z, order)
                texture_2d[y2d, x2d] = texture_3d[z, y, x]

    return texture_2d


if __name__ == "__main__":
    # Quick verification
    print("Holographic Flatten - Quick Verification")
    print("=" * 50)

    # Test bijectivity for a small cube
    order = 4
    print(f"\nTesting bijectivity for {2**order}^3 cube...")

    errors = 0
    for z in range(2**order):
        for y in range(2**order):
            for x in range(2**order):
                x2d, y2d = flatten_coordinate(x, y, z, order)
                x3d, y3d, z3d = unflatten_coordinate(x2d, y2d, order)
                if (x, y, z) != (x3d, y3d, z3d):
                    errors += 1
                    if errors == 1:
                        print(f"ERROR: ({x},{y},{z}) -> ({x2d},{y2d}) -> ({x3d},{y3d},{z3d})")

    if errors == 0:
        print("All coordinates round-trip correctly!")
    else:
        print(f"Found {errors} errors")

    # Show output size
    width, height = calculate_output_size(order=8)
    print("\nFor order=8 (256^3 cube):")
    print(f"  Output size: {width} x {height}")
    print(f"  Total pixels: {width * height:,}")
