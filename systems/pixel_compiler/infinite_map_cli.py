#!/usr/bin/env python3
"""
Infinite Map Advanced CLI.

Provides advanced commands for Infinite Map management.
"""

import argparse
import json
import sys
import time
from pathlib import Path
from typing import Dict, List, Any, Optional

# Import Infinite Map components
try:
    from systems.pixel_compiler.infinite_map_v2 import (
        InfiniteMapBuilderV2,
        VisualAllocationTable,
        ClusterLocation
    )
    from systems.pixel_compiler.infinite_map_snapshot import SnapshotManager
    from systems.pixel_compiler.infinite_map_predictor import AccessPredictor
    from systems.pixel_compiler.infinite_map_prefetch import Prefetcher
    from systems.pixel_compiler.infinite_map_compression import CompressionEngine
    from systems.pixel_compiler.vat_parser import VATParser, VATInspector
except ImportError as e:
    print(f"[!] Import error: {e}", file=sys.stderr)
    sys.exit(1)


class InfiniteMapCLI:
    """
    Advanced CLI for Infinite Map management.

    Provides commands for inspection, analysis, and management.
    """

    def __init__(self):
        """Initialize CLI with all managers."""
        self.vat_parser = VATParser()
        self.vat_inspector = VATInspector(parser=self.vat_parser)

    def cmd_info(self, args):
        """Show information about an Infinite Map image."""
        try:
            vat = self.vat_inspector.load_from_image(args.image)
            summary = self.vat_inspector.get_summary(vat)

            print(f"[*] Infinite Map Information: {args.image}")
            print(f"\nGrid:")
            print(f"  Size: {summary['grid_size']}x{summary['grid_size']}")
            print(f"  Capacity: {summary['capacity']:,} pixels")
            print(f"  Center: ({vat.center.x}, {vat.center.y})")

            print(f"\nFiles:")
            print(f"  Total: {summary['total_files']}")
            print(f"  Utilization: {summary['utilization_percent']:.2f}%")

            print(f"\nZone Distribution:")
            for zone, count in summary['files_per_zone'].items():
                pct = (count / summary['total_files'] * 100) if summary['total_files'] > 0 else 0
                bar = '█' * int(pct / 2)
                print(f"  {zone.upper()}: {bar} {count} ({pct:.1f}%)")

        except Exception as e:
            print(f"[!] Error loading image: {e}")
            return 1

        return 0

    def cmd_find(self, args):
        """Find a file's location in the Infinite Map."""
        try:
            vat = self.vat_inspector.load_from_image(args.image)
            loc = self.vat_parser.find_file_location(vat, args.filename)

            if loc:
                distance = ((loc.x - vat.center.x)**2 + (loc.y - vat.center.y)**2)**0.5
                print(f"[*] File: {args.filename}")
                print(f"  Location: ({loc.x}, {loc.y})")
                print(f"  Distance from center: {distance:.1f} pixels")

                # Determine zone
                if distance < 128:
                    zone = "HOT"
                elif distance < 384:
                    zone = "WARM"
                elif distance < 768:
                    zone = "TEMPERATE"
                elif distance < 1536:
                    zone = "COOL"
                else:
                    zone = "COLD"
                print(f"  Zone: {zone}")
            else:
                print(f"[!] File not found: {args.filename}")
                return 1

        except Exception as e:
            print(f"[!] Error: {e}")
            return 1

        return 0

    def cmd_analyze(self, args):
        """Analyze access patterns for files."""
        predictor = AccessPredictor()

        # Load access history if available
        if args.history:
            try:
                with open(args.history, 'r') as f:
                    data = json.load(f)
                predictor.import_history(data)
                print(f"[*] Loaded history from: {args.history}")
            except Exception as e:
                print(f"[!] Error loading history: {e}")
                return 1

        # Show access statistics
        stats = predictor.get_statistics()
        print(f"\n[*] Access Statistics:")
        print(f"  Total records: {stats['total_accesses']}")
        print(f"  Unique files: {stats['unique_files']}")
        print(f"  Average interval: {stats['avg_interval']:.1f}s")

        # Show hot files
        if args.hot:
            # Get files predicted to be accessed within hot threshold
            hot = predictor.get_hot_files(threshold_seconds=args.hot)
            print(f"\n[*] Hot Files (access within {args.hot}s):")
            for path, next_access in hot:
                wait = max(0, next_access - time.time())
                print(f"  {path}: access in {wait:.0f}s")

        return 0

    def cmd_predict(self, args):
        """Predict next access for files."""
        predictor = AccessPredictor()

        # Load history
        if args.history:
            try:
                with open(args.history, 'r') as f:
                    data = json.load(f)
                predictor.import_history(data)
            except Exception as e:
                print(f"[!] Error loading history: {e}")
                return 1

        # Record sample accesses for demo
        if args.demo:
            now = time.time()
            print("[*] Recording sample access patterns...")
            predictor.record_access("boot/vmlinuz", timestamp=now - 100)
            predictor.record_access("boot/vmlinuz", timestamp=now - 50)
            predictor.record_access("boot/vmlinuz", timestamp=now)

            predictor.record_access("etc/config.json", timestamp=now - 500)
            predictor.record_access("etc/config.json", timestamp=now)

            predictor.record_access("usr/bin/bash", timestamp=now - 1000)
            predictor.record_access("usr/bin/bash", timestamp=now)

        # Show predictions
        print(f"\n[*] Access Predictions:")
        for filename in args.files:
            prediction = predictor.predict_next_access(filename)
            if prediction is not None:
                wait = max(0, prediction - time.time())
                print(f"  {filename}: {wait:.0f}s until next access")
            else:
                print(f"  {filename}: no data")

        return 0

    def cmd_zone(self, args):
        """List files in a specific zone."""
        try:
            vat = self.vat_inspector.load_from_image(args.image)
            files = self.vat_parser.list_files_in_zone(vat, args.zone)

            print(f"[*] Files in {args.zone.upper()} zone: {len(files)}")
            if args.sort == 'distance':
                # Sort by distance from center
                center = vat.center
                files_with_dist = []
                for f in files:
                    locs = vat.entries.get(f, [])
                    if locs:
                        loc = locs[0]
                        dist = ((loc.x - center.x)**2 + (loc.y - center.y)**2)**0.5
                        files_with_dist.append((f, dist))
                files_with_dist.sort(key=lambda x: x[1])
                for f, dist in files_with_dist:
                    print(f"  {f} ({dist:.1f}px)")
            else:
                for f in files:
                    print(f"  {f}")

        except Exception as e:
            print(f"[!] Error: {e}")
            return 1

        return 0

    def cmd_compress(self, args):
        """Compress files in cold zone."""
        try:
            vat = self.vat_inspector.load_from_image(args.image)
            engine = CompressionEngine(
                compress_age=args.age,
                compression_level=args.level
            )

            # Get cold zone files
            cold_files = self.vat_parser.list_files_in_zone(vat, 'cold')

            print(f"[*] Compressing {len(cold_files)} cold zone files...")
            print(f"  Threshold: {args.age}s")
            print(f"  Level: {args.level}")

            # Simulate compression (would need actual file data)
            compressed_count = 0
            for f in cold_files:
                # Mock compression decision
                if engine.should_compress(f):
                    compressed_count += 1
                    if args.verbose:
                        print(f"  {f}: compressed")

            stats = engine.get_statistics()
            print(f"\n[*] Compression Statistics:")
            print(f"  Eligible: {stats['total_compressed']}")
            print(f"  Compressed: {compressed_count}")
            print(f"  Ratio: {stats['compression_ratio']:.1f}%")

        except Exception as e:
            print(f"[!] Error: {e}")
            return 1

        return 0

    def cmd_prefetch(self, args):
        """Prefetch hot files into cache."""
        try:
            vat = self.vat_inspector.load_from_image(args.image)
            predictor = AccessPredictor()
            prefetcher = Prefetcher(cache_size=args.cache_size)

            # Load access history
            if args.history:
                try:
                    with open(args.history, 'r') as f:
                        data = json.load(f)
                    predictor.import_history(data)
                except Exception as e:
                    print(f"[!] Error loading history: {e}")

            # Get hot files
            hot = predictor.get_hot_files(limit=args.limit)
            print(f"[*] Prefetching {len(hot)} hot files...")

            for path, next_access in hot:
                if prefetcher.should_prefetch(next_access, args.window):
                    prefetcher.prefetch_file(path, priority=1)
                    wait = max(0, next_access - time.time())
                    print(f"  {path}: prefetch (access in {wait:.0f}s)")

            # Process queue
            print(f"\n[*] Processing prefetch queue...")
            while True:
                item = prefetcher.process_next()
                if item is None:
                    break
                print(f"  Processed: {item.path}")

            stats = prefetcher.get_statistics()
            print(f"\n[*] Prefetch Statistics:")
            print(f"  Total prefetched: {stats['total_prefetched']}")
            print(f"  Cache hits: {stats['cache_hits']}")
            print(f"  Cache misses: {stats['cache_misses']}")

        except Exception as e:
            print(f"[!] Error: {e}")
            return 1

        return 0

    def cmd_snapshot(self, args):
        """Manage snapshots."""
        manager = SnapshotManager(storage_dir=args.storage_dir)

        if args.action == 'create':
            # Load VAT from image
            try:
                vat = self.vat_inspector.load_from_image(args.image)
                meta = manager.create_snapshot(
                    vat=vat,
                    description=args.description or ""
                )
                print(f"[*] Created snapshot: {meta.snapshot_id}")
                print(f"  Files: {meta.total_files}")
                print(f"  Size: {meta.snapshot_size_bytes} bytes")
            except Exception as e:
                print(f"[!] Error creating snapshot: {e}")
                return 1

        elif args.action == 'list':
            snapshots = manager.list_snapshots()
            print(f"[*] Snapshots in {args.storage_dir}:")
            if not snapshots:
                print("  (none)")
            else:
                for snap in snapshots:
                    ts = snap.get('timestamp', 0)
                    desc = snap.get('description', 'No description')
                    print(f"  {snap['snapshot_id']}: {desc}")

        elif args.action == 'restore':
            if not args.snapshot_id:
                print("[!] --snapshot-id required for restore")
                return 1

            try:
                vat = manager.restore_snapshot(args.snapshot_id)
                print(f"[*] Restored snapshot: {args.snapshot_id}")
                print(f"  Grid: {vat.grid_size}x{vat.grid_size}")
                print(f"  Files: {len(vat.entries)}")
            except Exception as e:
                print(f"[!] Error restoring snapshot: {e}")
                return 1

        elif args.action == 'delete':
            if not args.snapshot_id:
                print("[!] --snapshot-id required for delete")
                return 1

            result = manager.delete_snapshot(args.snapshot_id)
            if result:
                print(f"[*] Deleted snapshot: {args.snapshot_id}")
            else:
                print(f"[!] Snapshot not found: {args.snapshot_id}")
                return 1

        return 0


def main():
    """Main CLI entry point."""
    parser = argparse.ArgumentParser(
        description='Infinite Map Advanced CLI',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""Examples:
  # Show map information
  infinite-map-cli info image.rts.png

  # Find a file
  infinite-map-cli find image.rts.png --filename boot/vmlinuz

  # Analyze access patterns
  infinite-map-cli analyze --history access.json --hot 10

  # Predict next access
  infinite-map-cli predict --history access.json boot/vmlinuz etc/config.json

  # List files in zone
  infinite-map-cli zone image.rts.png --zone hot

  # Manage snapshots
  infinite-map-cli snapshot create image.rts.png --description "Before upgrade"
  infinite-map-cli snapshot list
        """
    )

    subparsers = parser.add_subparsers(dest='command', help='Command to run')

    # Info command
    info_parser = subparsers.add_parser('info', help='Show map information')
    info_parser.add_argument('image', help='Path to .rts.png image')

    # Find command
    find_parser = subparsers.add_parser('find', help='Find file location')
    find_parser.add_argument('image', help='Path to .rts.png image')
    find_parser.add_argument('--filename', required=True, help='File to find')

    # Analyze command
    analyze_parser = subparsers.add_parser('analyze', help='Analyze access patterns')
    analyze_parser.add_argument('--history', help='Access history file')
    analyze_parser.add_argument('--hot', type=int, default=10, help='Show N hot files')

    # Predict command
    predict_parser = subparsers.add_parser('predict', help='Predict next access')
    predict_parser.add_argument('--history', help='Access history file')
    predict_parser.add_argument('--demo', action='store_true', help='Use sample data')
    predict_parser.add_argument('files', nargs='*', default=[], help='Files to predict')

    # Zone command
    zone_parser = subparsers.add_parser('zone', help='List files in zone')
    zone_parser.add_argument('image', help='Path to .rts.png image')
    zone_parser.add_argument('--zone', required=True,
                          choices=['hot', 'warm', 'temperate', 'cool', 'cold'],
                          help='Zone to list')
    zone_parser.add_argument('--sort', default='distance',
                          choices=['distance', 'name'],
                          help='Sort order')

    # Compress command
    compress_parser = subparsers.add_parser('compress', help='Compress cold zone')
    compress_parser.add_argument('image', help='Path to .rts.png image')
    compress_parser.add_argument('--age', type=int, default=3600,
                             help='Access age threshold (seconds)')
    compress_parser.add_argument('--level', type=int, default=3,
                             help='Compression level (1-22)')
    compress_parser.add_argument('-v', '--verbose', action='store_true',
                             help='Show verbose output')

    # Prefetch command
    prefetch_parser = subparsers.add_parser('prefetch', help='Prefetch hot files')
    prefetch_parser.add_argument('image', help='Path to .rts.png image')
    prefetch_parser.add_argument('--history', help='Access history file')
    prefetch_parser.add_argument('--cache-size', type=int, default=10485760,
                              help='Cache size in bytes')
    prefetch_parser.add_argument('--limit', type=int, default=10,
                              help='Max files to prefetch')
    prefetch_parser.add_argument('--window', type=int, default=60,
                              help='Prefetch window (seconds)')

    # Snapshot command
    snapshot_parser = subparsers.add_parser('snapshot', help='Manage snapshots')
    snapshot_parser.add_argument('action',
                              choices=['create', 'list', 'restore', 'delete'],
                              help='Snapshot action')
    snapshot_parser.add_argument('--image', help='Path to .rts.png image')
    snapshot_parser.add_argument('--snapshot-id', help='Snapshot ID')
    snapshot_parser.add_argument('--description', help='Snapshot description')
    snapshot_parser.add_argument('--storage-dir', default='.snapshots',
                              help='Snapshot storage directory')

    args = parser.parse_args()

    if not args.command:
        parser.print_help()
        return 1

    # Run command
    cli = InfiniteMapCLI()
    command_func = getattr(cli, f'cmd_{args.command}', None)
    if command_func:
        return command_func(args)
    else:
        print(f"[!] Unknown command: {args.command}")
        return 1


if __name__ == '__main__':
    sys.exit(main())
