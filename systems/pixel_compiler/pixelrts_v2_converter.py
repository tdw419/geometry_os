#!/usr/bin/env python3
"""
PixelRTS v2 Converter CLI
Converts binary files to .rts.png visual container format.

Usage:
    pixelrts_v2_converter.py <input> <output.rts.png> [options]

Examples:
    python3 pixelrts_v2_converter.py kernel.bin kernel.rts.png
    python3 pixelrts_v2_converter.py module.wasm module.rts.png --mode code
    python3 pixelrts_v2_converter.py os.img os.rts.png --type os --name "Geometry OS"
"""

import sys
import argparse
import json
import hashlib
from pathlib import Path
from typing import Optional

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent))

from pixelrts_v2_core import (
    PixelRTSEncoder,
    PixelRTSMetadata,
    calculate_grid_size
)


def calculate_data_hash(input_path: str) -> str:
    """Calculate SHA256 hash of input file."""
    sha256 = hashlib.sha256()
    with open(input_path, 'rb') as f:
        for chunk in iter(lambda: f.read(8192), b''):
            sha256.update(chunk)
    return sha256.hexdigest()


def create_metadata_dict(
    input_path: str,
    content_type: Optional[str],
    name: Optional[str],
    version: Optional[str],
    description: Optional[str]
) -> dict:
    """Create metadata dictionary for encoding."""
    metadata = {}

    # Add provided metadata
    if content_type:
        metadata['type'] = content_type
    if name:
        metadata['name'] = name
    if version:
        metadata['version'] = version
    if description:
        metadata['description'] = description

    # Create segment info
    data_hash = calculate_data_hash(input_path)
    file_size = Path(input_path).stat().st_size

    segment_name = name or Path(input_path).stem
    metadata['segments'] = {
        segment_name: {
            'type': content_type or 'binary',
            'size': file_size,
            'sha256': data_hash
        }
    }

    # Add version to segment if provided
    if version:
        metadata['segments'][segment_name]['version'] = version

    # Add description to segment if provided
    if description:
        metadata['segments'][segment_name]['description'] = description

    return metadata


def save_sidecar_metadata(output_path: str, metadata: dict, encoder_metadata: dict):
    """
    Save sidecar .meta.json file.

    Args:
        output_path: Path to output PNG file
        metadata: User-provided metadata
        encoder_metadata: Metadata from encoder
    """
    meta_path = output_path + '.meta.json'

    # Combine metadata
    sidecar = {
        **encoder_metadata,
        'user_metadata': metadata
    }

    with open(meta_path, 'w') as f:
        json.dump(sidecar, f, indent=2)

    print(f"Sidecar metadata saved to: {meta_path}")


def validate_grid_size(value: str) -> int:
    """Validate grid size is power of 2."""
    ivalue = int(value)
    if ivalue <= 0:
        raise argparse.ArgumentTypeError(f"Grid size must be positive, got {ivalue}")
    if ivalue & (ivalue - 1) != 0:
        raise argparse.ArgumentTypeError(f"Grid size must be power of 2, got {ivalue}")
    return ivalue


def main():
    """Main entry point for converter CLI."""
    parser = argparse.ArgumentParser(
        description='Convert binary files to PixelRTS v2 .rts.png visual containers',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Basic conversion
  %(prog)s kernel.bin kernel.rts.png

  # Convert WASM with code mode
  %(prog)s module.wasm module.rts.png --mode code

  # Convert with metadata
  %(prog)s os.img os.rts.png --type os --name "Geometry OS" --version 1.0

  # Convert with explicit grid size
  %(prog)s data.bin data.rts.png --grid-size 2048
        """
    )

    parser.add_argument(
        'input',
        help='Input binary file path'
    )

    parser.add_argument(
        'output',
        help='Output .rts.png file path'
    )

    parser.add_argument(
        '--mode',
        choices=['standard', 'code'],
        default='standard',
        help='Encoding mode (default: standard)'
    )

    parser.add_argument(
        '--type',
        help='Content type (kernel, os, wasm, binary, etc.)'
    )

    parser.add_argument(
        '--name',
        help='Content name'
    )

    parser.add_argument(
        '--version',
        help='Content version'
    )

    parser.add_argument(
        '--description',
        help='Content description'
    )

    parser.add_argument(
        '--grid-size',
        type=validate_grid_size,
        help='Explicit grid size (power of 2, e.g., 512, 1024, 2048)'
    )

    parser.add_argument(
        '-v', '--verbose',
        action='store_true',
        help='Enable verbose output'
    )

    args = parser.parse_args()

    # Validate input file exists
    input_path = Path(args.input)
    if not input_path.exists():
        print(f"Error: Input file not found: {args.input}", file=sys.stderr)
        return 1

    if not input_path.is_file():
        print(f"Error: Input path is not a file: {args.input}", file=sys.stderr)
        return 1

    # Validate output path extension
    output_path = Path(args.output)
    if not output_path.suffix == '.png':
        print(f"Warning: Output file should have .png extension (recommended: .rts.png)")

    # Read input data
    if args.verbose:
        print(f"Reading input file: {args.input}")

    with open(input_path, 'rb') as f:
        data = f.read()

    data_size = len(data)
    if args.verbose:
        print(f"Input size: {data_size} bytes ({data_size / 1024:.2f} KB)")

    # Create metadata
    metadata = create_metadata_dict(
        args.input,
        args.type,
        args.name,
        args.version,
        args.description
    )

    # Calculate grid size if not specified
    if args.grid_size:
        grid_size = args.grid_size
    else:
        grid_size = calculate_grid_size(data_size)
        if args.verbose:
            print(f"Auto-calculated grid size: {grid_size}x{grid_size}")

    # Verify data fits in grid
    max_capacity = grid_size * grid_size * 4  # 4 bytes per pixel
    if data_size > max_capacity:
        print(f"Error: Data size ({data_size}) exceeds grid capacity ({max_capacity})", file=sys.stderr)
        print(f"Use --grid-size {grid_size * 2} for larger capacity", file=sys.stderr)
        return 1

    # Create encoder
    if args.verbose:
        print(f"Encoding mode: {args.mode}")
        print(f"Grid size: {grid_size}x{grid_size}")

    encoder = PixelRTSEncoder(mode=args.mode)

    # Encode data
    try:
        if args.verbose:
            print("Encoding data...")

        png_bytes = encoder.encode(
            data,
            metadata=metadata,
            grid_size=grid_size
        )

        if args.verbose:
            print("Encoding complete.")

    except ValueError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1

    # Save PNG file
    try:
        if args.verbose:
            print(f"Saving to: {args.output}")

        with open(args.output, 'wb') as f:
            f.write(png_bytes)

        print(f"Successfully created: {args.output}")

    except IOError as e:
        print(f"Error: Failed to write output file: {e}", file=sys.stderr)
        return 1

    # Save sidecar metadata
    try:
        encoder_metadata = encoder.get_metadata()
        if encoder_metadata:
            save_sidecar_metadata(args.output, metadata, encoder_metadata)
        else:
            print("Warning: No metadata generated by encoder")

    except Exception as e:
        print(f"Warning: Failed to save sidecar metadata: {e}", file=sys.stderr)

    # Print summary
    print(f"\nSummary:")
    print(f"  Input:  {args.input} ({data_size} bytes)")
    print(f"  Output: {args.output}")
    print(f"  Grid:   {grid_size}x{grid_size}")
    print(f"  Mode:   {args.mode}")
    print(f"  Hash:   {metadata['segments'][metadata.get('name', input_path.stem)]['sha256']}")

    return 0


if __name__ == '__main__':
    sys.exit(main())
