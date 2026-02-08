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


def generate_boot_script(
    png_path: str,
    metadata: dict,
    output_path: str = None,
    qemu_arch: str = "x86_64",
    qemu_memory: str = "2G",
    qemu_cpu: str = "host",
    kernel_cmdline: str = None
) -> str:
    """
    Generate QEMU boot script for .rts.png file.

    Args:
        png_path: Path to .rts.png file
        metadata: Metadata dictionary from encoder
        output_path: Path for boot script (default: png_path + '.boot.sh')
        qemu_arch: QEMU architecture (x86_64, aarch64, riscv64)
        qemu_memory: Memory size for QEMU (e.g., 2G, 4G)
        qemu_cpu: CPU type for QEMU (default: host)
        kernel_cmdline: Optional kernel command line

    Returns:
        Path to generated boot script
    """
    if output_path is None:
        output_path = png_path + '.boot.sh'

    # Determine QEMU binary
    qemu_binary_map = {
        "x86_64": "qemu-system-x86_64",
        "aarch64": "qemu-system-aarch64",
        "riscv64": "qemu-system-riscv64",
        "arm": "qemu-system-arm",
        "ppc64": "qemu-system-ppc64"
    }

    qemu_binary = qemu_binary_map.get(qemu_arch, f"qemu-system-{qemu_arch}")

    # Get content type and version from metadata
    content_type = metadata.get('type', 'binary')
    content_name = metadata.get('name', 'data')
    content_version = metadata.get('content_version') or metadata.get('version', '')

    # Build kernel command line
    if kernel_cmdline is None:
        # Default command line based on content type
        if content_type == 'kernel':
            kernel_cmdline = "console=ttyS0 earlyprintk=serial"
        elif content_type == 'os':
            kernel_cmdline = "root=/dev/sda1 console=ttyS0"
        else:
            kernel_cmdline = ""

    # Generate boot script
    script_lines = [
        "#!/bin/bash",
        "#",
        f"# PixelRTS v2 Boot Script",
        f"# Generated for: {content_name}",
        f"# Architecture: {qemu_arch}",
        f"# Content Type: {content_type}",
        "#",
        "",
        "set -e",
        "",
        "# Configuration",
        f"PNG_FILE=\"$(dirname \"$0\")/{Path(png_path).name}\"",
        f"EXTRACTED_DIR=\"/tmp/pixelrts_$(basename \"$PNG_FILE\" .rts.png)\"",
        f"QEMU_ARCH=\"{qemu_arch}\"",
        f"QEMU_BINARY=\"{qemu_binary}\"",
        f"QEMU_MEMORY=\"{qemu_memory}\"",
        f"QEMU_CPU=\"{qemu_cpu}\"",
        "",
        "# Extract data from PNG",
        "echo \"Extracting data from $PNG_FILE...\"",
        f"python3 -c \"import sys; sys.path.insert(0, '{Path(__file__).parent}'); from pixelrts_v2_core import PixelRTSDecoder; from pathlib import Path; import json; png_path = Path('$PNG_FILE'); meta_path = Path(str(png_path) + '.meta.json'); decoder = PixelRTSDecoder(); decoder.set_metadata(json.load(open(meta_path))) if meta_path.exists() else None; data = decoder.decode(open(png_path, 'rb').read()); output_path = Path('$EXTRACTED_DIR/data.bin'); output_path.parent.mkdir(parents=True, exist_ok=True); open(output_path, 'wb').write(data); print(f'Extracted to: {{output_path}}')\" || exit 1",
        "",
        "# Launch QEMU",
        "echo \"Starting QEMU...\"",
        "echo \"Architecture: $QEMU_ARCH\"",
        "echo \"Memory: $QEMU_MEMORY\"",
        "echo \"CPU: $QEMU_CPU\"",
        ""
    ]

    # Add QEMU launch command based on content type
    if content_type == 'kernel':
        # Build QEMU command
        qemu_cmd = [
            f"$QEMU_BINARY \\",
            f"    -m $QEMU_MEMORY \\",
            f"    -cpu $QEMU_CPU \\",
            f"    -kernel $EXTRACTED_DIR/data.bin \\",
            f"    -nographic \\"
        ]

        # Add kernel command line if provided
        if kernel_cmdline:
            qemu_cmd.append(f"    -append '{kernel_cmdline}' \\")

        qemu_cmd.append("    -monitor none")
        script_lines.extend(qemu_cmd)
    elif content_type == 'os':
        script_lines.extend([
            "# For OS images, we'd typically create a disk image",
            "# This is a placeholder for future enhancement",
            "echo \"Note: OS boot requires disk image setup\"",
            "echo \"Extracted data available at: $EXTRACTED_DIR/data.bin\"",
            "",
            "# Example: Create disk image and boot",
            f"# qemu-img create -f raw disk.img 1G",
            f"# dd if=$EXTRACTED_DIR/data.bin of=disk.img bs=1M conv=notrunc",
            f"# $QEMU_BINARY -m $QEMU_MEMORY -cpu $QEMU_CPU -drive file=disk.img,format=raw"
        ])
    else:
        script_lines.extend([
            "# Generic binary - not directly bootable",
            "echo \"Note: This content type is not directly bootable\"",
            "echo \"Extracted data available at: $EXTRACTED_DIR/data.bin\"",
            "",
            "# You can inspect or process the extracted data",
            f"# hexdump -C $EXTRACTED_DIR/data.bin | head -20"
        ])

    script_lines.extend([
        "",
        'echo "Boot process terminated."',
        ""
    ])

    # Write boot script
    with open(output_path, 'w') as f:
        f.write('\n'.join(script_lines))

    # Make script executable
    import os
    os.chmod(output_path, 0o755)

    return output_path


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

  # Convert with boot script generation
  %(prog)s kernel.bin kernel.rts.png --type kernel --generate-boot-script

  # Convert with custom QEMU parameters
  %(prog)s os.img os.rts.png --type os --generate-boot-script --qemu-arch aarch64 --qemu-memory 4G
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
        '--generate-boot-script',
        action='store_true',
        help='Generate .boot.sh script for QEMU/KVM'
    )

    parser.add_argument(
        '--qemu-arch',
        choices=['x86_64', 'aarch64', 'riscv64', 'arm', 'ppc64'],
        default='x86_64',
        help='QEMU architecture for boot script (default: x86_64)'
    )

    parser.add_argument(
        '--qemu-memory',
        default='2G',
        help='QEMU memory size (default: 2G)'
    )

    parser.add_argument(
        '--qemu-cpu',
        default='host',
        help='QEMU CPU type (default: host)'
    )

    parser.add_argument(
        '--kernel-cmdline',
        help='Kernel command line for boot script'
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

    # Generate boot script if requested
    if args.generate_boot_script:
        try:
            if args.verbose:
                print("Generating boot script...")

            # Combine metadata for boot script
            boot_metadata = {**metadata, **encoder_metadata} if encoder_metadata else metadata

            boot_script_path = generate_boot_script(
                args.output,
                boot_metadata,
                qemu_arch=args.qemu_arch,
                qemu_memory=args.qemu_memory,
                qemu_cpu=args.qemu_cpu,
                kernel_cmdline=args.kernel_cmdline
            )

            print(f"Successfully generated: {boot_script_path}")
            print(f"  Architecture: {args.qemu_arch}")
            print(f"  Memory: {args.qemu_memory}")
            print(f"  CPU: {args.qemu_cpu}")

            if args.kernel_cmdline:
                print(f"  Kernel cmdline: {args.kernel_cmdline}")

        except Exception as e:
            print(f"Error: Failed to generate boot script: {e}", file=sys.stderr)
            return 1

    # Print summary
    print(f"\nSummary:")
    print(f"  Input:  {args.input} ({data_size} bytes)")
    print(f"  Output: {args.output}")
    print(f"  Grid:   {grid_size}x{grid_size}")
    print(f"  Mode:   {args.mode}")
    print(f"  Hash:   {metadata['segments'][metadata.get('name', input_path.stem)]['sha256']}")

    if args.generate_boot_script:
        print(f"  Boot script: {args.output}.boot.sh")

    return 0


if __name__ == '__main__':
    sys.exit(main())
