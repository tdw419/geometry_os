#!/usr/bin/env python3
"""
PixelRTS v2 Unified CLI
Combines conversion, benchmarking, and parallel processing.
"""

import sys
import argparse
import signal
from pathlib import Path

# Add project root to path for imports
project_root = Path(__file__).parent.parent.parent
sys.path.insert(0, str(project_root))

# Import for click.secho colored output
try:
    import click
    HAS_CLICK = True
except ImportError:
    HAS_CLICK = False


def cmd_convert(args):
    """Handle convert command."""
    import hashlib
    import json
    from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder, calculate_grid_size
    from systems.pixel_compiler.pixelrts_parallel import ParallelPixelRTSEncoder

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
    import hashlib
    import json
    from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder, calculate_grid_size

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
    from systems.pixel_compiler.benchmarks.pattern_benchmark import main as benchmark_main

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
    from systems.pixel_compiler.benchmark_dashboard import main as dashboard_main

    # Build argv for dashboard
    dashboard_argv = ['benchmark_dashboard', '--output', args.output]

    sys.argv = dashboard_argv
    return dashboard_main()


def cmd_info(args):
    """Handle info command."""
    import json
    from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder

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


def cmd_analyze(args):
    """Handle analyze command - pattern detection analysis."""
    import json
    from systems.pixel_compiler.pattern_detector import PatternDetector

    input_path = Path(args.input)

    if not input_path.exists():
        print(f"Error: Input file not found: {args.input}", file=sys.stderr)
        return 1

    if args.verbose:
        print(f"Analyzing: {args.input}")

    try:
        detector = PatternDetector(str(input_path))
        results = {}

        # Edge detection
        if args.method in ['edges', 'all']:
            if args.verbose:
                print("Running edge detection...")

            if args.edge_method == 'sobel':
                edge_result = detector.detect_edges_sobel(threshold=args.threshold)
            elif args.edge_method == 'canny':
                edge_result = detector.detect_edges_canny(
                    low_threshold=args.canny_low,
                    high_threshold=args.canny_high
                )
            else:
                print(f"Error: Unknown edge method: {args.edge_method}", file=sys.stderr)
                return 1

            results['edges'] = {
                'method': edge_result.method,
                'edge_count': edge_result.edge_count,
                'edge_density': edge_result.edge_density,
                'strong_edges_count': len(edge_result.strong_edges),
                'metadata': edge_result.metadata
            }

            if args.verbose:
                print(f"  Edges: {edge_result.edge_count} ({edge_result.edge_density:.2%} density)")

        # Fourier analysis
        if args.method in ['fourier', 'all']:
            if args.verbose:
                print("Running Fourier analysis...")

            fourier_result = detector.analyze_fourier(max_frequencies=args.max_frequencies)
            results['fourier'] = {
                'dominant_frequency': fourier_result.dominant_frequency,
                'has_periodic_patterns': fourier_result.has_periodic_patterns,
                'periodic_regions_count': len(fourier_result.periodic_regions),
                'periodic_regions': fourier_result.periodic_regions[:5]  # Limit output
            }

            if args.verbose:
                print(f"  Periodic patterns: {fourier_result.has_periodic_patterns}")
                print(f"  Dominant frequency: {fourier_result.dominant_frequency}")

        # Clustering
        if args.method in ['clusters', 'all']:
            if args.verbose:
                print("Running cluster analysis...")

            cluster_result = detector.detect_clusters(
                eps=args.cluster_eps,
                min_samples=args.cluster_min_samples,
                feature_type=args.cluster_feature
            )
            results['clusters'] = {
                'num_clusters': cluster_result.num_clusters,
                'noise_points': cluster_result.noise_points,
                'regions_of_interest_count': len(cluster_result.regions_of_interest),
                'regions_of_interest': cluster_result.regions_of_interest[:5]  # Limit output
            }

            if args.verbose:
                print(f"  Clusters: {cluster_result.num_clusters}")
                print(f"  Noise points: {cluster_result.noise_points}")

        # Output results
        if args.output:
            with open(args.output, 'w') as f:
                json.dump(results, f, indent=2)
            if args.verbose:
                print(f"\nResults saved to: {args.output}")
        else:
            print("\n" + json.dumps(results, indent=2))

        return 0

    except ImportError as e:
        print(f"Error: {e}", file=sys.stderr)
        print("Pattern detection requires: opencv-python, scikit-learn, scipy", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1


def cmd_execute(args):
    """Handle execute command - run WASM from .rts.png."""
    from systems.pixel_compiler.wasm_runtime import WASMRuntime

    input_path = Path(args.input)

    if not input_path.exists():
        print(f"Error: Input file not found: {args.input}", file=sys.stderr)
        return 1

    if args.verbose:
        print(f"Loading: {args.input}")

    try:
        # Load WASM from .rts.png
        runtime = WASMRuntime.from_png(str(input_path))

        if args.list_functions:
            # List available functions
            print("\nAvailable functions:")
            for func_name in runtime.exports.keys():
                print(f"  - {func_name}")
            return 0

        # Determine which function to call
        if args.function:
            function_name = args.function
        elif 'main' in runtime.exports:
            function_name = 'main'
        elif '_start' in runtime.exports:
            function_name = '_start'
        else:
            print("Error: No function specified and no 'main' or '_start' found", file=sys.stderr)
            print("Available functions:", list(runtime.exports.keys()))
            return 1

        if args.verbose:
            print(f"Calling function: {function_name}")
            if args.arguments:
                print(f"Arguments: {args.arguments}")

        # Call the function
        result = runtime.call(function_name, *args.arguments)

        print(f"\nResult: {result}")

        # Print trace statistics if available
        if args.trace:
            stats = runtime.get_trace_statistics()
            if stats.get('total_events', 0) > 0:
                print("\nExecution trace:")
                print(f"  Total events: {stats['total_events']}")
                print(f"  Instructions: {stats.get('instruction_count', 0)}")
                print(f"  Memory operations: {stats.get('memory_ops', 0)}")

                if args.trace_output:
                    trace_json = runtime.export_trace()
                    with open(args.trace_output, 'w') as f:
                        f.write(trace_json)
                    print(f"\nTrace saved to: {args.trace_output}")

        return 0

    except ValueError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1
    except RuntimeError as e:
        print(f"Execution failed: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1


def cmd_vision(args):
    """Handle vision command - vision analysis of .rts.png."""
    import json
    from systems.pixel_compiler.pixelrts_vision_analyzer import PixelRTSVisionAnalyzer

    input_path = Path(args.input)

    if not input_path.exists():
        print(f"Error: Input file not found: {args.input}", file=sys.stderr)
        return 1

    if args.verbose:
        print(f"Analyzing: {args.input}")

    try:
        analyzer = PixelRTSVisionAnalyzer(str(input_path))

        # Visual summary
        if args.action in ['summary', 'all']:
            summary = analyzer.get_visual_summary()

            print("\nVisual Summary:")
            print(f"  Dimensions: {summary['width']}x{summary['height']}")
            print(f"  Total pixels: {summary['total_pixels']:,}")
            print(f"  Channels: {summary['channels']}")
            print(f"  Aspect ratio: {summary['aspect_ratio']:.2f}")

            if 'grid_size' in summary:
                print(f"  Grid size: {summary['grid_size']}")
            if 'data_size' in summary:
                print(f"  Data size: {summary['data_size']:,} bytes")
            if 'format' in summary:
                print(f"  Format: {summary['format']}")

        # Entropy overlay
        if args.action in ['entropy', 'all']:
            if not args.output_dir:
                args.output_dir = input_path.parent

            overlay_path = analyzer.generate_entropy_overlay(
                str(args.output_dir),
                colormap=args.colormap
            )
            print(f"\nEntropy overlay saved to: {overlay_path}")

        # Pattern analysis
        if args.action in ['patterns', 'all']:
            pattern_results = {}

            if args.pattern_method in ['edges', 'all']:
                edge_result = analyzer.detect_edges(method=args.edge_method)
                pattern_results['edges'] = edge_result

                if args.verbose:
                    print(f"\nEdge detection ({args.edge_method}):")
                    print(f"  Edge count: {edge_result['edge_count']}")
                    print(f"  Edge density: {edge_result['edge_density']:.2%}")

            if args.pattern_method in ['fourier', 'all']:
                fourier_result = analyzer.analyze_fourier()
                pattern_results['fourier'] = fourier_result

                if args.verbose:
                    print(f"\nFourier analysis:")
                    print(f"  Periodic patterns: {fourier_result['has_periodic_patterns']}")
                    print(f"  Dominant frequency: {fourier_result['dominant_frequency']}")

            if args.pattern_method in ['clusters', 'all']:
                cluster_result = analyzer.detect_clusters(
                    eps=args.cluster_eps,
                    min_samples=args.cluster_min_samples,
                    feature_type=args.cluster_feature
                )
                pattern_results['clusters'] = cluster_result

                if args.verbose:
                    print(f"\nClustering:")
                    print(f"  Clusters found: {cluster_result['num_clusters']}")
                    print(f"  Noise points: {cluster_result['noise_points']}")

            if args.output:
                with open(args.output, 'w') as f:
                    json.dump(pattern_results, f, indent=2)
                if args.verbose:
                    print(f"\nPattern results saved to: {args.output}")

        # Prepare for vision model
        if args.action == 'prepare':
            img, b64 = analyzer.prepare_for_vision_model(max_size=args.max_size)

            if args.output:
                # Save base64 to file
                with open(args.output, 'w') as f:
                    f.write(b64)
                print(f"\nBase64 encoded image saved to: {args.output}")
                print(f"Image size: {img.size}")
            else:
                # Print summary
                print(f"\nPrepared for vision model:")
                print(f"  Image size: {img.size}")
                print(f"  Base64 length: {len(b64):,} chars")
                print(f"  First 100 chars: {b64[:100]}...")

        return 0

    except ImportError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1


def cmd_transpile(args):
    """Handle transpile command - Universal Transpiler integration."""
    from systems.pixel_compiler.universal_transpiler import UniversalTranspiler

    if args.verbose:
        print(f"[*] Starting transpilation: {args.input}")

    try:
        # Create transpiler instance
        transpiler = UniversalTranspiler()

        # Perform transpilation and conversion
        output_path = transpiler.transpile_and_convert(
            args.input,
            args.output
        )

        # Success message with colored output
        if HAS_CLICK:
            click.secho(f"[✓] Transpilation Complete!", fg='green', bold=True)
            click.secho(f"    Output: {output_path}", fg='green')
        else:
            print(f"[✓] Transpilation Complete!")
            print(f"    Output: {output_path}")

        return 0

    except FileNotFoundError as e:
        if HAS_CLICK:
            click.secho(f"[!] Error: {e}", fg='red', bold=True)
        else:
            print(f"[!] Error: {e}", file=sys.stderr)
        return 1
    except RuntimeError as e:
        if HAS_CLICK:
            click.secho(f"[!] Transpilation failed: {e}", fg='red', bold=True)
        else:
            print(f"[!] Transpilation failed: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1
    except Exception as e:
        if HAS_CLICK:
            click.secho(f"[!] Unexpected error: {e}", fg='red')
        else:
            print(f"[!] Unexpected error: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1


def cmd_blueprint_generate(args):
    """Handle blueprint generate command - Create .rts.png with blueprint."""
    from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder
    from systems.pixel_compiler.pixelrts_blueprint_analyzer import BlueprintAnalyzer

    input_path = Path(args.input)
    output_path = Path(args.output) if args.output else input_path.with_suffix('.rts.png')

    # Validate input
    if not input_path.exists():
        print(f"Error: Input file not found: {args.input}", file=sys.stderr)
        return 1

    # Read input binary
    with open(input_path, 'rb') as f:
        data = f.read()

    # Generate blueprint from analysis
    analyzer = BlueprintAnalyzer()
    blueprint = analyzer.analyze(
        data,
        system_name=args.system_name or input_path.stem,
        system_type=args.system_type,
        architecture=args.architecture
    )

    # Encode with blueprint
    encoder = PixelRTSEncoder(mode=args.mode)
    encoder.save(data, str(output_path), blueprint=blueprint.to_dict())

    print(f"✓ Generated {output_path}")
    print(f"  System: {blueprint.system_name}")
    print(f"  Components: {len(blueprint.components)}")

    return 0


def cmd_blueprint_view(args):
    """Handle blueprint view command - Generate overlay or HTML."""
    from systems.pixel_compiler.pixelrts_blueprint_viewer import BlueprintViewer

    viewer = BlueprintViewer()
    blueprint = viewer.load_blueprint(args.rts_file)

    if blueprint is None:
        print("✗ No blueprint found. Use 'blueprint generate' to create one.", file=sys.stderr)
        return 1

    # Determine output path
    if args.output is None:
        if args.html:
            output = Path(args.rts_file).stem + '_blueprint.html'
        else:
            output = Path(args.rts_file).stem + '_overlay.png'
    else:
        output = args.output

    if args.html:
        viewer.create_interactive_html(args.rts_file, blueprint, output)
    else:
        viewer.render_overlay(args.rts_file, blueprint, output, show_grid=args.show_grid)

    print(f"✓ Generated {output}")
    return 0


def cmd_blueprint_analyze(args):
    """Handle blueprint analyze command - Display blueprint info."""
    from systems.pixel_compiler.pixelrts_blueprint_viewer import BlueprintViewer

    viewer = BlueprintViewer()
    blueprint = viewer.load_blueprint(args.rts_file)

    if blueprint is None:
        print("No blueprint found.", file=sys.stderr)
        return 1

    # Display blueprint info
    print(f"\n  System: {blueprint.system_name}")
    print(f"  Type: {blueprint.system_type}")
    print(f"  Architecture: {blueprint.architecture}")
    print(f"  Entry Point: {blueprint.entry_point or 'N/A'}")
    print(f"\n  Components ({len(blueprint.components)}):")

    for comp in blueprint.components:
        print(f"    - {comp.id} ({comp.type.value})")
        print(f"      {comp.description}")
        print(f"      Entropy: {comp.entropy_profile} | Visual: {comp.visual_hint}")

    print(f"\n  Memory Map ({len(blueprint.memory_map)}):")
    for region in blueprint.memory_map:
        print(f"    - {region.region}: {region.permissions}")

    return 0


def cmd_boot(args):
    """Handle boot command - Boot .rts.png files with QEMU."""
    from systems.pixel_compiler.boot import BootBridge, BootResult

    input_path = Path(args.input)

    if not input_path.exists():
        print(f"Error: Input file not found: {args.input}", file=sys.stderr)
        return 1

    if not input_path.is_file():
        print(f"Error: Input path is not a file: {args.input}", file=sys.stderr)
        return 1

    if args.verbose:
        print(f"Booting: {args.input}")
        print(f"Memory: {args.memory}")
        print(f"CPUs: {args.cpus}")
        print(f"VNC display: {args.vnc}")

    try:
        # Create BootBridge with options
        bridge = BootBridge(
            rts_png_path=str(input_path),
            memory=args.memory,
            cpus=args.cpus,
            vnc_display=args.vnc,
            verbose=not args.quiet and (args.verbose or sys.stdout.isatty()),
        )

        # Build extra QEMU args if provided
        extra_qemu_args = []
        if args.qemu_arg:
            extra_qemu_args.extend(args.qemu_arg)

        # Perform boot
        result = bridge.boot(
            cmdline=args.cmdline,
            extra_qemu_args=extra_qemu_args if extra_qemu_args else None,
        )

        if not result.success:
            print(f"Boot failed: {result.error_message}", file=sys.stderr)
            return 1

        # Print success info
        if not args.quiet:
            print(f"\nBoot successful!")
            print(f"  PID: {result.pid}")
            if result.vnc_port:
                print(f"  VNC: :{result.vnc_port} (port {5900 + result.vnc_port})")
            if result.mountpoint:
                print(f"  Mountpoint: {result.mountpoint}")

        # Handle background mode
        if args.background:
            if not args.quiet:
                print(f"\nRunning in background. PID: {result.pid}")
                print("Use 'kill {pid}' or Ctrl+C to stop.".format(pid=result.pid))
            # Don't wait - return success immediately
            # The FUSE mount and QEMU will keep running
            return 0

        # Wait for QEMU process
        if not args.quiet:
            print("\nWaiting for QEMU... (Ctrl+C to stop)")

        # Set up signal handler for graceful shutdown
        shutdown_requested = False

        def handle_shutdown(signum, frame):
            nonlocal shutdown_requested
            shutdown_requested = True
            if not args.quiet:
                print("\nShutdown requested, stopping VM...")

        original_sigint = signal.signal(signal.SIGINT, handle_shutdown)
        original_sigterm = signal.signal(signal.SIGTERM, handle_shutdown)

        try:
            # Wait for the process to complete or signal
            if result.process:
                exit_code = result.process.wait()
                if not args.quiet:
                    print(f"\nQEMU exited with code: {exit_code}")
            else:
                # No process reference, just wait for signal
                while not shutdown_requested:
                    signal.pause()
        finally:
            # Restore original signal handlers
            signal.signal(signal.SIGINT, original_sigint)
            signal.signal(signal.SIGTERM, original_sigterm)

            # Clean up
            if not args.quiet:
                print("Cleaning up...")
            bridge.stop()

        # Return 130 for SIGINT (128 + 2), otherwise exit code
        if shutdown_requested:
            return 130
        return exit_code if result.process else 0

    except ImportError as e:
        print(f"Error: Required module not available: {e}", file=sys.stderr)
        print("Ensure systems.pixel_compiler.boot is properly installed.", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1


def cmd_install(args):
    """Handle install command - Install .rts.png files to disk image."""
    from systems.pixel_compiler.install import InstallEngine, InstallError

    input_path = Path(args.input)
    target_path = Path(args.target)

    # Validate input file exists
    if not input_path.exists():
        print(f"Error: Input file not found: {args.input}", file=sys.stderr)
        return 1

    if not input_path.is_file():
        print(f"Error: Input path is not a file: {args.input}", file=sys.stderr)
        return 1

    # Validate input is .rts.png
    if not str(input_path).endswith('.rts.png'):
        print(f"Error: Input file must be a .rts.png file: {args.input}", file=sys.stderr)
        return 1

    # Validate target parent directory exists
    target_parent = target_path.parent
    if not target_parent.exists():
        print(f"Error: Target parent directory does not exist: {target_parent}", file=sys.stderr)
        return 1

    if args.verbose:
        print(f"Installing: {args.input}")
        print(f"Target: {args.target}")
        print(f"Verify: {not args.no_verify}")

    try:
        # Create InstallEngine with options
        with InstallEngine(
            rts_png_path=str(input_path),
            target_path=str(target_path),
            verbose=not args.quiet and (args.verbose or sys.stdout.isatty()),
            verify=not args.no_verify,
        ) as engine:
            # Perform install
            result = engine.install()

            if result.cancelled:
                if not args.quiet:
                    print(f"\nInstallation cancelled.")
                return 130  # 128 + 2 (SIGINT)

            if not result.success:
                print(f"Installation failed: {result.error_message}", file=sys.stderr)
                return 1

            # Print success info
            if not args.quiet:
                print(f"\nInstallation successful!")
                print(f"  Target: {result.target_path}")
                print(f"  Bytes written: {result.bytes_written:,} ({result.bytes_written / (1024*1024):.1f} MB)")
                print(f"  Duration: {result.duration_seconds:.2f}s")
                if result.verified:
                    print(f"  Verified: Yes")

            return 0

    except InstallError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1
    except ImportError as e:
        print(f"Error: Required module not available: {e}", file=sys.stderr)
        print("Ensure systems.pixel_compiler.install is properly installed.", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1


def cmd_catalog(args):
    """Handle catalog command - Launch visual catalog server."""
    import os
    import webbrowser
    from threading import Thread
    from time import sleep

    # Parse paths argument into list
    watch_paths = None
    if args.paths:
        watch_paths = [p.strip() for p in args.paths.split(',') if p.strip()]

    # If paths not specified, use ["."] or RTS_REGISTRY_PATH env var
    if watch_paths is None:
        env_path = os.environ.get('RTS_REGISTRY_PATH')
        if env_path:
            watch_paths = [env_path]
        else:
            watch_paths = ["."]

    # Set environment variables for CatalogServer to use
    os.environ['RTS_REGISTRY_PATH'] = ','.join(watch_paths)

    if args.verbose:
        print(f"Starting catalog server...")
        print(f"  Host: {args.host}")
        print(f"  Port: {args.port}")
        print(f"  Paths: {watch_paths}")

    # Open browser in background thread if not disabled
    if not args.no_browser:
        url = f"http://{args.host}:{args.port}"

        def open_browser():
            sleep(1.5)  # Wait for server to start
            webbrowser.open(url)

        browser_thread = Thread(target=open_browser, daemon=True)
        browser_thread.start()

    # Print URL on startup
    print(f"Catalog server running at http://{args.host}:{args.port}")
    print("Press Ctrl+C to stop.")

    try:
        import uvicorn
        uvicorn.run(
            "systems.pixel_compiler.catalog:app",
            host=args.host,
            port=args.port,
            log_level="warning"  # Reduce noise
        )
    except ImportError:
        print("Error: uvicorn is required for the catalog server.", file=sys.stderr)
        print("Install it with: pip install uvicorn", file=sys.stderr)
        return 1
    except KeyboardInterrupt:
        print("\nCatalog server stopped.")
        return 130  # 128 + 2 (SIGINT)
    except Exception as e:
        print(f"Error starting catalog server: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1

    return 0


def main():
    """Main CLI entry point."""
    parser = argparse.ArgumentParser(
        description='PixelRTS v2 - Binary Visualization Platform',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Commands:
  convert      Convert binary files to .rts.png format
  transpile    Transpile native software (source/binary/WASM) to PixelRTS format
  boot         Boot .rts.png files with QEMU (single command)
  install      Install .rts.png files to disk image (with verification)
  catalog      Launch visual catalog server for browsing .rts.png files
  benchmark    Run performance benchmarks
  dashboard    Generate performance dashboard
  info         Display information about .rts.png file
  analyze      Pattern detection analysis (edges, fourier, clusters)
  execute      Execute WASM embedded in .rts.png
  vision       Vision analysis (summary, entropy overlay)
  blueprint    Blueprint management commands

Examples:
  pixelrts convert kernel.bin kernel.rts.png
  pixelrts transpile program.wasm program.rts.png
  pixelrts transpile main.c main.rts.png
  pixelrts boot alpine.rts.png --memory 4G --cpus 4
  pixelrts boot kernel.rts.png --vnc 1 --background
  pixelrts boot os.rts.png --cmdline "console=ttyS0" --qemu-arg "-nographic"
  pixelrts install alpine.rts.png /tmp/alpine.img
  pixelrts install os.rts.png /dev/sdX --no-verify
  pixelrts catalog
  pixelrts catalog --port 8080 --paths /path/to/images
  pixelrts catalog --no-browser
  pixelrts analyze image.rts.png --method edges --edge-method sobel
  pixelrts analyze image.rts.png --method all --output results.json
  pixelrts execute fibonacci.rts.png --function fib --arguments 10
  pixelrts execute wasm.rts.png --list-functions
  pixelrts vision kernel.rts.png --action summary
  pixelrts vision kernel.rts.png --action entropy --output-dir ./output
  pixelrts vision kernel.rts.png --action all --colormap viridis
  pixelrts blueprint generate kernel.bin --output kernel.rts.png --system-name "Linux Kernel"
  pixelrts blueprint view kernel.rts.png --output overlay.png
  pixelrts blueprint analyze kernel.rts.png
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

    # Analyze command (pattern detection)
    analyze_parser = subparsers.add_parser('analyze', help='Pattern detection analysis')
    analyze_parser.add_argument('input', help='Input .rts.png file path')
    analyze_parser.add_argument('--method', '-m',
                               choices=['edges', 'fourier', 'clusters', 'all'],
                               default='all',
                               help='Analysis method to run (default: all)')
    analyze_parser.add_argument('--edge-method',
                               choices=['sobel', 'canny'],
                               default='sobel',
                               help='Edge detection method (default: sobel)')
    analyze_parser.add_argument('--threshold', type=float,
                               help='Sobel threshold (default: None)')
    analyze_parser.add_argument('--canny-low', type=float, default=50,
                               help='Canny low threshold (default: 50)')
    analyze_parser.add_argument('--canny-high', type=float, default=150,
                               help='Canny high threshold (default: 150)')
    analyze_parser.add_argument('--max-frequencies', type=int, default=10,
                               help='Max frequencies for Fourier (default: 10)')
    analyze_parser.add_argument('--cluster-eps', type=float, default=5.0,
                               help='DBSCAN eps parameter (default: 5.0)')
    analyze_parser.add_argument('--cluster-min-samples', type=int, default=10,
                               help='DBSCAN min_samples (default: 10)')
    analyze_parser.add_argument('--cluster-feature',
                               choices=['position', 'color'],
                               default='position',
                               help='Clustering feature type (default: position)')
    analyze_parser.add_argument('--output', '-o',
                               help='Output JSON file for results')
    analyze_parser.add_argument('-v', '--verbose', action='store_true',
                               help='Enable verbose output')

    # Execute command (WASM execution)
    execute_parser = subparsers.add_parser('execute', help='Execute WASM from .rts.png')
    execute_parser.add_argument('input', help='Input .rts.png file path')
    execute_parser.add_argument('--function', '-f',
                               help='Function name to call (default: main or _start)')
    execute_parser.add_argument('--arguments', '-a',
                               type=int,
                               nargs='*',
                               default=[],
                               help='Integer arguments to pass to function')
    execute_parser.add_argument('--list-functions', '-l',
                               action='store_true',
                               help='List available functions and exit')
    execute_parser.add_argument('--trace',
                               action='store_true',
                               help='Enable execution tracing')
    execute_parser.add_argument('--trace-output',
                               help='Save execution trace to file')
    execute_parser.add_argument('-v', '--verbose', action='store_true',
                               help='Enable verbose output')

    # Vision command
    vision_parser = subparsers.add_parser('vision', help='Vision analysis')
    vision_parser.add_argument('input', help='Input .rts.png file path')
    vision_parser.add_argument('--action',
                              choices=['summary', 'entropy', 'patterns', 'prepare', 'all'],
                              default='summary',
                              help='Analysis action (default: summary)')
    vision_parser.add_argument('--output-dir', '-d',
                              help='Output directory for generated files')
    vision_parser.add_argument('--output', '-o',
                              help='Output file for JSON results')
    vision_parser.add_argument('--colormap',
                              default='viridis',
                              help='Colormap for entropy overlay (default: viridis)')
    vision_parser.add_argument('--max-size', type=int, default=512,
                              help='Max size for vision model prep (default: 512)')
    vision_parser.add_argument('--pattern-method',
                              choices=['edges', 'fourier', 'clusters', 'all'],
                              default='all',
                              help='Pattern analysis method (default: all)')
    vision_parser.add_argument('--edge-method',
                              choices=['sobel', 'canny'],
                              default='sobel',
                              help='Edge detection method (default: sobel)')
    vision_parser.add_argument('--cluster-eps', type=float, default=5.0,
                              help='DBSCAN eps parameter (default: 5.0)')
    vision_parser.add_argument('--cluster-min-samples', type=int, default=10,
                              help='DBSCAN min_samples (default: 10)')
    vision_parser.add_argument('--cluster-feature',
                              choices=['position', 'color'],
                              default='position',
                              help='Clustering feature type (default: position)')
    vision_parser.add_argument('-v', '--verbose', action='store_true',
                              help='Enable verbose output')

    # Transpile command (Universal Transpiler integration)
    transpile_parser = subparsers.add_parser(
        'transpile',
        help='Transpile native software to PixelRTS format'
    )
    transpile_parser.add_argument('input', help='Input file (source, binary, or WASM)')
    transpile_parser.add_argument('output', nargs='?', help='Output .rts.png file path')
    transpile_parser.add_argument('-v', '--verbose', action='store_true',
                                 help='Enable verbose output')

    # Boot command (boot .rts.png files)
    boot_parser = subparsers.add_parser(
        'boot',
        help='Boot .rts.png files with QEMU',
        description='Boot operating systems from PixelRTS containers in a single command'
    )
    boot_parser.add_argument('input', help='Input .rts.png file to boot')
    boot_parser.add_argument('--memory', '-m', default='2G',
                            help='Memory allocation (default: 2G)')
    boot_parser.add_argument('--cpus', '-c', type=int, default=2,
                            help='Number of CPU cores (default: 2)')
    boot_parser.add_argument('--vnc', type=int, default=0,
                            help='VNC display number (default: 0, port 5900)')
    boot_parser.add_argument('--background', '-b', action='store_true',
                            help='Run in background (don\'t wait for QEMU)')
    boot_parser.add_argument('--cmdline',
                            help='Additional kernel command line parameters')
    boot_parser.add_argument('--qemu-arg', action='append', dest='qemu_arg',
                            help='Extra QEMU argument (can be specified multiple times)')
    boot_parser.add_argument('--quiet', '-q', action='store_true',
                            help='Suppress progress output')
    boot_parser.add_argument('-v', '--verbose', action='store_true',
                            help='Enable verbose output')

    # Install command (install .rts.png files to disk)
    install_parser = subparsers.add_parser(
        'install',
        help='Install .rts.png files to disk image',
        description='Install PixelRTS containers to disk images with verification and progress'
    )
    install_parser.add_argument('input', help='Input .rts.png file to install')
    install_parser.add_argument('target', help='Target file path for installed data')
    install_parser.add_argument('--no-verify', action='store_true',
                               help='Skip hash verification')
    install_parser.add_argument('--quiet', '-q', action='store_true',
                               help='Suppress progress output')
    install_parser.add_argument('-v', '--verbose', action='store_true',
                               help='Enable verbose output')

    # Blueprint command group
    blueprint_parser = subparsers.add_parser(
        'blueprint',
        help='Blueprint management commands'
    )
    blueprint_subparsers = blueprint_parser.add_subparsers(dest='blueprint_command', help='Blueprint command to run')

    # blueprint generate
    blueprint_generate_parser = blueprint_subparsers.add_parser(
        'generate',
        help='Generate PixelRTS v2 container with blueprint metadata'
    )
    blueprint_generate_parser.add_argument('input', help='Input binary file')
    blueprint_generate_parser.add_argument('--output', '-o', required=True, help='Output PNG file path')
    blueprint_generate_parser.add_argument('--system-name', '-n', default='', help='System name for blueprint')
    blueprint_generate_parser.add_argument('--system-type', '-t', default='', help='System type')
    blueprint_generate_parser.add_argument('--architecture', '-a', default='', help='Architecture')
    blueprint_generate_parser.add_argument('--mode', choices=['standard', 'code'], default='standard', help='Encoding mode')

    # blueprint view
    blueprint_view_parser = blueprint_subparsers.add_parser(
        'view',
        help='View blueprint overlay for PixelRTS container'
    )
    blueprint_view_parser.add_argument('rts_file', help='Input .rts.png file path')
    blueprint_view_parser.add_argument('--output', '-o', help='Output overlay path (default: <input>_overlay.png)')
    blueprint_view_parser.add_argument('--html', action='store_true', help='Generate HTML visualization instead of PNG')
    blueprint_view_parser.add_argument('--show-grid', action='store_true', default=True, help='Show grid overlay (default: True)')
    blueprint_view_parser.add_argument('--no-grid', action='store_false', dest='show_grid', help='Hide grid overlay')

    # blueprint analyze
    blueprint_analyze_parser = blueprint_subparsers.add_parser(
        'analyze',
        help='Analyze and display blueprint information'
    )
    blueprint_analyze_parser.add_argument('rts_file', help='Input .rts.png file path')

    # Catalog command (visual catalog server)
    catalog_parser = subparsers.add_parser(
        'catalog',
        help='Launch visual catalog server',
        description='Launch a web-based visual catalog for browsing and booting .rts.png files'
    )
    catalog_parser.add_argument(
        '--port', '-p',
        type=int,
        default=8000,
        help='Port for catalog server (default: 8000)'
    )
    catalog_parser.add_argument(
        '--host',
        type=str,
        default="127.0.0.1",
        help='Host to bind server (default: 127.0.0.1)'
    )
    catalog_parser.add_argument(
        '--paths',
        type=str,
        default=None,
        help='Comma-separated directories to scan (default: current directory or RTS_REGISTRY_PATH)'
    )
    catalog_parser.add_argument(
        '--no-browser',
        action='store_true',
        help="Don't open browser automatically"
    )
    catalog_parser.add_argument(
        '-v', '--verbose',
        action='store_true',
        help='Enable verbose output'
    )

    args = parser.parse_args()

    if not args.command:
        parser.print_help()
        return 1

    # Dispatch to command handler
    handlers = {
        'convert': cmd_convert,
        'transpile': cmd_transpile,
        'boot': cmd_boot,
        'install': cmd_install,
        'catalog': cmd_catalog,
        'benchmark': cmd_benchmark,
        'dashboard': cmd_dashboard,
        'info': cmd_info,
        'analyze': cmd_analyze,
        'execute': cmd_execute,
        'vision': cmd_vision,
        'blueprint': lambda args: _dispatch_blueprint(args)
    }

    handler = handlers.get(args.command)
    if handler:
        return handler(args)

    return 0


def _dispatch_blueprint(args):
    """Dispatch blueprint subcommands to their handlers."""
    if not args.blueprint_command:
        # Show blueprint help if no subcommand provided
        import argparse
        parser = argparse.ArgumentParser(prog='pixelrts blueprint')
        subparsers = parser.add_subparsers(dest='blueprint_command', help='Blueprint command to run')
        subparsers.add_parser('generate', help='Generate PixelRTS v2 container with blueprint metadata')
        subparsers.add_parser('view', help='View blueprint overlay for PixelRTS container')
        subparsers.add_parser('analyze', help='Analyze and display blueprint information')
        parser.print_help()
        return 1

    blueprint_handlers = {
        'generate': cmd_blueprint_generate,
        'view': cmd_blueprint_view,
        'analyze': cmd_blueprint_analyze
    }

    handler = blueprint_handlers.get(args.blueprint_command)
    if handler:
        return handler(args)

    return 1


if __name__ == '__main__':
    sys.exit(main())
