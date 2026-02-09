#!/usr/bin/env python3
"""
PixelRTS v2 Unified CLI
Combines conversion, benchmarking, and parallel processing.
"""

import sys
import argparse
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent))


def cmd_convert(args):
    """Handle convert command."""
    from pixelrts_v2_core import PixelRTSEncoder, calculate_grid_size
    from pixelrts_parallel import ParallelPixelRTSEncoder
    import hashlib
    import json

    input_path = Path(args.input)
    output_path = Path(args.output) if args.output else input_path.with_suffix('.rts.png')

    # If parallel mode requested
    if args.parallel:
        encoder = ParallelPixelRTSEncoder(
            workers=args.workers,
            mode=args.mode,
            mmap_threshold=args.mmap_threshold * 1024 * 1024  # Convert MB to bytes
        )

        if args.recursive:
            results = encoder.encode_directory(
                input_dir=input_path,
                output_dir=output_path,
                pattern=args.pattern,
                recursive=True
            )
        else:
            # Check if input is directory or single file
            if input_path.is_dir():
                results = encoder.encode_directory(
                    input_dir=input_path,
                    output_dir=output_path,
                    pattern=args.pattern
                )
            else:
                # Single file - use direct encoding
                if args.verbose:
                    print("Note: Parallel mode with single file - using direct encoding")
                return _convert_single_file(args)

        # Print results
        success = sum(1 for r in results if r['success'])
        print(f"Converted {success}/{len(results)} files")

        for result in results:
            if not result['success']:
                print(f"  Error: {result['input_path']}: {result['error']}")

        return 0 if success == len(results) else 1

    # Standard conversion (single file)
    return _convert_single_file(args)


def _convert_single_file(args):
    """Convert a single file."""
    from pixelrts_v2_core import PixelRTSEncoder, calculate_grid_size
    import hashlib
    import json

    input_path = Path(args.input)
    output_path = Path(args.output) if args.output else input_path.with_suffix('.rts.png')

    # Validate input
    if not input_path.exists():
        print(f"Error: Input file not found: {args.input}", file=sys.stderr)
        return 1

    if not input_path.is_file():
        print(f"Error: Input path is not a file: {args.input}", file=sys.stderr)
        return 1

    # Read input data
    if args.verbose:
        print(f"Reading input file: {args.input}")

    with open(input_path, 'rb') as f:
        data = f.read()

    data_size = len(data)
    if args.verbose:
        print(f"Input size: {data_size} bytes ({data_size / 1024:.2f} KB)")

    # Create metadata
    metadata = {}
    if args.type:
        metadata['type'] = args.type
    if args.name:
        metadata['name'] = args.name
    if args.version:
        metadata['version'] = args.version
    if args.description:
        metadata['description'] = args.description

    # Add segment info
    data_hash = hashlib.sha256(data).hexdigest()
    segment_name = args.name or input_path.stem
    metadata['segments'] = {
        segment_name: {
            'type': args.type or 'binary',
            'size': data_size,
            'sha256': data_hash
        }
    }

    # Calculate grid size
    if args.grid_size:
        grid_size = args.grid_size
    else:
        grid_size = calculate_grid_size(data_size)
        if args.verbose:
            print(f"Auto-calculated grid size: {grid_size}x{grid_size}")

    # Create encoder
    if args.verbose:
        print(f"Encoding mode: {args.mode}")
        print(f"Grid size: {grid_size}x{grid_size}")

    encoder = PixelRTSEncoder(mode=args.mode)

    # Encode data
    try:
        if args.verbose:
            print("Encoding data...")

        encoder.save(
            data,
            str(output_path),
            metadata=metadata,
            grid_size=grid_size
        )

        if args.verbose:
            print("Encoding complete.")

    except ValueError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1

    print(f"Successfully created: {output_path}")

    # Save sidecar metadata
    try:
        encoder_metadata = encoder.get_metadata()
        if encoder_metadata:
            meta_path = str(output_path) + '.meta.json'
            with open(meta_path, 'w') as f:
                json.dump(encoder_metadata, f, indent=2)
            if args.verbose:
                print(f"Sidecar metadata saved to: {meta_path}")
    except Exception as e:
        if args.verbose:
            print(f"Warning: Failed to save sidecar metadata: {e}", file=sys.stderr)

    # Print summary
    print(f"\nSummary:")
    print(f"  Input:  {args.input} ({data_size} bytes)")
    print(f"  Output: {output_path}")
    print(f"  Grid:   {grid_size}x{grid_size}")
    print(f"  Mode:   {args.mode}")

    return 0


def cmd_benchmark(args):
    """Handle benchmark command."""
    from benchmarks.pattern_benchmark import main as benchmark_main

    # Build argv for benchmark
    benchmark_argv = ['pattern_benchmark']

    # Add flags from args if provided
    if args.algorithm:
        benchmark_argv.extend(['--algorithm', args.algorithm])
    if args.sizes:
        benchmark_argv.extend(['--sizes'] + [str(s) for s in args.sizes])
    if args.iterations:
        benchmark_argv.extend(['--iterations', str(args.iterations)])
    if args.output:
        benchmark_argv.extend(['--output', args.output])
    if args.verbose:
        benchmark_argv.append('--verbose')

    # Add any extra args
    if args.extra_args:
        benchmark_argv.extend(args.extra_args)

    sys.argv = benchmark_argv
    return benchmark_main()


def cmd_dashboard(args):
    """Handle dashboard command."""
    from benchmark_dashboard import main as dashboard_main

    # Build argv for dashboard
    dashboard_argv = ['benchmark_dashboard', '--output', args.output]

    sys.argv = dashboard_argv
    return dashboard_main()


def cmd_info(args):
    """Handle info command."""
    from pixelrts_v2_core import PixelRTSDecoder
    import json

    input_path = Path(args.input)

    # Try to load sidecar metadata first
    meta_path = Path(str(input_path) + '.meta.json')
    if meta_path.exists():
        with open(meta_path, 'r') as f:
            info = json.load(f)
    else:
        decoder = PixelRTSDecoder()
        try:
            info = decoder.info(args.input)
        except Exception as e:
            print(f"Error: {e}", file=sys.stderr)
            return 1

    try:
        print(f"File: {args.input}")
        print(f"Format: {info.get('format', 'PixelRTS')}")
        print(f"Grid Size: {info.get('grid_size', 'Unknown')}")
        print(f"Data Size: {info.get('data_size', 'Unknown')} bytes")

        encoding = info.get('encoding', {})
        if encoding:
            print(f"Encoding: {encoding.get('type', 'Unknown')}")

        if 'segments' in info and info['segments']:
            print("\nSegments:")
            for name, seg in info['segments'].items():
                print(f"  {name}:")
                print(f"    Type: {seg.get('type', 'Unknown')}")
                print(f"    Size: {seg.get('size', 'Unknown')} bytes")
                if 'sha256' in seg:
                    print(f"    Hash: {seg['sha256'][:16]}...")

        if info.get('gpu_encoded'):
            print(f"GPU Encoded: Yes")

        return 0
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1


def main():
    """Main CLI entry point."""
    parser = argparse.ArgumentParser(
        description='PixelRTS v2 - Binary Visualization Platform',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Commands:
  convert      Convert binary files to .rts.png format
  benchmark    Run performance benchmarks
  dashboard    Generate performance dashboard
  info         Display information about .rts.png file

Examples:
  pixelrts convert kernel.bin kernel.rts.png
  pixelrts convert ./binaries ./output --parallel --workers 4
  pixelrts benchmark
  pixelrts benchmark --algorithm sobel --sizes 256 512 1024
  pixelrts benchmark --iterations 20 --output results.json
  pixelrts dashboard
  pixelrts info kernel.rts.png
        """
    )

    subparsers = parser.add_subparsers(dest='command', help='Command to run')

    # Convert command
    convert_parser = subparsers.add_parser('convert', help='Convert binary files')
    convert_parser.add_argument('input', help='Input file or directory')
    convert_parser.add_argument('output', nargs='?', help='Output file or directory')
    convert_parser.add_argument('--mode', choices=['standard', 'code'], default='standard')
    convert_parser.add_argument('--parallel', action='store_true',
                               help='Use parallel processing')
    convert_parser.add_argument('--workers', type=int,
                               help='Number of workers (default: CPU count)')
    convert_parser.add_argument('--recursive', '-r', action='store_true',
                               help='Process directories recursively')
    convert_parser.add_argument('--pattern', default='*',
                               help='File pattern to match (default: *)')
    convert_parser.add_argument('--mmap-threshold', type=int, default=100, metavar='MB',
                               help='File size threshold for memory mapping (default: 100 MB)')
    # Add all original converter args
    convert_parser.add_argument('--type', help='Content type')
    convert_parser.add_argument('--name', help='Content name')
    convert_parser.add_argument('--version', help='Content version')
    convert_parser.add_argument('--description', help='Content description')
    convert_parser.add_argument('--grid-size', type=int)
    convert_parser.add_argument('--generate-boot-script', action='store_true')
    convert_parser.add_argument('--qemu-arch', default='x86_64')
    convert_parser.add_argument('--qemu-memory', default='2G')
    convert_parser.add_argument('--qemu-cpu', default='host')
    convert_parser.add_argument('--kernel-cmdline')
    convert_parser.add_argument('-v', '--verbose', action='store_true')

    # Benchmark command
    bench_parser = subparsers.add_parser('benchmark', help='Run benchmarks')
    bench_parser.add_argument('extra_args', nargs=argparse.REMAINDER,
                             help='Arguments to pass to benchmark')
    # Add benchmark-specific flags for convenience
    bench_parser.add_argument('--algorithm', '-a',
                             choices=['sobel', 'canny', 'fourier', 'all'],
                             default=None,
                             help='Algorithm to benchmark (default: all)')
    bench_parser.add_argument('--sizes', '-s',
                             type=int,
                             nargs='+',
                             help='Image sizes to benchmark (default: 256 512 1024 2048)')
    bench_parser.add_argument('--iterations', '-i',
                             type=int,
                             help='Number of iterations per benchmark (default: 10)')
    bench_parser.add_argument('--output', '-o',
                             type=str,
                             help='Output JSON file for results')
    bench_parser.add_argument('--verbose', '-v',
                             action='store_true',
                             help='Enable verbose output')

    # Dashboard command
    dash_parser = subparsers.add_parser('dashboard', help='Generate dashboard')
    dash_parser.add_argument('--output', default='benchmark_dashboard.html',
                            help='Output HTML file path')

    # Info command
    info_parser = subparsers.add_parser('info', help='Show file information')
    info_parser.add_argument('input', help='.rts.png file path')

    args = parser.parse_args()

    if not args.command:
        parser.print_help()
        return 1

    # Dispatch to command handler
    handlers = {
        'convert': cmd_convert,
        'benchmark': cmd_benchmark,
        'dashboard': cmd_dashboard,
        'info': cmd_info
    }

    handler = handlers.get(args.command)
    if handler:
        return handler(args)

    return 0


if __name__ == '__main__':
    sys.exit(main())
