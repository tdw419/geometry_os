#!/usr/bin/env python3
"""
PixelRTS v2 Extractor CLI Tool
Extracts binary data from PixelRTS v2 PNG container images.
"""

import sys
import argparse
import json
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent))

from pixelrts_v2_core import PixelRTSDecoder, PixelRTSMetadata


def main():
    parser = argparse.ArgumentParser(
        description='Extract binary data from PixelRTS v2 PNG container images',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  %(prog)s alpine.rts.png -o alpine.rts
  %(prog)s kernel.rts.png --verify
  %(prog)s container.rts.png --info
  %(prog)s data.rts.png -o output.bin --verify
        '''
    )

    parser.add_argument(
        'input',
        help='Input .rts.png file to extract'
    )

    parser.add_argument(
        '-o', '--output',
        help='Output binary file path (default: <input>.extracted)',
        default=None
    )

    parser.add_argument(
        '--verify',
        help='Verify SHA256 hash against metadata',
        action='store_true'
    )

    parser.add_argument(
        '--info',
        help='Show metadata only (do not extract)',
        action='store_true'
    )

    parser.add_argument(
        '--meta-file',
        help='Path to sidecar .meta.json file (if not auto-detected)',
        default=None
    )

    args = parser.parse_args()

    # Validate input file
    input_path = Path(args.input)
    if not input_path.exists():
        print(f"Error: Input file not found: {args.input}", file=sys.stderr)
        sys.exit(1)

    if not input_path.suffix.endswith('.png'):
        print(f"Warning: Input file does not have .png extension: {args.input}", file=sys.stderr)

    # Initialize decoder
    decoder = PixelRTSDecoder()

    # Load sidecar metadata if provided
    metadata = None
    if args.meta_file:
        meta_path = Path(args.meta_file)
        if meta_path.exists():
            with open(meta_path, 'r') as f:
                metadata = json.load(f)
                decoder.set_metadata(metadata)
        else:
            print(f"Warning: Metadata file not found: {args.meta_file}", file=sys.stderr)
    else:
        # Try to auto-detect sidecar file
        # Handle both .rts.png and .png extensions
        # For .rts.png files, metadata is at .rts.png.meta.json
        # For .png files, metadata is at .png.meta.json
        meta_path = Path(str(input_path) + '.meta.json')

        if meta_path.exists():
            with open(meta_path, 'r') as f:
                metadata = json.load(f)
                decoder.set_metadata(metadata)

    # Show metadata only
    if args.info:
        try:
            info = decoder.info(str(input_path))
            print(f"PixelRTS v2 Container Information:")
            print(f"  Format: {info.get('format', 'Unknown')}")
            print(f"  Version: {info.get('version', 'Unknown')}")
            print(f"  Grid Size: {info.get('grid_size', 'Unknown')}x{info.get('grid_size', 'Unknown')}")
            print(f"  Encoding: {info.get('encoding', {}).get('type', 'Unknown')}")
            print(f"  Data Size: {info.get('data_size', 'Unknown')} bytes")

            if 'data_hash' in info:
                print(f"  SHA256: {info['data_hash']}")

            if 'type' in info:
                print(f"  Content Type: {info['type']}")

            if 'name' in info:
                print(f"  Name: {info['name']}")

            if 'content_version' in info:
                print(f"  Content Version: {info['content_version']}")
            elif 'version' in info:
                # Show version if it's different from the format version
                if info['version'] != PixelRTSMetadata.VERSION:
                    print(f"  Content Version: {info['version']}")
                else:
                    print(f"  Format Version: {info['version']}")

            if 'description' in info:
                print(f"  Description: {info['description']}")

            sys.exit(0)
        except Exception as e:
            print(f"Error reading metadata: {e}", file=sys.stderr)
            sys.exit(1)

    # Determine output path
    output_path = args.output
    if output_path is None:
        output_path = str(input_path) + '.extracted'

    # Extract data
    try:
        data = decoder.load(str(input_path), verify_hash=args.verify)
    except ValueError as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Error extracting data: {e}", file=sys.stderr)
        sys.exit(1)

    # Print hash verification result if requested
    if args.verify and metadata and 'data_hash' in metadata:
        expected_hash = metadata['data_hash']
        actual_hash = PixelRTSMetadata.hash_data(data)
        print(f"Hash verification passed: {actual_hash}")

    # Write output
    try:
        with open(output_path, 'wb') as f:
            f.write(data)
        print(f"Extracted {len(data)} bytes to {output_path}")
    except Exception as e:
        print(f"Error writing output: {e}", file=sys.stderr)
        sys.exit(1)

    sys.exit(0)


if __name__ == '__main__':
    main()
