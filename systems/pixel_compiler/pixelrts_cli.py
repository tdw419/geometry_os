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


def _boot_multiple(args, input_paths):
    """Boot multiple .rts.png files concurrently with unique VNC ports.

    Args:
        args: Parsed argparse arguments
        input_paths: List of Path objects to .rts.png files

    Returns:
        Exit code (0 on any success, 1 on total failure)
    """
    from systems.pixel_compiler.boot import MultiBootManager

    # Validate all input files exist
    valid_paths = []
    for path in input_paths:
        if not path.exists():
            print(f"Error: Input file not found: {path}", file=sys.stderr)
            continue
        if not path.is_file():
            print(f"Error: Input path is not a file: {path}", file=sys.stderr)
            continue
        valid_paths.append(path)

    if not valid_paths:
        print("Error: No valid input files to boot", file=sys.stderr)
        return 1

    if args.verbose:
        print(f"Booting {len(valid_paths)} containers...")
        if args.primary:
            print(f"Ordered boot: primary='{args.primary}' starts first")
            print(f"Shutdown order: helpers stop first, primary stops last")
        print(f"Memory per container: {args.memory}")
        print(f"CPUs per container: {args.cpus}")

    # Define progress callback for ordered boot
    def print_progress(event_type: str, data):
        """Print boot progress updates."""
        if args.quiet:
            return

        if event_type == "primary_start":
            print(f"[1/2] Booting primary: {data}")
        elif event_type == "primary_ready":
            print(f"[1/2] Primary ready: {data}")
        elif event_type == "helpers_start":
            count = len(data) if isinstance(data, list) else 1
            print(f"[2/2] Booting {count} helper container(s)...")
        elif event_type == "helper_ready":
            print(f"  - Helper ready: {data}")

    try:
        # Create MultiBootManager for concurrent boot
        manager = MultiBootManager()

        # Boot all containers concurrently
        result = manager.boot_all(
            paths=valid_paths,
            cmdline=args.cmdline,
            memory=args.memory,
            cpus=args.cpus,
            cleanup_on_failure=True,  # Clean up successful containers if any fail
            primary=args.primary,
            progress_callback=print_progress if args.primary else None,  # Only for ordered boot
            network_mode=args.network,
            ephemeral=getattr(args, 'ephemeral', False),
        )

        # Print results
        if not args.quiet:
            print(f"\n{'='*50}")
            print(f"Boot Results: {result.success_count}/{len(valid_paths)} succeeded")
            print(f"{'='*50}")

            for info in result.containers:
                if info.state.value == "running":
                    vnc_port = info.resources.vnc_port if info.resources else None
                    pid = info.boot_result.pid if info.boot_result else None
                    print(f"  [OK] {info.name}")
                    if vnc_port:
                        print(f"       VNC: :{vnc_port - 5900} (port {vnc_port})")
                    if pid:
                        print(f"       PID: {pid}")
                else:
                    print(f"  [FAIL] {info.name}")
                    if info.error_message:
                        print(f"         Error: {info.error_message}")

            if result.cleanup_performed:
                print(f"\nNote: Cleaned up {result.success_count} containers due to partial failure")

            # Display network fallback warning if any containers fell back
            fallback_containers = [c for c in result.containers if c.network_fallback]
            if fallback_containers:
                print(f"\nWarning: {len(fallback_containers)} container(s) fell back to isolated networking")
                print("         (Virtual network setup failed - using USER mode instead)")

        # Handle background mode
        if args.background:
            if not args.quiet:
                print(f"\nRunning {result.success_count} container(s) in background.")
                print("Use 'pixelrts ps' to list running containers.")
            return 0

        # Wait for containers
        if not args.quiet and result.success_count > 0:
            print("\nContainers running. Press Ctrl+C to stop all...")

        # Set up signal handler for graceful shutdown
        shutdown_requested = False

        def handle_shutdown(signum, frame):
            nonlocal shutdown_requested
            shutdown_requested = True
            if not args.quiet:
                print("\nShutdown requested, stopping all containers...")

        original_sigint = signal.signal(signal.SIGINT, handle_shutdown)
        original_sigterm = signal.signal(signal.SIGTERM, handle_shutdown)

        try:
            if not args.quiet and result.success_count > 0:
                # Wait for signal
                while not shutdown_requested:
                    signal.pause()
        finally:
            # Restore original signal handlers
            signal.signal(signal.SIGINT, original_sigint)
            signal.signal(signal.SIGTERM, original_sigterm)

            # Clean up all containers in reverse order
            if not args.quiet:
                if args.primary and result.success_count > 1:
                    print("\nStopping containers (helpers first, primary last)...")
                else:
                    print("\nStopping all containers...")
            # Use ordered shutdown when primary was specified
            if args.primary:
                manager.stop_all_ordered()
            else:
                manager.stop_all()

        # Return 0 on any success (per plan requirement), 1 on total failure
        return 0 if result.success_count > 0 else 1

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


def cmd_boot(args):
    """Handle boot command - Boot .rts.png files with QEMU.

    Supports both single-file and multi-file boot:
    - Single: pixelrts boot file.rts.png
    - Multi:  pixelrts boot a.rts.png b.rts.png c.rts.png

    Also supports booting committed VM snapshots:
    - Committed: pixelrts boot committed.rts.png (auto-detected vm-snapshot type)
    """
    from systems.pixel_compiler.boot import BootBridge, BootResult, MultiBootManager

    # Get list of input files
    input_paths = [Path(p) for p in args.inputs]

    # Multi-file boot path
    if len(input_paths) > 1:
        return _boot_multiple(args, input_paths)

    # Single-file boot path
    input_path = input_paths[0]

    if not input_path.exists():
        print(f"Error: Input file not found: {input_path}", file=sys.stderr)
        return 1

    if not input_path.is_file():
        print(f"Error: Input path is not a file: {input_path}", file=sys.stderr)
        return 1

    if args.verbose:
        print(f"Booting: {input_path}")
        print(f"Memory: {args.memory}")
        print(f"CPUs: {args.cpus}")
        print(f"VNC display: {args.vnc}")

    try:
        # Detect container type to route to appropriate booter
        try:
            from systems.pixel_compiler.boot.committed_boot import (
                CommittedFileBooter,
                ContainerType,
            )
            container_type = CommittedFileBooter.detect_container_type(input_path)

            if container_type == ContainerType.VM_SNAPSHOT:
                # Use CommittedFileBooter for vm-snapshot files
                if not args.quiet:
                    print(f"Detected committed VM snapshot: {input_path}")

                return _boot_committed(args, input_path)

        except ImportError as e:
            # CommittedFileBooter not available, fall back to BootBridge
            if args.verbose:
                print(f"CommittedFileBooter not available ({e}), using BootBridge")
        except Exception as e:
            # Detection failed, log warning and continue with BootBridge
            if args.verbose:
                print(f"Container type detection failed: {e}")

        # Handle ephemeral mode
        if getattr(args, 'ephemeral', False):
            from systems.pixel_compiler.boot.ephemeral_boot import EphemeralBooter

            if not args.quiet:
                print("Ephemeral mode: Changes will be discarded on exit")

            return _boot_ephemeral(args, input_path)

        # Use existing BootBridge for regular containers
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


def _boot_committed(args, input_path):
    """Boot a committed VM snapshot file using CommittedFileBooter."""
    from systems.pixel_compiler.boot.committed_boot import (
        CommittedFileBooter,
        CommittedBootError,
    )

    try:
        # Create CommittedFileBooter with options
        booter = CommittedFileBooter(
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
        with booter:
            result = booter.boot(
                cmdline=args.cmdline,
                extra_qemu_args=extra_qemu_args if extra_qemu_args else None,
            )

            if not result.success:
                print(f"Committed boot failed: {result.error_message}", file=sys.stderr)
                return 1

            # Print success info
            if not args.quiet:
                print(f"\nCommitted VM booted successfully!")
                print(f"  PID: {result.pid}")
                if result.vnc_port:
                    print(f"  VNC: :{result.vnc_port} (port {5900 + result.vnc_port})")

            # Handle background mode
            if args.background:
                if not args.quiet:
                    print(f"\nRunning in background. PID: {result.pid}")
                    print("Use 'kill {pid}' or Ctrl+C to stop.".format(pid=result.pid))
                # Don't wait - return success immediately
                # Note: temp files will be cleaned up when process exits
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

            # Return 130 for SIGINT (128 + 2), otherwise exit code
            if shutdown_requested:
                return 130
            return exit_code if result.process else 0

    except ImportError as e:
        print(f"Error: CommittedFileBooter not available: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Error booting committed file: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1


def _boot_ephemeral(args, input_path):
    """Boot a container in ephemeral mode using EphemeralBooter.

    In ephemeral mode, all changes are discarded on exit. The original
    file remains untouched as EphemeralBooter works on a temp copy.
    """
    from systems.pixel_compiler.boot.ephemeral_boot import EphemeralBooter, EphemeralBootError

    try:
        # Create EphemeralBooter with options
        booter = EphemeralBooter(
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

        # Perform boot with context manager for automatic cleanup
        with booter:
            result = booter.boot(
                cmdline=args.cmdline,
                extra_qemu_args=extra_qemu_args if extra_qemu_args else None,
            )

            if not result.success:
                print(f"Ephemeral boot failed: {result.error_message}", file=sys.stderr)
                return 1

            # Print success info
            if not args.quiet:
                print(f"\nEphemeral boot successful!")
                print(f"  PID: {result.pid}")
                if result.vnc_port:
                    print(f"  VNC: :{result.vnc_port} (port {5900 + result.vnc_port})")
                print(f"  Original preserved at: {booter.original_path}")

            # Handle background mode
            if args.background:
                if not args.quiet:
                    print(f"\nRunning in background. PID: {result.pid}")
                    print("Use 'kill {pid}' or Ctrl+C to stop.".format(pid=result.pid))
                    print("Note: Temp files will be cleaned up when process exits.")
                # Don't wait - return success immediately
                return 0

            # Wait for QEMU process
            if not args.quiet:
                print("\nWaiting for QEMU... (Ctrl+C to stop)")
                print("Changes will be discarded when VM exits.")

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

            # Return 130 for SIGINT (128 + 2), otherwise exit code
            if shutdown_requested:
                return 130
            return exit_code if result.process else 0

    except EphemeralBootError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1
    except ImportError as e:
        print(f"Error: EphemeralBooter not available: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Error booting in ephemeral mode: {e}", file=sys.stderr)
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
        print(f"  Vision: {args.vision}")

    # Initialize server singleton with options before uvicorn starts
    from systems.pixel_compiler.catalog.catalog_server import get_catalog_server
    get_catalog_server(watch_paths=watch_paths, use_vision=args.vision)

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


def cmd_serve(args):
    """
    Handle serve command - Start network boot server.

    Starts all network boot services:
    - DHCP proxy (port 4011) for PXE boot info
    - TFTP server (port 69) for boot files
    - HTTP server (port 8080) for faster boot file transfers (optional)
    - NBD server (port 10809) for root filesystem

    Exit codes:
        0: Clean shutdown
        1: Invalid file
        2: Port already in use
        3: Network detection failed
        4: Service startup failed
    """
    import asyncio
    from systems.pixel_compiler.serve.server import PixelRTSServer
    from systems.pixel_compiler.serve.progress import ServeProgress

    rts_file = args.file

    # Print startup banner
    try:
        from rich.console import Console
        from rich.panel import Panel
        console = Console()
        console.print(Panel.fit(
            "[bold blue]PixelRTS Network Boot Server[/bold blue]",
            border_style="blue"
        ))
    except ImportError:
        print("\n=== PixelRTS Network Boot Server ===\n")

    # Create server instance
    try:
        server = PixelRTSServer(
            rts_png_path=rts_file,
            interface=args.interface,
            verbose=args.verbose,
            enable_http=getattr(args, 'http', False),
            http_port=getattr(args, 'http_port', 8080),
            enable_delta=getattr(args, 'delta', False)
        )
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1

    # Create progress display
    progress = ServeProgress(verbose=args.verbose)

    # Set up signal handling for clean shutdown
    def signal_handler(signum, frame):
        print("\nShutdown signal received...")
        # The server handles shutdown internally via asyncio

    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)

    # Run the server
    try:
        exit_code = asyncio.run(server.run())

        # Print summary
        progress.print_summary()

        return exit_code

    except ValueError as e:
        print(f"Error: {e}", file=sys.stderr)
        print("\nPlease ensure the file is a valid PixelRTS container.",
              file=sys.stderr)
        return 1
    except RuntimeError as e:
        error_msg = str(e)

        # Provide specific guidance based on error
        if "Permission denied" in error_msg or "port" in error_msg.lower():
            print(f"\nError: {e}", file=sys.stderr)
            print("\nPossible solutions:", file=sys.stderr)
            print("  - Run with sudo: sudo pixelrts serve <file>", file=sys.stderr)
            print("  - Stop existing TFTP/DHCP services", file=sys.stderr)
            return 2
        elif "interface" in error_msg.lower() or "network" in error_msg.lower():
            print(f"\nError: {e}", file=sys.stderr)
            print("\nPossible solutions:", file=sys.stderr)
            print("  - Specify interface: pixelrts serve <file> --interface eth0",
                  file=sys.stderr)
            print("  - Check network connectivity", file=sys.stderr)
            return 3
        else:
            print(f"\nError: {e}", file=sys.stderr)
            return 4
    except Exception as e:
        print(f"\nUnexpected error: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 4


def cmd_diff(args):
    """Handle diff command - Compare two .rts.png files."""
    import json
    from systems.pixel_compiler.pixelrts_diff import PixelRTSDiffer, format_diff_output

    differ = PixelRTSDiffer()

    try:
        result = differ.diff(args.old, args.new)

        if args.json:
            # Create JSON-serializable copy (exclude numpy arrays)
            json_result = {
                'old_file': result.get('old_file'),
                'new_file': result.get('new_file'),
                'added_bytes': result.get('added_bytes'),
                'removed_bytes': result.get('removed_bytes'),
                'changed_bytes': result.get('changed_bytes'),
                'unchanged_bytes': result.get('unchanged_bytes'),
                'total_bytes': result.get('total_bytes'),
                'change_percent': result.get('change_percent'),
                'old_grid_size': result.get('old_grid_size'),
                'new_grid_size': result.get('new_grid_size'),
                'grid_size_used': result.get('grid_size_used'),
                'changed_regions': result.get('changed_regions', []),
                'channel_stats': result.get('channel_stats', {}),
                'old_metadata': result.get('old_metadata'),
                'new_metadata': result.get('new_metadata')
            }
            print(json.dumps(json_result, indent=2, default=str))
        else:
            print(format_diff_output(result))

        # Return 0 if identical, 1 if different (for scripting)
        return 0 if result.get('change_percent', 0) == 0 else 1

    except FileNotFoundError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 2
    except ValueError as e:
        # Invalid PNG or RTS format
        print(f"Error: Invalid file format - {e}", file=sys.stderr)
        return 3
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1


def cmd_delta(args):
    """
    Handle delta command - Generate delta manifest between two versions.

    Generates a JSON manifest describing byte-level changes between
    two .rts.png file versions, including checksums and byte ranges.
    """
    from systems.pixel_compiler.delta_manifest import generate_delta_manifest

    try:
        # Generate the manifest
        manifest = generate_delta_manifest(args.old, args.new)

        # Output to file or stdout
        if args.output:
            manifest.save(args.output)
            if not args.quiet:
                print(f"Delta manifest saved to: {args.output}")
                print(f"  Regions: {len(manifest.regions)}")
                print(f"  Changed: {manifest.compression_ratio}%")
                print(f"  Old size: {manifest.old_size:,} bytes")
                print(f"  New size: {manifest.new_size:,} bytes")
        else:
            # Output to stdout
            print(manifest.to_json())

        # Return 0 if identical, 1 if different (for scripting)
        return 0 if manifest.compression_ratio == 0 else 1

    except FileNotFoundError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 2
    except ValueError as e:
        print(f"Error: Invalid file format - {e}", file=sys.stderr)
        return 3
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1


def cmd_patch(args):
    """
    Handle patch command - Apply delta manifest to update a file.

    Applies a delta manifest to a base .rts.png file, validating
    checksums and applying byte-level patches.
    """
    from systems.pixel_compiler.delta_manifest import DeltaManifest
    from systems.pixel_compiler.delta_patch import apply_delta_patch, PatchError

    try:
        # Load the manifest
        manifest = DeltaManifest.load(args.manifest)

        # Apply the patch
        output_path = apply_delta_patch(
            base_path=args.base,
            manifest=manifest,
            output_path=args.output,
            validate_checksums=not args.skip_validation
        )

        # Print success message
        if not args.quiet:
            print(f"Patch applied successfully: {output_path}")
            print(f"  Regions applied: {len(manifest.regions)}")
            print(f"  Old size: {manifest.old_size:,} bytes")
            print(f"  New size: {manifest.new_size:,} bytes")

        return 0

    except PatchError as e:
        # Handle patch-specific errors
        if e.region_index is not None:
            print(f"Error in region {e.region_index}: {e.message}", file=sys.stderr)
        else:
            print(f"Error: {e.message}", file=sys.stderr)
        return 1
    except FileNotFoundError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 2
    except ValueError as e:
        print(f"Error: Invalid manifest format - {e}", file=sys.stderr)
        return 3
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 4


def cmd_snapshots(args):
    """Handle snapshots command - List all snapshots across all containers."""
    from systems.pixel_compiler.boot import MultiBootManager

    manager = MultiBootManager()

    if args.verbose:
        print("Listing all snapshots...")

    try:
        # Get all containers with snapshots
        storage = manager.snapshot_storage
        containers = storage.list_containers()

        if not containers:
            if not args.quiet:
                print("No snapshots found.")
            return 0

        all_snapshots = []

        for container in containers:
            snapshots = manager.list_container_snapshots(container)
            for snap in snapshots:
                all_snapshots.append((container, snap))

        if args.json:
            import json
            result = []
            for container, snap in all_snapshots:
                result.append({
                    "container": container,
                    "tag": snap.tag,
                    "id": snap.id,
                    "size": snap.size,
                    "date": str(snap.date) if snap.date else None,
                    "vm_clock": str(snap.vm_clock) if snap.vm_clock else None,
                })
            print(json.dumps(result, indent=2))
        else:
            # Table format
            print(f"{'CONTAINER':<15} {'TAG':<25} {'SIZE':<12} {'DATE'}")
            print(f"{'-'*15} {'-'*25} {'-'*12} {'-'*30}")
            for container, snap in all_snapshots:
                date_str = str(snap.date)[:19] if snap.date else "-"
                print(f"{container:<15} {snap.tag:<25} {snap.size:<12} {date_str}")

            if args.verbose:
                print(f"\nTotal: {len(all_snapshots)} snapshot(s) in {len(containers)} container(s)")

        return 0

    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1


def cmd_snapshot_create(args):
    """Handle snapshot create command - Create a VM snapshot."""
    from systems.pixel_compiler.boot import MultiBootManager
    from systems.pixel_compiler.boot.vm_snapshot import SnapshotError
    from datetime import datetime

    manager = MultiBootManager()
    container_name = args.container

    # Generate timestamp-based tag if not provided
    if not args.tag:
        args.tag = datetime.now().strftime("snap-%Y%m%d-%H%M%S")
        if args.verbose:
            print(f"Generated snapshot tag: {args.tag}")

    tag = args.tag

    if args.verbose:
        print(f"Creating snapshot '{tag}' for container '{container_name}'...")

    try:
        result = manager.create_snapshot(
            name=container_name,
            tag=tag,
            description=args.description or ""
        )

        if result.success:
            if not args.quiet:
                print(f"Snapshot '{tag}' created successfully")
                if result.metadata:
                    print(f"  ID: {result.metadata.snapshot_id}")
                    print(f"  State: {result.metadata.state.value}")
            return 0
        else:
            print(f"Error: Failed to create snapshot: {result.error_message}", file=sys.stderr)
            return 1

    except ValueError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1
    except SnapshotError as e:
        print(f"Error: Snapshot operation failed: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1


def cmd_commit(args):
    """Handle commit command - Commit a running container to a .rts.png file."""
    from systems.pixel_compiler.boot import MultiBootManager
    from systems.pixel_compiler.boot.snapshot_exporter import SnapshotExporter, ExportStage

    container_name = args.container
    output_path = Path(args.output)

    # Validate output path has .rts.png extension
    if not str(output_path).endswith('.rts.png'):
        print(f"Error: Output path must end with .rts.png", file=sys.stderr)
        return 1

    # Look up container in MultiBootManager
    manager = MultiBootManager()
    container = manager.get_container(container_name)

    if not container:
        print(f"Error: Container '{container_name}' not found", file=sys.stderr)
        print("Use 'pixelrts ps' to list running containers", file=sys.stderr)
        return 1

    # Check if this is an ephemeral container and show informational message
    is_ephemeral = getattr(container, 'is_ephemeral', False) or container.get('is_ephemeral', False)
    if is_ephemeral and not args.quiet:
        print(f"Note: Committing ephemeral container '{container_name}'")

    # Get BootBridge from running container
    boot_bridge = container.get('boot_bridge')
    if not boot_bridge:
        print(f"Error: Container '{container_name}' has no boot_bridge", file=sys.stderr)
        return 1

    if args.verbose:
        print(f"Committing container '{container_name}' to {output_path}...")

    # Progress callback for export stages
    def on_progress(progress):
        if args.quiet:
            return
        stage_name = progress.stage.value
        message = progress.message or ""
        if progress.stage == ExportStage.COMMITTING:
            print(f"Committing: {message}")
        elif progress.stage == ExportStage.EXTRACTING_BOOT_FILES:
            print(f"Extracting boot files: {message}")
        elif progress.stage == ExportStage.ENCODING:
            if "complete" in message.lower():
                print(f"Encoding: {message}")
        elif progress.stage == ExportStage.VERIFYING:
            print(f"Verifying: {message}")
        elif progress.stage == ExportStage.COMPLETE:
            pass  # Final success message printed below
        elif progress.stage == ExportStage.FAILED:
            print(f"Failed: {message}", file=sys.stderr)

    # Create SnapshotExporter and run export
    try:
        exporter = SnapshotExporter(boot_bridge, progress_callback=on_progress)

        if not args.quiet:
            print(f"Starting commit operation...")

        result = exporter.export(
            output_path=output_path,
            tag=args.snapshot,
            timeout=args.timeout,
            verify=not args.no_verify
        )

        if result.success:
            if not args.quiet:
                # Format size nicely
                size_bytes = result.size_bytes
                if size_bytes >= 1024 * 1024 * 1024:
                    size_str = f"{size_bytes / (1024 * 1024 * 1024):.2f} GB"
                elif size_bytes >= 1024 * 1024:
                    size_str = f"{size_bytes / (1024 * 1024):.2f} MB"
                elif size_bytes >= 1024:
                    size_str = f"{size_bytes / 1024:.2f} KB"
                else:
                    size_str = f"{size_bytes} bytes"

                print(f"Commit successful!")
                print(f"  Output: {result.output_path}")
                print(f"  Size: {size_str}")
                if result.snapshot_tag:
                    print(f"  Snapshot: {result.snapshot_tag}")
                if result.verified:
                    print(f"  Verified: Yes")
                elif args.no_verify:
                    print(f"  Verified: Skipped")
            return 0
        else:
            print(f"Error: Commit failed: {result.error_message}", file=sys.stderr)
            return 1

    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1


def cmd_snapshot_list(args):
    """Handle snapshot list command - List VM snapshots for a container."""
    from systems.pixel_compiler.boot import MultiBootManager
    from systems.pixel_compiler.boot.vm_snapshot import SnapshotError

    manager = MultiBootManager()
    container_name = args.container

    if args.verbose:
        print(f"Listing snapshots for container '{container_name}'...")

    try:
        snapshots = manager.list_container_snapshots(container_name)

        if not snapshots:
            if not args.quiet:
                print(f"No snapshots found for container '{container_name}'")
            return 0

        # Format output
        if args.json:
            import json
            snapshot_list = []
            for snap in snapshots:
                snapshot_list.append({
                    "tag": snap.tag,
                    "id": snap.id,
                    "size": snap.size,
                    "date": str(snap.date) if snap.date else None,
                    "vm_clock": str(snap.vm_clock) if snap.vm_clock else None,
                })
            print(json.dumps(snapshot_list, indent=2))
        else:
            # Table format with improved alignment for timestamp-based names
            print(f"Snapshots for container '{container_name}':")
            print(f"{'TAG':<25} {'SIZE':<12} {'DATE':<20} {'VM CLOCK'}")
            print(f"{'-'*25} {'-'*12} {'-'*20} {'-'*15}")
            for snap in snapshots:
                date_str = str(snap.date)[:19] if snap.date else "-"
                vm_clock_str = str(snap.vm_clock) if snap.vm_clock else "-"
                print(f"{snap.tag:<25} {snap.size:<12} {date_str:<20} {vm_clock_str}")

            if args.verbose:
                print(f"\nTotal: {len(snapshots)} snapshot(s)")

        return 0

    except ValueError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1
    except SnapshotError as e:
        print(f"Error: Snapshot operation failed: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1


def cmd_snapshot_restore(args):
    """Handle snapshot restore command - Restore a container from a snapshot."""
    from systems.pixel_compiler.boot import MultiBootManager
    from systems.pixel_compiler.boot.multi_boot_manager import RestoreResult
    from systems.pixel_compiler.boot.vm_snapshot import SnapshotError, RestoreState
    import time

    manager = MultiBootManager()
    container_name = args.container
    tag = args.tag

    if args.verbose:
        print(f"Restoring container '{container_name}' to snapshot '{tag}'...")

        # Show container state before restore
        try:
            containers = manager.list_containers()
            container_info = next((c for c in containers if c.name == container_name), None)
            if container_info:
                print(f"  Container state: {container_info.state.value}")
                if container_info.resources and container_info.resources.vnc_port:
                    print(f"  VNC port: {container_info.resources.vnc_port}")
        except Exception:
            pass  # Silently ignore if container info not available

    try:
        result = manager.restore_snapshot(name=container_name, tag=tag)

        if result.success:
            if not args.quiet:
                if HAS_CLICK:
                    click.secho(f"[OK] Container '{container_name}' restored to snapshot '{tag}'", fg='green')
                else:
                    print(f"[OK] Container '{container_name}' restored to snapshot '{tag}'")

            # Verbose output for identity preservation and network status
            if args.verbose:
                # Identity preservation status
                if result.identity_preserved:
                    print(f"  Identity preserved: Yes")
                else:
                    print(f"  Identity preserved: No (WARNING: name or ports changed)")

                # Network reconnection status
                if result.network_reconnected is None:
                    print(f"  Network reconnected: Using fallback mode")
                elif result.network_reconnected:
                    print(f"  Network reconnected: Yes")
                else:
                    print(f"  Network reconnected: No")

                # State transition
                pre_state = result.pre_restore_state.value if result.pre_restore_state else "unknown"
                post_state = result.post_restore_state.value if result.post_restore_state else "unknown"
                print(f"  State transition: {pre_state} -> {post_state}")

                # Show restore progress details if available
                if result.restore_progress:
                    progress = result.restore_progress
                    if hasattr(progress, 'pre_restore_vm_state') and progress.pre_restore_vm_state:
                        print(f"  Pre-restore VM state: {progress.pre_restore_vm_state}")
                    if hasattr(progress, 'completed_at') and progress.completed_at:
                        duration = (progress.completed_at - progress.started_at).total_seconds()
                        print(f"  Duration: {duration:.2f}s")

            # Wait for VM to stabilize if requested
            wait_time = getattr(args, 'wait', 0)
            if wait_time > 0:
                if args.verbose:
                    print(f"  Waiting {wait_time}s for VM to stabilize...")
                time.sleep(wait_time)

                # Re-check container state after wait
                try:
                    containers = manager.list_containers()
                    container_info = next((c for c in containers if c.name == container_name), None)
                    if container_info and args.verbose:
                        print(f"  Post-wait state: {container_info.state.value}")
                except Exception:
                    pass

            return 0
        else:
            if HAS_CLICK:
                click.secho(f"[FAIL] Failed to restore snapshot", fg='red', file=sys.stderr)
            else:
                print(f"[FAIL] Failed to restore snapshot", file=sys.stderr)
            print(f"  Error: {result.error_message}", file=sys.stderr)

            # Show failure state in verbose mode
            if args.verbose and result.restore_progress:
                progress = result.restore_progress
                if hasattr(progress, 'state'):
                    print(f"  Failed at state: {progress.state.value}", file=sys.stderr)

            return 1

    except ValueError as e:
        if HAS_CLICK:
            click.secho(f"[ERROR] {e}", fg='red', file=sys.stderr)
        else:
            print(f"[ERROR] {e}", file=sys.stderr)
        return 1
    except SnapshotError as e:
        if HAS_CLICK:
            click.secho(f"[ERROR] Snapshot operation failed: {e}", fg='red', file=sys.stderr)
        else:
            print(f"[ERROR] Snapshot operation failed: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        if HAS_CLICK:
            click.secho(f"[ERROR] {e}", fg='red', file=sys.stderr)
        else:
            print(f"[ERROR] {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1


def cmd_snapshot_delete(args):
    """Handle snapshot delete command - Delete a VM snapshot."""
    from systems.pixel_compiler.boot import MultiBootManager
    from systems.pixel_compiler.boot.vm_snapshot import SnapshotError

    manager = MultiBootManager()
    container_name = args.container
    tag = args.tag

    # Confirm deletion unless --force
    if not args.force:
        response = input(f"Delete snapshot '{tag}' from container '{container_name}'? [y/N] ")
        if response.lower() != 'y':
            print("Aborted.")
            return 1

    if args.verbose:
        print(f"Deleting snapshot '{tag}' from container '{container_name}'...")

    try:
        result = manager.delete_snapshot(name=container_name, tag=tag)

        if result.success:
            if not args.quiet:
                print(f"Snapshot '{tag}' deleted from container '{container_name}'")
            return 0
        else:
            print(f"Error: Failed to delete snapshot: {result.error_message}", file=sys.stderr)
            return 1

    except ValueError as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1
    except SnapshotError as e:
        print(f"Error: Snapshot operation failed: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1


def cmd_ps(args):
    """
    Handle ps command - List running containers.

    Shows a formatted table with container NAME, STATE, VNC port, and PID.
    Reads from state file (default: /tmp/pixelrts/containers.json).
    """
    import json

    state_file = Path(args.state_file)

    if not state_file.exists():
        if args.json:
            print("[]")
        else:
            print("No containers found.")
            print(f"State file: {state_file}")
        return 0

    try:
        with open(state_file, 'r') as f:
            containers = json.load(f)
    except json.JSONDecodeError as e:
        print(f"Error: Invalid state file: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Error reading state file: {e}", file=sys.stderr)
        return 1

    if args.json:
        print(json.dumps(containers, indent=2))
        return 0

    if not containers:
        print("No containers found.")
        return 0

    # Format table output
    # Column widths
    name_width = max(len(c.get('name', 'N/A')) for c in containers)
    name_width = max(name_width, 4)  # Minimum width for "NAME"

    state_width = max(len(c.get('state', 'N/A')) for c in containers)
    state_width = max(state_width, 5)  # Minimum width for "STATE"

    # Header
    print(f"{'NAME':<{name_width}}  {'STATE':<{state_width}}  {'EPHEM':>5}  {'VNC':>6}  {'PID':>7}")
    print(f"{'-'*name_width}  {'-'*state_width}  {'-'*5}  {'-'*6}  {'-'*7}")

    # Rows
    for c in containers:
        name = c.get('name', 'N/A')
        state = c.get('state', 'N/A')
        vnc_port = c.get('vnc_port', '-')
        pid = c.get('pid', '-')
        is_ephemeral = c.get('is_ephemeral', False)

        vnc_str = str(vnc_port) if vnc_port else '-'
        pid_str = str(pid) if pid else '-'
        ephem_str = '[E]' if is_ephemeral else ''

        print(f"{name:<{name_width}}  {state:<{state_width}}  {ephem_str:>5}  {vnc_str:>6}  {pid_str:>7}")

    return 0


def cmd_update(args):
    """
    Handle update command - Update local .rts.png file via delta patch.

    Fetches delta manifest from server and applies only changed regions,
    minimizing bandwidth usage compared to full file download.
    """
    import urllib.request
    import urllib.error
    import hashlib
    from pathlib import Path

    from systems.pixel_compiler.delta_manifest import DeltaManifest
    from systems.pixel_compiler.delta_patch import (
        DeltaPatcher,
        PatchError,
        HTTPByteFetcher,
        apply_delta_patch
    )
    from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder

    rts_file = Path(args.file)
    server_url = args.server.rstrip('/')

    # Validate local file exists
    if not rts_file.exists():
        print(f"Error: File not found: {args.file}", file=sys.stderr)
        return 2

    if not str(rts_file).endswith('.rts.png'):
        print(f"Error: File must be a .rts.png file: {args.file}", file=sys.stderr)
        return 1

    # Fetch manifest from server
    manifest_url = f"{server_url}/delta/{rts_file.name}.json"

    if not args.quiet:
        print(f"Fetching manifest from: {manifest_url}")

    try:
        request = urllib.request.Request(manifest_url)
        with urllib.request.urlopen(request, timeout=30) as response:
            if response.status != 200:
                print(f"Error: Server returned status {response.status}", file=sys.stderr)
                return 3
            manifest_data = response.read().decode('utf-8')
    except urllib.error.HTTPError as e:
        if e.code == 404:
            print(f"Error: No delta manifest found for {rts_file.name}", file=sys.stderr)
            print("The server may not have delta updates enabled.", file=sys.stderr)
        else:
            print(f"Error: HTTP error {e.code}: {e.reason}", file=sys.stderr)
        return 3
    except urllib.error.URLError as e:
        print(f"Error: Failed to connect to server: {e.reason}", file=sys.stderr)
        return 3

    # Parse manifest
    try:
        manifest = DeltaManifest.from_json(manifest_data)
    except Exception as e:
        print(f"Error: Failed to parse manifest: {e}", file=sys.stderr)
        return 3

    if not args.quiet:
        print(f"Manifest retrieved:")
        print(f"  Regions: {len(manifest.regions)}")
        print(f"  Old size: {manifest.old_size:,} bytes")
        print(f"  New size: {manifest.new_size:,} bytes")

    # Check if update needed via checksum
    with open(rts_file, 'rb') as f:
        local_png_data = f.read()

    decoder = PixelRTSDecoder()
    local_data = decoder.decode(local_png_data)
    local_checksum = hashlib.sha256(local_data).hexdigest()

    if local_checksum == manifest.new_checksum:
        if not args.quiet:
            print("Local file is already up to date.")
        return 0

    if local_checksum != manifest.old_checksum:
        print("Warning: Local file checksum doesn't match manifest's old_checksum.", file=sys.stderr)
        if not args.force:
            print("Use --force to update anyway.", file=sys.stderr)
            return 1

    # Create HTTP byte fetcher for remote regions
    file_url = f"{server_url}/{rts_file.name}"
    fetcher = HTTPByteFetcher(file_url)

    # Apply the patch
    try:
        output_path = apply_delta_patch(
            base_path=str(rts_file),
            manifest=manifest,
            output_path=args.output,
            byte_fetcher=fetcher,
            validate_checksums=not args.skip_validation
        )

        if not args.quiet:
            print(f"Update applied successfully: {output_path}")
            print(f"  Regions applied: {len(manifest.regions)}")
            print(f"  Bytes transferred: {fetcher.bytes_fetched:,}")
            full_size = manifest.new_size
            if full_size > 0:
                savings = 100 * (1 - fetcher.bytes_fetched / full_size)
                print(f"  Bandwidth saved: {savings:.1f}%")

        return 0

    except PatchError as e:
        if e.region_index is not None:
            print(f"Error in region {e.region_index}: {e.message}", file=sys.stderr)
        else:
            print(f"Error: {e.message}", file=sys.stderr)
        return 1
    except urllib.error.URLError as e:
        print(f"Error: Failed to fetch region data: {e.reason}", file=sys.stderr)
        return 3
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 4


def cmd_verify(args):
    """
    Handle verify command - Verify .rts.png file integrity and authenticity.

    Runs all verification checks: structure, hash consistency, segment integrity,
    and signature. Provides unified interface with --json and --verbose flags.
    """
    from datetime import datetime

    from systems.pixel_compiler.verification import (
        VerificationContext,
        VerificationResult,
        VerificationStatus,
        StructureVerifier,
        ConsistencyVerifier,
        SegmentIntegrityChecker,
        SignatureVerifier
    )

    input_path = Path(args.input)

    # Validate input file exists and is a file
    if not input_path.exists():
        print(f"Error: Input file not found: {args.input}", file=sys.stderr)
        return 1

    if not input_path.is_file():
        print(f"Error: Input path is not a file: {args.input}", file=sys.stderr)
        return 1

    try:
        # Create verification context
        context = VerificationContext(input_path)

        # Run all verifiers in sequence (do not stop on first failure)
        verifiers = [
            StructureVerifier(),
            ConsistencyVerifier(),
            SegmentIntegrityChecker(),
            SignatureVerifier()
        ]

        steps = []
        for verifier in verifiers:
            try:
                step_result = verifier.verify(context)
                steps.append(step_result)
            except Exception as e:
                # If a verifier throws an exception, create a FAIL result
                from systems.pixel_compiler.verification import StepResult
                steps.append(StepResult(
                    step_name=verifier.name,
                    status=VerificationStatus.FAIL,
                    message=f"Verifier error: {e}",
                    details={"error": str(e)},
                    duration_ms=0.0
                ))

        # Determine overall status
        # FAIL if any step has status FAIL
        # WARNING if any step has status WARNING (but no FAIL)
        # PASS otherwise (all PASS or SKIP)
        overall_status = VerificationStatus.PASS

        for step in steps:
            if step.status == VerificationStatus.FAIL:
                overall_status = VerificationStatus.FAIL
                break
            elif step.status == VerificationStatus.WARNING:
                overall_status = VerificationStatus.WARNING

        # Build verification result
        result = VerificationResult(
            overall_status=overall_status,
            steps=steps,
            file_path=str(input_path),
            timestamp=datetime.now()
        )

        # Output handling
        if args.json:
            print(result.to_json(indent=2))
        else:
            print(result.format_cli(verbose=args.verbose))

        # Exit codes: 0 for PASS or WARNING (CI-compatible), 1 for FAIL
        if overall_status == VerificationStatus.FAIL:
            return 1
        return 0

    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        return 1


def cmd_brain_status(args):
    """
    Handle brain status command - Show brain evolution status and mutation history.

    Displays mutation statistics and recent evolution activity. If --json flag is set,
    outputs machine-parseable JSON. Otherwise shows human-readable summary.
    """
    import json
    import os

    brain_path = args.brain

    # Check if brain file exists
    search_paths = [
        brain_path,
        f"systems/visual_shell/brains/{brain_path}",
        f"brains/{brain_path}",
        f".geometry/brains/{brain_path}"
    ]

    found_path = None
    for path in search_paths:
        if os.path.exists(path):
            found_path = path
            break

    try:
        from systems.evolution_daemon.evolution_hooks.brain_evolution_hook import BrainEvolutionHook

        hook = BrainEvolutionHook(brain_path=brain_path)
        stats = hook.get_mutation_stats()

        if args.json:
            output = {
                "brain_path": found_path or brain_path,
                "found": found_path is not None,
                "stats": stats
            }
            print(json.dumps(output, indent=2))
        else:
            print(f"Brain Atlas: {found_path or brain_path}")
            print(f"Status: {'Available' if found_path else 'Not Found'}")
            print()

            if stats["total"] == 0:
                print("No mutations recorded yet.")
                print()
                print("Run 'pixelrts brain evolve' to trigger evolution.")
            else:
                print("Mutation Statistics:")
                print(f"  Total Mutations:  {stats['total']}")
                print(f"  Kept:             {stats['kept']}")
                print(f"  Reverted:         {stats['reverted']}")
                print(f"  Keep Rate:        {stats['keep_rate']*100:.1f}%")
                if stats['avg_improvement'] > 0:
                    print(f"  Avg Improvement:  {stats['avg_improvement']:.4f}")
                print()
                print(f"Sectors Mutated: {', '.join(stats['sectors_mutated'])}")

        return 0

    except ImportError as e:
        print(f"Error: Brain evolution module not available: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Error: Failed to get brain status: {e}", file=sys.stderr)
        return 1


def cmd_brain_evolve(args):
    """
    Handle brain evolve command - Trigger a brain evolution cycle.

    Runs a single evolution cycle on the specified brain atlas sector,
    evaluating fitness and keeping only beneficial mutations.
    """
    import asyncio
    import json

    brain_path = args.brain
    sector = args.sector
    mutation_rate = args.rate if args.rate > 0 else 0.01

    try:
        from systems.evolution_daemon.evolution_hooks.brain_evolution_hook import BrainEvolutionHook

        hook = BrainEvolutionHook(
            brain_path=brain_path,
            mutation_rate=mutation_rate
        )

        async def run_evolution():
            cycle_data = {
                'evolve_brain': True,
                'cycle_number': 1,
                'sector': sector
            }

            result = await hook.on_evolution_cycle(cycle_data)
            return result

        result = asyncio.run(run_evolution())

        if args.json:
            output = {
                "brain_path": brain_path,
                "result": result
            }
            print(json.dumps(output, indent=2))
        else:
            if result.get('skipped'):
                print(f"Evolution skipped: {result.get('reason', 'unknown')}")
            elif result.get('error'):
                print(f"Evolution failed: {result['error']}")
            elif result.get('success'):
                print("Evolution cycle completed:")
                print(f"  Mutation Type:  {result.get('mutation_type', 'unknown')}")
                if result.get('sector'):
                    print(f"  Sector:         {result['sector']}")
                if 'fitness_before' in result:
                    print(f"  Fitness Before: {result['fitness_before']:.4f}")
                if 'fitness_after' in result:
                    print(f"  Fitness After:  {result['fitness_after']:.4f}")
                if 'improvement' in result:
                    print(f"  Improvement:    {result['improvement']:+.4f}")
                print(f"  Kept:           {'Yes' if result.get('kept') else 'No'}")
            else:
                print(f"Evolution result: {result}")

        return 0 if result.get('success') or result.get('skipped') else 1

    except ImportError as e:
        print(f"Error: Brain evolution module not available: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Error: Evolution failed: {e}", file=sys.stderr)
        return 1


def cmd_mesh_status(args):
    """
    Handle mesh status command - Show mesh network status.

    Displays node information and peer status. If --json flag is set,
    outputs machine-parseable JSON. Otherwise shows human-readable table.
    """
    import json

    from systems.network_boot.network_boot import NetworkBoot

    # Create a reference instance for status display
    # In production, this would connect to a running daemon
    nb = NetworkBoot()

    status = nb.get_status()

    if args.json:
        print(json.dumps(status, indent=2))
        return 0

    # Human-readable output
    print(f"Node ID:    {status['node_id']}")
    print(f"Hostname:   {status['hostname']}")
    print(f"Running:    {'Yes' if status['running'] else 'No'}")
    print(f"Peers:      {status['peer_count']} known, {status['active_peers']} active")

    if args.verbose:
        print()
        print("Peer Details:")
        if nb.registry.get_peer_count() == 0:
            print("  No peers discovered")
        else:
            for node_id, peer in nb.registry.peers.items():
                sync_status = "connected" if peer.sync_active else "discovered"
                print(f"  - {node_id}: {peer.beacon.hostname} ({sync_status})")

    return 0


def cmd_mesh_discover(args):
    """
    Handle mesh discover command - Trigger immediate peer discovery.

    Broadcasts a discovery beacon and listens for peer responses
    for the specified timeout duration.
    """
    import asyncio
    import json

    from systems.network_boot.network_boot import NetworkBoot

    async def run_discovery():
        nb = NetworkBoot()

        print(f"Broadcasting discovery beacon...")
        await nb.broadcaster.start()

        # Broadcast discovery beacon
        await nb.broadcaster.broadcast_beacon(orb_count=0)

        discovered = []
        start_time = asyncio.get_event_loop().time()

        # Listen for peer beacons
        while (asyncio.get_event_loop().time() - start_time) < args.timeout:
            beacon = await nb.broadcaster.receive_beacon(timeout=1.0)
            if beacon:
                discovered.append(beacon)
                if not args.json:
                    print(f"  Discovered: {beacon.node_id} ({beacon.hostname})")

        nb.broadcaster.stop()
        return discovered

    try:
        discovered = asyncio.run(run_discovery())

        if args.json:
            result = {
                "discovered_count": len(discovered),
                "peers": [b.to_dict() for b in discovered],
                "timeout": args.timeout
            }
            print(json.dumps(result, indent=2))
        else:
            print(f"\nDiscovery complete: {len(discovered)} peer(s) found")

        return 0

    except Exception as e:
        print(f"Error: Discovery failed: {e}", file=sys.stderr)
        return 1


def _dispatch_mesh(args):
    """Dispatch mesh subcommands to their handlers."""
    if not args.mesh_command:
        # Show mesh help if no subcommand provided
        import argparse
        parser = argparse.ArgumentParser(prog='pixelrts mesh')
        subparsers = parser.add_subparsers(dest='mesh_command', help='Mesh command to run')
        subparsers.add_parser('status', help='Show mesh network status')
        subparsers.add_parser('discover', help='Trigger immediate peer discovery')
        parser.print_help()
        return 1

    mesh_handlers = {
        'status': cmd_mesh_status,
        'discover': cmd_mesh_discover
    }

    handler = mesh_handlers.get(args.mesh_command)
    if handler:
        return handler(args)

    return 1


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
  serve        Start network boot server (DHCP, TFTP, NBD)
  catalog      Launch visual catalog server for browsing .rts.png files
  ps           List running containers with state, VNC port, and PID
  snapshot     VM snapshot commands (create, list, restore, delete)
  commit       Commit a running container to .rts.png file
  diff         Compare two .rts.png files and show differences
  delta        Generate delta manifest between two versions
  patch        Apply delta manifest to update a file
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
  pixelrts serve alpine.rts.png
  pixelrts serve os.rts.png --interface eth0
  pixelrts catalog
  pixelrts catalog --port 8080 --paths /path/to/images
  pixelrts catalog --no-browser
  pixelrts snapshot create alpine before-update -d "Pre-update snapshot"
  pixelrts snapshot list alpine
  pixelrts snapshot restore alpine before-update
  pixelrts snapshot delete alpine before-update --force
  pixelrts diff old.rts.png new.rts.png
  pixelrts diff old.rts.png new.rts.png --json
  pixelrts delta old.rts.png new.rts.png -o manifest.json
  pixelrts delta old.rts.png new.rts.png --quiet
  pixelrts patch base.rts.png manifest.json
  pixelrts patch base.rts.png manifest.json -o updated.rts.png
  pixelrts patch base.rts.png manifest.json --skip-validation
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
    boot_parser.add_argument('inputs', nargs='+', metavar='input',
                            help='Input .rts.png file(s) to boot (supports multiple files)')
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
    boot_parser.add_argument('--primary', '-p',
                            help='Name of primary container (starts first, stops last)')
    boot_parser.add_argument('--network', type=str, default='user',
                            choices=['user', 'socket_mcast'],
                            help='Network mode: user (isolated) or socket_mcast (mesh, default: user)')
    boot_parser.add_argument('--ephemeral', '-e',
                            action='store_true',
                            help='Boot in ephemeral mode - changes are discarded on exit')

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
        '--vision',
        action='store_true',
        help="Enable AI vision analysis during scanning"
    )
    catalog_parser.add_argument(
        '-v', '--verbose',
        action='store_true',
        help='Enable verbose output'
    )

    # Serve command (network boot server)
    serve_parser = subparsers.add_parser(
        'serve',
        help='Start network boot server',
        description='Start PXE network boot server with DHCP proxy, TFTP, and NBD services'
    )
    serve_parser.add_argument(
        'file',
        help='PixelRTS container file to serve (.rts.png)'
    )
    serve_parser.add_argument(
        '--interface', '-i',
        type=str,
        default=None,
        help='Network interface to bind (auto-detect if not specified)'
    )
    serve_parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='Enable verbose output'
    )
    serve_parser.add_argument(
        '--http',
        action='store_true',
        help='Enable HTTP boot for faster transfers (chainloads iPXE)'
    )
    serve_parser.add_argument(
        '--delta',
        action='store_true',
        help='Enable delta update support (serves /delta/* endpoints)'
    )
    serve_parser.add_argument(
        '--delta-from',
        type=str,
        default=None,
        help='Generate initial delta from this file (for remote updates)'
    )
    serve_parser.set_defaults(func=cmd_serve)

    # Diff command (compare two .rts.png files)
    diff_parser = subparsers.add_parser(
        'diff',
        help='Compare two .rts.png files',
        description='Compare two .rts.png files and show byte-level differences'
    )
    diff_parser.add_argument(
        'old',
        help='Original .rts.png file'
    )
    diff_parser.add_argument(
        'new',
        help='New/modified .rts.png file'
    )
    diff_parser.add_argument(
        '--json',
        action='store_true',
        help='Output as JSON'
    )
    diff_parser.add_argument(
        '-v', '--verbose',
        action='store_true',
        help='Enable verbose output'
    )
    diff_parser.set_defaults(func=cmd_diff)

    # Delta command (generate delta manifest)
    delta_parser = subparsers.add_parser(
        'delta',
        help='Generate delta manifest between two versions',
        description='Generate a JSON manifest describing byte-level changes between two .rts.png file versions'
    )
    delta_parser.add_argument(
        'old',
        help='Original .rts.png file'
    )
    delta_parser.add_argument(
        'new',
        help='New/modified .rts.png file'
    )
    delta_parser.add_argument(
        '-o', '--output',
        help='Output manifest file (default: stdout)'
    )
    delta_parser.add_argument(
        '-q', '--quiet',
        action='store_true',
        help='Suppress summary output'
    )
    delta_parser.add_argument(
        '-v', '--verbose',
        action='store_true',
        help='Enable verbose output'
    )
    delta_parser.set_defaults(func=cmd_delta)

    # Patch command (apply delta manifest)
    patch_parser = subparsers.add_parser(
        'patch',
        help='Apply delta manifest to update a file',
        description='Apply a delta manifest to a base .rts.png file to update it'
    )
    patch_parser.add_argument(
        'base',
        help='Base .rts.png file to patch'
    )
    patch_parser.add_argument(
        'manifest',
        help='Delta manifest JSON file'
    )
    patch_parser.add_argument(
        '-o', '--output',
        help='Output file path (default: patch in-place)'
    )
    patch_parser.add_argument(
        '--skip-validation',
        action='store_true',
        help='Skip checksum validation (faster but less safe)'
    )
    patch_parser.add_argument(
        '-q', '--quiet',
        action='store_true',
        help='Suppress success output'
    )
    patch_parser.add_argument(
        '-v', '--verbose',
        action='store_true',
        help='Enable verbose output'
    )
    patch_parser.set_defaults(func=cmd_patch)

    # Update command (update local file via delta)
    update_parser = subparsers.add_parser(
        'update',
        help='Update local .rts.png file via delta patch',
        description='Fetch delta manifest from server and apply only changed regions to minimize bandwidth'
    )
    update_parser.add_argument(
        'file',
        help='Local .rts.png file to update'
    )
    update_parser.add_argument(
        '--server', '-s',
        type=str,
        default='http://localhost:8080',
        help='Server URL for delta updates (e.g., http://localhost:8080)'
    )
    update_parser.add_argument(
        '-o', '--output',
        type=str,
        default=None,
        help='Output file path (default: patch in-place)'
    )
    update_parser.add_argument(
        '--force', '-f',
        action='store_true',
        help='Force update even if file unchanged'
    )
    update_parser.add_argument(
        '--skip-validation',
        action='store_true',
        help='Skip checksum validation'
    )
    update_parser.add_argument(
        '-q', '--quiet',
        action='store_true',
        help='Suppress progress output'
    )
    update_parser.add_argument(
        '-v', '--verbose',
        action='store_true',
        help='Enable verbose output'
    )
    update_parser.set_defaults(func=cmd_update)

    # PS command (list running containers)
    ps_parser = subparsers.add_parser(
        'ps',
        help='List running containers',
        description='Show running PixelRTS containers with their state, VNC port, and PID'
    )
    ps_parser.add_argument(
        '--json',
        action='store_true',
        help='Output as JSON'
    )
    ps_parser.add_argument(
        '--state-file',
        type=str,
        default='/tmp/pixelrts/containers.json',
        help='Path to state file (default: /tmp/pixelrts/containers.json)'
    )
    ps_parser.set_defaults(func=cmd_ps)

    # Snapshots command (list all across containers)
    snapshots_parser = subparsers.add_parser(
        'snapshots',
        help='List all snapshots across containers',
        description='List all snapshots from all containers'
    )
    snapshots_parser.add_argument('--json', action='store_true', help='Output as JSON')
    snapshots_parser.add_argument('-q', '--quiet', action='store_true', help='Suppress output')
    snapshots_parser.add_argument('-v', '--verbose', action='store_true', help='Enable verbose output')
    snapshots_parser.set_defaults(func=cmd_snapshots)

    # Snapshot command group
    snapshot_parser = subparsers.add_parser(
        'snapshot',
        help='VM snapshot commands',
        description='Manage VM snapshots (create, list, restore, delete)'
    )
    snapshot_subparsers = snapshot_parser.add_subparsers(dest='snapshot_command', help='Snapshot command to run')

    # snapshot create
    snapshot_create_parser = snapshot_subparsers.add_parser(
        'create',
        help='Create a VM snapshot',
        description='Create a snapshot of a running container'
    )
    snapshot_create_parser.add_argument('container', help='Container name')
    snapshot_create_parser.add_argument('tag', nargs='?', default=None,
                                        help='Snapshot tag (default: snap-YYYYMMDD-HHMMSS)')
    snapshot_create_parser.add_argument('-d', '--description', default='', help='Snapshot description')
    snapshot_create_parser.add_argument('-q', '--quiet', action='store_true', help='Suppress output')
    snapshot_create_parser.add_argument('-v', '--verbose', action='store_true', help='Enable verbose output')
    snapshot_create_parser.set_defaults(func=cmd_snapshot_create)

    # snapshot list
    snapshot_list_parser = snapshot_subparsers.add_parser(
        'list',
        help='List VM snapshots',
        description='List snapshots for a container'
    )
    snapshot_list_parser.add_argument('container', help='Container name')
    snapshot_list_parser.add_argument('--json', action='store_true', help='Output as JSON')
    snapshot_list_parser.add_argument('-q', '--quiet', action='store_true', help='Suppress output')
    snapshot_list_parser.add_argument('-v', '--verbose', action='store_true', help='Enable verbose output')
    snapshot_list_parser.set_defaults(func=cmd_snapshot_list)

    # snapshot restore
    snapshot_restore_parser = snapshot_subparsers.add_parser(
        'restore',
        help='Restore VM from snapshot',
        description='Restore a container to a snapshot'
    )
    snapshot_restore_parser.add_argument('container', help='Container name')
    snapshot_restore_parser.add_argument('tag', help='Snapshot tag to restore')
    snapshot_restore_parser.add_argument('-q', '--quiet', action='store_true', help='Suppress output')
    snapshot_restore_parser.add_argument('-v', '--verbose', action='store_true', help='Enable verbose output')
    snapshot_restore_parser.add_argument('-w', '--wait', type=float, default=0,
                                          help='Wait N seconds after restore for VM to stabilize (default: 0)')
    snapshot_restore_parser.set_defaults(func=cmd_snapshot_restore)

    # snapshot delete
    snapshot_delete_parser = snapshot_subparsers.add_parser(
        'delete',
        help='Delete VM snapshot',
        description='Delete a snapshot from a container'
    )
    snapshot_delete_parser.add_argument('container', help='Container name')
    snapshot_delete_parser.add_argument('tag', help='Snapshot tag to delete')
    snapshot_delete_parser.add_argument('-f', '--force', action='store_true', help='Skip confirmation prompt')
    snapshot_delete_parser.add_argument('-q', '--quiet', action='store_true', help='Suppress output')
    snapshot_delete_parser.add_argument('-v', '--verbose', action='store_true', help='Enable verbose output')
    snapshot_delete_parser.set_defaults(func=cmd_snapshot_delete)

    # Commit command
    commit_parser = subparsers.add_parser(
        'commit',
        help='Commit a running container to a .rts.png file',
        description='Commit a running container to a portable .rts.png file that preserves disk and memory state'
    )
    commit_parser.add_argument(
        'container',
        help='Name of the running container to commit (use "pixelrts ps" to list)'
    )
    commit_parser.add_argument(
        'output',
        help='Output path for the committed .rts.png file'
    )
    commit_parser.add_argument(
        '--snapshot',
        metavar='TAG',
        help='Tag of specific snapshot to commit (default: auto-create)'
    )
    commit_parser.add_argument(
        '--no-verify',
        action='store_true',
        help='Skip verification of the committed file'
    )
    commit_parser.add_argument(
        '--timeout',
        type=int,
        default=600,
        help='Timeout for commit operation in seconds (default: 600)'
    )
    commit_parser.add_argument(
        '-q', '--quiet',
        action='store_true',
        help='Suppress progress output'
    )
    commit_parser.add_argument(
        '-v', '--verbose',
        action='store_true',
        help='Enable verbose output'
    )
    commit_parser.set_defaults(func=cmd_commit)

    # Verify command
    verify_parser = subparsers.add_parser(
        'verify',
        help='Verify .rts.png file integrity and authenticity',
        description='Runs all verification checks: structure, hash consistency, segment integrity, and signature.'
    )
    verify_parser.add_argument('input', help='Input .rts.png file to verify')
    verify_parser.add_argument('--json', action='store_true',
                              help='Output results in JSON format for machine parsing')
    verify_parser.add_argument('-v', '--verbose', action='store_true',
                              help='Show detailed step-by-step verification output')
    verify_parser.set_defaults(func=cmd_verify)

    # Mesh networking commands
    mesh_parser = subparsers.add_parser(
        'mesh',
        help='Mesh network operations'
    )
    mesh_subparsers = mesh_parser.add_subparsers(dest='mesh_command', help='Mesh commands')

    # mesh status
    mesh_status_parser = mesh_subparsers.add_parser(
        'status',
        help='Show mesh network status'
    )
    mesh_status_parser.add_argument(
        '--json',
        action='store_true',
        help='Output as JSON'
    )
    mesh_status_parser.add_argument(
        '-v', '--verbose',
        action='store_true',
        help='Show detailed peer information'
    )
    mesh_status_parser.set_defaults(func=cmd_mesh_status)

    # mesh discover
    mesh_discover_parser = mesh_subparsers.add_parser(
        'discover',
        help='Trigger immediate peer discovery'
    )
    mesh_discover_parser.add_argument(
        '--json',
        action='store_true',
        help='Output as JSON'
    )
    mesh_discover_parser.add_argument(
        '--timeout',
        type=float,
        default=5.0,
        help='Discovery timeout in seconds (default: 5.0)'
    )
    mesh_discover_parser.set_defaults(func=cmd_mesh_discover)

    # Brain evolution commands
    brain_parser = subparsers.add_parser(
        'brain',
        help='Brain evolution operations'
    )
    brain_subparsers = brain_parser.add_subparsers(dest='brain_command', help='Brain commands')

    # brain status
    brain_status_parser = brain_subparsers.add_parser(
        'status',
        help='Show brain evolution status and mutation history'
    )
    brain_status_parser.add_argument(
        '--brain',
        default='tinystories_brain.rts.png',
        help='Brain atlas path'
    )
    brain_status_parser.add_argument(
        '--json',
        action='store_true',
        help='Output as JSON'
    )
    brain_status_parser.set_defaults(func=cmd_brain_status)

    # brain evolve
    brain_evolve_parser = brain_subparsers.add_parser(
        'evolve',
        help='Trigger a brain evolution cycle'
    )
    brain_evolve_parser.add_argument(
        '--brain',
        default='tinystories_brain.rts.png',
        help='Brain atlas path'
    )
    brain_evolve_parser.add_argument(
        '--sector',
        help='Specific sector to mutate (embeddings, attention_layer_0, etc.)'
    )
    brain_evolve_parser.add_argument(
        '--rate',
        type=float,
        default=0.0,
        help='Mutation rate (0.0-1.0)'
    )
    brain_evolve_parser.set_defaults(func=cmd_brain_evolve)

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
        'serve': cmd_serve,
        'catalog': cmd_catalog,
        'ps': cmd_ps,
        'snapshots': cmd_snapshots,
        'snapshot': lambda args: _dispatch_snapshot(args),
        'commit': cmd_commit,
        'diff': cmd_diff,
        'delta': cmd_delta,
        'patch': cmd_patch,
        'update': cmd_update,
        'benchmark': cmd_benchmark,
        'dashboard': cmd_dashboard,
        'info': cmd_info,
        'analyze': cmd_analyze,
        'execute': cmd_execute,
        'vision': cmd_vision,
        'blueprint': lambda args: _dispatch_blueprint(args),
        'verify': cmd_verify,
        'mesh': lambda args: _dispatch_mesh(args),
        'brain': lambda args: _dispatch_brain(args),
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


def _dispatch_snapshot(args):
    """Dispatch snapshot subcommands to their handlers."""
    if not args.snapshot_command:
        # Show snapshot help if no subcommand provided
        import argparse
        parser = argparse.ArgumentParser(prog='pixelrts snapshot')
        subparsers = parser.add_subparsers(dest='snapshot_command', help='Snapshot command to run')
        subparsers.add_parser('create', help='Create a VM snapshot')
        subparsers.add_parser('list', help='List VM snapshots for a container')
        subparsers.add_parser('restore', help='Restore a container from a snapshot')
        subparsers.add_parser('delete', help='Delete a VM snapshot')
        parser.print_help()
        return 1

    snapshot_handlers = {
        'create': cmd_snapshot_create,
        'list': cmd_snapshot_list,
        'restore': cmd_snapshot_restore,
        'delete': cmd_snapshot_delete
    }

    handler = snapshot_handlers.get(args.snapshot_command)
    if handler:
        return handler(args)

    return 1


def _dispatch_brain(args):
    """Dispatch brain subcommands to their handlers."""
    if not args.brain_command:
        # Show brain help if no subcommand provided
        import argparse
        parser = argparse.ArgumentParser(prog='pixelrts brain')
        subparsers = parser.add_subparsers(dest='brain_command', help='Brain command to run')
        subparsers.add_parser('status', help='Show brain evolution status and mutation history')
        subparsers.add_parser('evolve', help='Trigger a brain evolution cycle')
        parser.print_help()
        return 1

    brain_handlers = {
        'status': cmd_brain_status,
        'evolve': cmd_brain_evolve
    }

    handler = brain_handlers.get(args.brain_command)
    if handler:
        return handler(args)

    return 1


if __name__ == '__main__':
    sys.exit(main())
