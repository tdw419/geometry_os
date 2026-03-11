"""
Container Checkpoint - Phase 26

Checkpoint and restore containers for migration across the mesh.
"""

import asyncio
import logging
import time
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any

logger = logging.getLogger("ContainerCheckpoint")


@dataclass
class CheckpointMetadata:
    """Metadata for a container checkpoint."""
    checkpoint_id: str
    container_id: str
    container_name: str
    timestamp: float = field(default_factory=time.time)
    snapshot_path: str | None = None
    memory_state_path: str | None = None
    size_bytes: int = 0
    checksum: str | None = None
    compressed: bool = False


    # Migration tracking
    source_peer: str | None = None
    target_peer: str | None = None
    migration_status: str = "pending"  # pending, transferring, restoring, completed, failed


class CheckpointState:
    """State machine for checkpoint lifecycle."""
    PENDING = "pending"
    CREATING = "creating"
    CREATED = "created"
    TRANSFERRING = "transferring"
    RESTORING = "restoring"
    COMPLETED = "completed"
    FAILED = "failed"
    CANCELLED = "cancelled"


class ContainerCheckpoint:
    """
    Manages checkpoint creation and state for container migration.
    """

    def __init__(
        self,
        container_id: str,
        container_name: str,
        checkpoint_dir: str = "/tmp/geometry-os-migration",
    ):
        self.container_id = container_id
        self.container_name = container_name
        self.checkpoint_dir = Path(checkpoint_dir)
        self.checkpoint_dir.mkdir(parents=True, exist_ok=True)

        self._current_checkpoint: CheckpointMetadata | None = None
        self._checkpoints: dict[str, CheckpointMetadata] = {}

    async def create_checkpoint(self, snapshot_path: str | None = None) -> CheckpointMetadata:
        """
        Create a checkpoint of a running container.

        Args:
            snapshot_path: Optional path to existing QEMU snapshot file
                           If None, creates a new checkpoint

        Returns:
            CheckpointMetadata with checkpoint details
        """
        start_time = time.time()
        checkpoint_id = f"cp-{int(start_time * 1000)}"

        # Get container info (would come from boot manager in real implementation)
        # For now, we'll simulate this
        container_info = await self._get_container_info(self.container_id)

        checkpoint_path = checkpoint_path or self._generate_checkpoint_path(checkpoint_id)

        # Create checkpoint metadata
        metadata = CheckpointMetadata(
            checkpoint_id=checkpoint_id,
            container_id=self.container_id,
            container_name=self.container_name,
            timestamp=start_time,
            snapshot_path=checkpoint_path,
            size_bytes=0,  # Would be calculated from actual snapshot
            migration_status="pending",
        )

        self._checkpoints[checkpoint_id] = metadata
        self._current_checkpoint = metadata

        logger.info(f"Created checkpoint {checkpoint_id} for container {self.container_name}")
        return metadata

    def _generate_checkpoint_path(self, checkpoint_id: str) -> Path:
        """Generate path for checkpoint file."""
        return self.checkpoint_dir / f"{checkpoint_id}.checkpoint"

    async def _get_container_info(self, container_id: str) -> dict[str, Any]:
        """Get container information (simulated for now)."""
        # In real implementation, this would query the boot manager
        await asyncio.sleep(0.1)  # Simulate async operation
        return {
            "id": container_id,
            "name": self.container_name,
            "vnc_port": 5901,
            "status": "running",
        }

    def get_checkpoint(self, checkpoint_id: str) -> CheckpointMetadata | None:
        """Get checkpoint metadata by ID."""
        return self._checkpoints.get(checkpoint_id)

    def list_checkpoints(self) -> list[CheckpointMetadata]:
        """List all checkpoints."""
        return list(self._checkpoints.values())

    async def delete_checkpoint(self, checkpoint_id: str) -> bool:
        """Delete a checkpoint."""
        if checkpoint_id not in self._checkpoints:
            return False

        metadata = self._checkpoints[checkpoint_id]
        if metadata.snapshot_path:
            Path(metadata.snapshot_path).unlink(missing_ok=True)

        del self._checkpoints[checkpoint_id]
        logger.info(f"Deleted checkpoint {checkpoint_id}")
        return True


class StateTransfer:
    """
    Transfers checkpoint state between peers.
    """

    def __init__(
        self,
        source_client,  # RemoteBootClient for source peer
        target_client,  # RemoteBootClient for target peer
    chunk_size: int = 1024 * 1024,  # 1MB chunks
    ):
        self.source_client = source_client
        self.target_client = target_client
        self.chunk_size = chunk_size
        self._transfer_progress: dict[str, float] = {}

    async def transfer_checkpoint(
        self,
        checkpoint: CheckpointMetadata,
        progress_callback: callable | None = None,
    ) -> bool:
        """
        Transfer checkpoint from source to target peer.

        Args:
            checkpoint: Checkpoint to transfer
            progress_callback: Optional callback for progress updates

        Returns:
            True if transfer successful
        """
        if not checkpoint.snapshot_path:
            raise ValueError("Checkpoint has no snapshot file")

        checkpoint_path = Path(checkpoint.snapshot_path)
        if not checkpoint_path.exists():
            raise FileNotFoundError(f"Checkpoint file not found: {checkpoint_path}")

        file_size = checkpoint_path.stat().st_size
        total_chunks = (file_size + self.chunk_size - 1) // self.chunk_size

        logger.info(f"Starting transfer of {checkpoint.checkpoint_id} ({file_size} bytes)")

        # Read and transfer in chunks
        with open(checkpoint_path, "rb") as f:
            for chunk_num in range(total_chunks):
                offset = chunk_num * self.chunk_size
                chunk_data = f.read(self.chunk_size)

                # Send chunk to target's /restore endpoint
                # (This is a simplified version - real implementation would
                # use proper protocol between peers)
                success = await self._send_chunk(
                    checkpoint.checkpoint_id,
                    chunk_num,
                    total_chunks,
                    chunk_data,
                )

                if not success:
                    logger.error(f"Failed to send chunk {chunk_num}")
                    return False

                progress = (chunk_num + 1) / total_chunks
                self._transfer_progress[checkpoint.checkpoint_id] = progress

                if progress_callback:
                    progress_callback(checkpoint.checkpoint_id, progress)

        logger.info(f"Completed transfer of {checkpoint.checkpoint_id}")
        return True

    async def _send_chunk(
        self,
        checkpoint_id: str,
        chunk_num: int,
        total_chunks: int,
        chunk_data: bytes,
    ) -> bool:
        """Send chunk to target (simplified)."""
        # In real implementation, this would use the remoteBootClient
        # to send chunks via HTTP/mesh protocol
        await asyncio.sleep(0.01)  # Simulate network delay
        return True


class ContainerRestore:
    """
    Restores a container from a checkpoint on target peer.
    """

    def __init__(
        self,
        boot_manager,  # MultiBootManager
        restore_dir: str = "/tmp/geometry-os-restore",
    ):
        self.boot_manager = boot_manager
        self.restore_dir = Path(restore_dir)
        self.restore_dir.mkdir(parents=True, exist_ok=True)

        self._received_chunks: dict[str, list[bytes]] = {}
        self._restored_containers: dict[str, any] = {}

    def receive_chunk(
        self,
        checkpoint_id: str,
        chunk_num: int,
        chunk_data: bytes,
    ) -> None:
        """Receive a chunk of checkpoint data."""
        if checkpoint_id not in self._received_chunks:
            self._received_chunks[checkpoint_id] = []

        # Ensure list is long enough
        while len(self._received_chunks[checkpoint_id]) <= chunk_num:
            self._received_chunks[checkpoint_id].append(None)

        self._received_chunks[checkpoint_id][chunk_num] = chunk_data

    def is_checkpoint_complete(self, checkpoint_id: str) -> bool:
        """Check if all chunks received for a checkpoint."""
        if checkpoint_id not in self._received_chunks:
            return False

        chunks = self._received_chunks[checkpoint_id]
        return all(chunk is not None for chunk in chunks)

    async def restore_checkpoint(
        self,
        checkpoint: CheckpointMetadata,
        progress_callback: callable | None = None,
    ) -> bool:
        """
        Restore container from checkpoint.

        Args:
            checkpoint: Checkpoint metadata
            progress_callback: Optional callback for progress updates

        Returns:
            True if restore successful
        """
        checkpoint_id = checkpoint.checkpoint_id

        if not self.is_checkpoint_complete(checkpoint_id):
            raise ValueError(f"Not all chunks received for {checkpoint_id}")

        # Reassemble checkpoint file
        restore_path = self.restore_dir / f"{checkpoint_id}.restore"
        chunks = self._received_chunks[checkpoint_id]

        with open(restore_path, "wb") as f:
            for chunk in chunks:
                f.write(chunk)

        logger.info(f"Reassembled checkpoint at {restore_path}")

        # In real implementation, this would:
        # 1. Extract VM memory state from checkpoint
        # 2. Boot container with restored state
        # 3. Reconnect network

        # For now, simulate restoration
        await asyncio.sleep(0.5)

        self._restored_containers[checkpoint_id] = {
            "container_name": checkpoint.container_name,
            "restore_path": str(restore_path),
            "status": "running",
        }

        # Cleanup received chunks
        del self._received_chunks[checkpoint_id]

        logger.info(f"Restored container {checkpoint.container_name} from {checkpoint_id}")

        if progress_callback:
            progress_callback(checkpoint_id, 1.0)

        return True

    def get_restored_container(self, checkpoint_id: str) -> dict[str, any] | None:
        """Get info about restored container."""
        return self._restored_containers.get(checkpoint_id)


class MigrationCoordinator:
    """
    Coordinates the full migration workflow between peers.
    """

    def __init__(
        self,
        checkpoint_manager: ContainerCheckpoint,
        state_transfer: StateTransfer,
        restore_manager: ContainerRestore,
    ):
        self.checkpoint_manager = checkpoint_manager
        self.state_transfer = state_transfer
        self.restore_manager = restore_manager

        self._migrations: dict[str, dict[str, any]] = {}

    async def migrate_container(
        self,
        container_id: str,
        target_peer: str,
        progress_callback: callable | None = None,
    ) -> bool:
        """
        Migrate a container to a target peer.

        Args:
            container_id: Container ID to migrate
            target_peer: Target peer hostname
            progress_callback: Optional callback for progress updates

        Returns:
            True if migration successful
        """
        migration_id = f"migration-{int(time.time() * 1000)}"

        logger.info(f"Starting migration of {container_id} to {target_peer}")

        # Track migration
        self._migrations[migration_id] = {
            "container_id": container_id,
            "target_peer": target_peer,
            "status": "checkpointing",
            "start_time": time.time(),
        }

        try:
            # Phase 1: Create checkpoint
            if progress_callback:
                progress_callback(migration_id, "checkpointing", 0.0)

            checkpoint = await self.checkpoint_manager.create_checkpoint()

            self._migrations[migration_id]["checkpoint"] = checkpoint
            self._migrations[migration_id]["status"] = "transferring"

            if progress_callback:
                progress_callback(migration_id, "transferring", 0.0)

            # Phase 2: Transfer state
            def transfer_progress(cp_id, progress):
                if progress_callback:
                    progress_callback(
                        migration_id,
                        "transferring",
                        progress,
                    )

            transfer_success = await self.state_transfer.transfer_checkpoint(
                checkpoint,
                transfer_progress,
            )

            if not transfer_success:
                raise RuntimeError("State transfer failed")

            self._migrations[migration_id]["status"] = "restoring"

            if progress_callback:
                progress_callback(migration_id, "restoring", 0.0)

            # Phase 3: Restore on target
            restore_success = await self.restore_manager.restore_checkpoint(
                checkpoint,
                transfer_progress,
            )

            if not restore_success:
                raise RuntimeError("Restore failed")

            # Mark completed
            self._migrations[migration_id]["status"] = "completed"
            self._migrations[migration_id]["end_time"] = time.time()
            self._migrations[migration_id]["elapsed"] = (
                time.time() -
                self._migrations[migration_id]["start_time"]
            )

            if progress_callback:
                progress_callback(migration_id, "completed", 1.0)

            logger.info(f"Migration {migration_id} completed successfully")
            return True

        except Exception as e:
            logger.error(f"Migration {migration_id} failed: {e}")
            self._migrations[migration_id]["status"] = "failed"
            self._migrations[migration_id]["error"] = str(e)
            return False

    def get_migration_status(self, migration_id: str) -> dict[str, any] | None:
        """Get status of a migration."""
        return self._migrations.get(migration_id)

    def list_migrations(self) -> list[dict[str, any]]:
        """List all migrations."""
        return list(self._migrations.values())


# Convenience functions
def get_migration_coordinator(
    boot_manager,
    source_client,
    target_client,
) -> MigrationCoordinator:
    """Create migration coordinator with all components."""
    checkpoint_manager = ContainerCheckpoint("container-1", "test-container")
    state_transfer = StateTransfer(source_client, target_client)
    restore_manager = ContainerRestore(boot_manager)
    return MigrationCoordinator(
        checkpoint_manager,
        state_transfer,
        restore_manager,
    )
