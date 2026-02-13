#!/usr/bin/env python3
"""
Infinite Map Snapshot and Restore System.

Captures complete Infinite Map state for backup and restore.
"""

import json
import time
import uuid
import hashlib
from pathlib import Path
from typing import Dict, List, Optional, Any
from dataclasses import dataclass, field, asdict


class SnapshotError(Exception):
    """Exception raised for snapshot-related errors."""
    pass


@dataclass
class SnapshotMetadata:
    """Metadata for a snapshot."""
    snapshot_id: str
    timestamp: float
    grid_size: int
    total_files: int
    total_clusters: int
    vat_checksum: str
    description: str = ""
    compressed: bool = False
    snapshot_size_bytes: int = 0

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for serialization."""
        return asdict(self)

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> 'SnapshotMetadata':
        """Create from dictionary."""
        return cls(**data)


class SnapshotManager:
    """
    Manages Infinite Map snapshots.

    Provides snapshot creation, restoration, listing, and deletion.
    Snapshots capture the complete VAT state for backup/restore.
    """

    def __init__(self, storage_dir: str = ".snapshots"):
        """
        Initialize snapshot manager.

        Args:
            storage_dir: Directory to store snapshots
        """
        self.storage_dir = Path(storage_dir)
        self.storage_dir.mkdir(parents=True, exist_ok=True)

    def create_snapshot(
        self,
        vat,
        description: str = "",
        include_data: bool = False
    ) -> SnapshotMetadata:
        """
        Create a snapshot from current VAT state.

        Args:
            vat: VisualAllocationTable to snapshot
            description: Optional description
            include_data: Whether to include actual file data

        Returns:
            SnapshotMetadata for created snapshot
        """
        # Generate unique snapshot ID
        snapshot_id = f"snap-{int(time.time())}-{uuid.uuid4().hex[:8]}"

        # Compute VAT checksum
        vat_checksum = self._compute_vat_checksum(vat)

        # Count clusters
        total_clusters = sum(len(locs) for locs in vat.entries.values())

        # Create metadata
        metadata = SnapshotMetadata(
            snapshot_id=snapshot_id,
            timestamp=time.time(),
            grid_size=vat.grid_size,
            total_files=len(vat.entries),
            total_clusters=total_clusters,
            vat_checksum=vat_checksum,
            description=description or f"Snapshot {snapshot_id}"
        )

        # Serialize VAT to JSON
        vat_data = {
            'grid_size': vat.grid_size,
            'center': [vat.center.x, vat.center.y],
            'entries': {
                name: [[loc.x, loc.y] for loc in locs]
                for name, locs in vat.entries.items()
            },
            'max_entries': vat.max_entries
        }

        # Create snapshot directory
        snapshot_dir = self.storage_dir / snapshot_id
        snapshot_dir.mkdir(exist_ok=True)

        # Save metadata
        meta_path = snapshot_dir / "metadata.json"
        with open(meta_path, 'w') as f:
            json.dump(metadata.to_dict(), f, indent=2)

        # Save VAT data
        vat_path = snapshot_dir / "vat.json"
        with open(vat_path, 'w') as f:
            json.dump(vat_data, f, indent=2)

        # Update size in metadata
        metadata.snapshot_size_bytes = sum(
            f.stat().st_size for f in snapshot_dir.rglob('*')
        )

        # Save updated metadata
        with open(meta_path, 'w') as f:
            json.dump(metadata.to_dict(), f, indent=2)

        return metadata

    def restore_snapshot(self, snapshot_id: str):
        """
        Restore VAT from snapshot.

        Args:
            snapshot_id: ID of snapshot to restore

        Returns:
            VisualAllocationTable restored from snapshot

        Raises:
            SnapshotError: If snapshot not found
        """
        snapshot_dir = self.storage_dir / snapshot_id

        if not snapshot_dir.exists():
            raise SnapshotError(f"Snapshot not found: {snapshot_id}")

        # Load VAT data
        vat_path = snapshot_dir / "vat.json"
        if not vat_path.exists():
            raise SnapshotError(f"VAT data missing for snapshot: {snapshot_id}")

        with open(vat_path, 'r') as f:
            vat_data = json.load(f)

        # Import VisualAllocationTable
        from systems.pixel_compiler.infinite_map_v2 import (
            VisualAllocationTable, ClusterLocation
        )

        # Reconstruct entries
        entries = {}
        for name, locs_data in vat_data.get('entries', {}).items():
            entries[name] = [
                ClusterLocation(x=loc[0], y=loc[1])
                for loc in locs_data
            ]

        # Reconstruct center
        center_data = vat_data.get('center', [vat_data['grid_size'] // 2] * 2)
        center = ClusterLocation(x=center_data[0], y=center_data[1])

        # Create VAT
        vat = VisualAllocationTable(
            grid_size=vat_data['grid_size'],
            max_entries=vat_data.get('max_entries', 65536),
            center=center,
            entries=entries
        )

        return vat

    def list_snapshots(self) -> List[Dict[str, Any]]:
        """
        List all snapshots.

        Returns:
            List of snapshot metadata dictionaries
        """
        snapshots = []

        for snapshot_dir in sorted(self.storage_dir.iterdir()):
            if not snapshot_dir.is_dir():
                continue

            meta_path = snapshot_dir / "metadata.json"
            if not meta_path.exists():
                continue

            try:
                with open(meta_path, 'r') as f:
                    metadata = json.load(f)
                snapshots.append(metadata)
            except (json.JSONDecodeError, KeyError):
                # Skip invalid snapshots
                continue

        # Sort by timestamp (newest first)
        snapshots.sort(key=lambda x: x.get('timestamp', 0), reverse=True)

        return snapshots

    def delete_snapshot(self, snapshot_id: str) -> bool:
        """
        Delete a snapshot.

        Args:
            snapshot_id: ID of snapshot to delete

        Returns:
            True if deleted, False if not found
        """
        snapshot_dir = self.storage_dir / snapshot_id

        if not snapshot_dir.exists():
            return False

        # Remove all files in directory
        for item in snapshot_dir.iterdir():
            if item.is_file():
                item.unlink()
            elif item.is_dir():
                # Recursively remove subdirectories
                for sub_item in item.rglob('*'):
                    if sub_item.is_file():
                        sub_item.unlink()
                for sub_dir in sorted(item.rglob('*'), reverse=True):
                    if sub_dir.is_dir():
                        sub_dir.rmdir()
                item.rmdir()

        # Remove directory
        snapshot_dir.rmdir()

        return True

    def get_snapshot_metadata(self, snapshot_id: str) -> Optional[SnapshotMetadata]:
        """
        Get metadata for specific snapshot.

        Args:
            snapshot_id: ID of snapshot

        Returns:
            SnapshotMetadata or None if not found
        """
        snapshot_dir = self.storage_dir / snapshot_id

        if not snapshot_dir.exists():
            return None

        meta_path = snapshot_dir / "metadata.json"
        if not meta_path.exists():
            return None

        try:
            with open(meta_path, 'r') as f:
                data = json.load(f)
            return SnapshotMetadata.from_dict(data)
        except (json.JSONDecodeError, KeyError):
            return None

    def export_snapshot(self, snapshot_id: str, output_path: str) -> bool:
        """
        Export snapshot to portable JSON file.

        Args:
            snapshot_id: ID of snapshot to export
            output_path: Path to output file

        Returns:
            True if successful, False otherwise
        """
        snapshot_dir = self.storage_dir / snapshot_id

        if not snapshot_dir.exists():
            return False

        # Combine metadata and VAT into single export
        export_data = {
            'metadata': {},
            'vat': {}
        }

        # Load metadata
        meta_path = snapshot_dir / "metadata.json"
        if meta_path.exists():
            with open(meta_path, 'r') as f:
                export_data['metadata'] = json.load(f)

        # Load VAT
        vat_path = snapshot_dir / "vat.json"
        if vat_path.exists():
            with open(vat_path, 'r') as f:
                export_data['vat'] = json.load(f)

        # Write export
        output_file = Path(output_path)
        output_file.parent.mkdir(parents=True, exist_ok=True)

        with open(output_file, 'w') as f:
            json.dump(export_data, f, indent=2)

        return True

    def import_snapshot(self, import_path: str) -> Optional[SnapshotMetadata]:
        """
        Import snapshot from portable JSON file.

        Args:
            import_path: Path to exported snapshot file

        Returns:
            SnapshotMetadata if successful, None otherwise
        """
        import_file = Path(import_path)

        if not import_file.exists():
            return None

        try:
            with open(import_file, 'r') as f:
                import_data = json.load(f)
        except (json.JSONDecodeError, KeyError):
            return None

            # Extract metadata and VAT
        metadata = import_data.get('metadata', {})
        vat_data = import_data.get('vat', {})

        if not metadata or not vat_data:
            return None

        # Generate new snapshot ID for import
        snapshot_id = metadata.get(
            'snapshot_id',
            f"import-{int(time.time())}"
        )

        # Create snapshot directory
        snapshot_dir = self.storage_dir / snapshot_id
        snapshot_dir.mkdir(exist_ok=True)

        # Save metadata
        meta_path = snapshot_dir / "metadata.json"
        with open(meta_path, 'w') as f:
            json.dump(metadata, f, indent=2)

        # Save VAT
        vat_path = snapshot_dir / "vat.json"
        with open(vat_path, 'w') as f:
            json.dump(vat_data, f, indent=2)

        return SnapshotMetadata.from_dict(metadata)

    def _compute_vat_checksum(self, vat) -> str:
        """
        Compute checksum for VAT.

        Args:
            vat: VisualAllocationTable

        Returns:
            SHA256 checksum as hex string
        """
        # Create deterministic representation
        vat_dict = {
            'grid_size': vat.grid_size,
            'center': [vat.center.x, vat.center.y],
            'entries': {
                name: [[loc.x, loc.y] for loc in locs]
                for name, locs in sorted(vat.entries.items())
            }
        }

        json_str = json.dumps(vat_dict, separators=(',', ':'), sort_keys=True)
        return hashlib.sha256(json_str.encode('utf-8')).hexdigest()


def main():
    """CLI for snapshot management."""
    import argparse
    import sys

    parser = argparse.ArgumentParser(
        description='Manage Infinite Map snapshots',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""Examples:
  # Create snapshot
  python3 -m systems.pixel_compiler.infinite_map_snapshot create \\
      --vat-path /path/to/vat.json --description "Before upgrade"

  # List snapshots
  python3 -m systems.pixel_compiler.infinite_map_snapshot list

  # Restore snapshot
  python3 -m systems.pixel_compiler.infinite_map_snapshot restore snap-123

  # Export snapshot
  python3 -m systems.pixel_compiler.infinite_map_snapshot export snap-123 \\
      --output backup.json

  # Import snapshot
  python3 -m systems.pixel_compiler.infinite_map_snapshot import \\
      --input backup.json

  # Delete snapshot
  python3 -m systems.pixel_compiler.infinite_map_snapshot delete snap-123
        """
    )

    parser.add_argument(
        'action',
        choices=['create', 'restore', 'list', 'delete', 'export', 'import'],
        help='Action to perform'
    )
    parser.add_argument(
        '--storage-dir',
        default='.snapshots',
        help='Snapshot storage directory'
    )

    # Create-specific args
    parser.add_argument('--vat-path', help='Path to VAT file')
    parser.add_argument('--description', help='Snapshot description')

    # Restore-specific args
    parser.add_argument('--snapshot-id', help='Snapshot ID')

    # Export/import args
    parser.add_argument('--output', help='Output file for export')
    parser.add_argument('--input', help='Input file for import')

    args = parser.parse_args()

    manager = SnapshotManager(storage_dir=args.storage_dir)

    try:
        if args.action == 'create':
            if not args.vat_path:
                print("[!] --vat-path required for create")
                sys.exit(1)

            # Load VAT from file
            with open(args.vat_path, 'r') as f:
                vat_data = json.load(f)

            from systems.pixel_compiler.infinite_map_v2 import (
                VisualAllocationTable, ClusterLocation
            )

            # Reconstruct VAT
            entries = {}
            for name, locs_data in vat_data.get('entries', {}).items():
                entries[name] = [
                    ClusterLocation(x=loc[0], y=loc[1])
                    for loc in locs_data
                ]

            center_data = vat_data.get('center', [vat_data['grid_size'] // 2] * 2)
            center = ClusterLocation(x=center_data[0], y=center_data[1])

            vat = VisualAllocationTable(
                grid_size=vat_data['grid_size'],
                center=center,
                entries=entries
            )

            meta = manager.create_snapshot(
                vat=vat,
                description=args.description or ""
            )

            print(f"[*] Created snapshot: {meta.snapshot_id}")
            print(f"    Files: {meta.total_files}")
            print(f"    Size: {meta.snapshot_size_bytes} bytes")

        elif args.action == 'restore':
            if not args.snapshot_id:
                print("[!] --snapshot-id required for restore")
                sys.exit(1)

            vat = manager.restore_snapshot(args.snapshot_id)

            print(f"[*] Restored snapshot: {args.snapshot_id}")
            print(f"    Grid: {vat.grid_size}x{vat.grid_size}")
            print(f"    Files: {len(vat.entries)}")

        elif args.action == 'list':
            snapshots = manager.list_snapshots()

            print(f"[*] Snapshots in {args.storage_dir}:")
            if not snapshots:
                print("    (none)")
            else:
                for snap in snapshots:
                    ts = snap.get('timestamp', 0)
                    desc = snap.get('description', 'No description')
                    print(f"    {snap['snapshot_id']}: {desc} ({ts})")

        elif args.action == 'delete':
            if not args.snapshot_id:
                print("[!] --snapshot-id required for delete")
                sys.exit(1)

            result = manager.delete_snapshot(args.snapshot_id)
            if result:
                print(f"[*] Deleted snapshot: {args.snapshot_id}")
            else:
                print(f"[!] Snapshot not found: {args.snapshot_id}")
                sys.exit(1)

        elif args.action == 'export':
            if not args.snapshot_id or not args.output:
                print("[!] --snapshot-id and --output required for export")
                sys.exit(1)

            result = manager.export_snapshot(args.snapshot_id, args.output)
            if result:
                print(f"[*] Exported snapshot to: {args.output}")
            else:
                print(f"[!] Export failed for snapshot: {args.snapshot_id}")
                sys.exit(1)

        elif args.action == 'import':
            if not args.input:
                print("[!] --input required for import")
                sys.exit(1)

            meta = manager.import_snapshot(args.input)
            if meta:
                print(f"[*] Imported snapshot: {meta.snapshot_id}")
            else:
                print(f"[!] Import failed from: {args.input}")
                sys.exit(1)

    except SnapshotError as e:
        print(f"[!] Snapshot error: {e}", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"[!] Error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main()
