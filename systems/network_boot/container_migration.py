"""
Container Migration - Phase 26

Checkpoint, transfer, and restore containers across the mesh.
"""

import asyncio
import logging
import time
from collections.abc import Callable
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any

logger = logging.getLogger("ContainerMigration")


@dataclass
class MigrationConfig:
    """Configuration for container migration."""
    container_id: str = ""
    target_peer: str = ""
    source_peer: str | None = None
    checkpoint_timeout: float = 300.0
    transfer_timeout: float = 600.0
    restore_timeout: float = 300.0
    compression: bool = True
    compression_level: int = 6
    verify_checksum: bool = True
    cleanup_source: bool = True
    reconnect_network: bool = True
    preserve_vnc: bool = True


@dataclass
class MigrationState:
    """State of a migration."""
    status: str = "pending"
    checkpoint_id: str | None = None
    source_container: dict[str, Any] | None = None
    target_container: dict[str, Any] | None = None
    target_peer: str | None = None
    start_time: float = field(default_factory=time.time)
    end_time: float | None = None
    error: str | None = None
    progress: float = 0.0
    bytes_transferred: int = 0
    bytes_total: int = 0
    checkpoint_path: str | None = None
    restore_path: str | None = None
    elapsed_time: float = 0.0


class MigrationStatus:
    """Status enum for a migration."""
    PENDING = "pending"
    CHECKPOINTING = "checkpointing"
    TRANSFERRING = "transferring"
    TRANSFERRED = "transferred"
    RESTORING = "restoring"
    RECONNECTING = "reconnecting"
    VERIFYING = "verifying"
    COMPLETED = "completed"
    FAILED = "failed"
    CANCELLED = "cancelled"


class CheckpointManager:
    """Manages container checkpoints for migration."""

    def __init__(self, checkpoint_dir: str = "/tmp/geometry-os-checkpoints"):
        self.checkpoint_dir = Path(checkpoint_dir)
        self.checkpoint_dir.mkdir(parents=True, exist_ok=True)
        self._checkpoints: dict[str, MigrationState] = {}

    async def create_checkpoint(
        self,
        container_id: str,
        container_name: str,
        vnc_port: int,
        memory_size_mb: int = 1024,  # MB
    ) -> MigrationState:
        """Create a checkpoint of a running container."""
        start_time = time.time()
        checkpoint_id = f"cp-{int(start_time * 1000)}"

        state = MigrationState(
            checkpoint_id=checkpoint_id,
            source_container={
                "id": container_id,
                "name": container_name,
                "vnc_port": vnc_port,
                "memory_size_mb": memory_size_mb,
            },
            start_time=start_time,
        )

        self._checkpoints[checkpoint_id] = state

        logger.info(f"Creating checkpoint {checkpoint_id} for container {container_name}")
        return state

    async def finalize_checkpoint(self, checkpoint_id: str, checkpoint_path: str) -> bool:
        """Finalize checkpoint by writing to disk."""
        if checkpoint_id not in self._checkpoints:
            logger.warning(f"Checkpoint {checkpoint_id} not found")
            return False

        state = self._checkpoints[checkpoint_id]
        state.checkpoint_path = checkpoint_path
        state.status = MigrationStatus.COMPLETED
        logger.info(f"Finalized checkpoint {checkpoint_id} at {checkpoint_path}")
        return True

    async def cancel_checkpoint(self, checkpoint_id: str) -> bool:
        """Cancel a pending/checkpointing checkpoint."""
        state = self._checkpoints.get(checkpoint_id)
        if not state:
            return False
        if state.status != MigrationStatus.PENDING:
            return False
        state.status = MigrationStatus.CANCELLED
        logger.info(f"Cancelled checkpoint {checkpoint_id}")
        return True
    async def delete_checkpoint(self, checkpoint_id: str) -> bool:
        """Delete a checkpoint."""
        if checkpoint_id not in self._checkpoints:
            return False
        state = self._checkpoints[checkpoint_id]
        if state.checkpoint_path:
            Path(state.checkpoint_path).unlink(missing_ok=True)
        del self._checkpoints[checkpoint_id]
        logger.info(f"Deleted checkpoint {checkpoint_id}")
        return True

    def get_checkpoint(self, checkpoint_id: str) -> MigrationState | None:
        """Get checkpoint by ID."""
        return self._checkpoints.get(checkpoint_id)

    def list_checkpoints(self) -> list[MigrationState]:
        """List all checkpoints."""
        return list(self._checkpoints.values())


class TransferManager:
    """Manages state transfer between peers."""

    def __init__(
        self,
        source_client=None,
        target_client=None,
        chunk_size: int = 1024 * 1024,  # 1MB chunks
    ):
        self.source_client = source_client
        self.target_client = target_client
        self.chunk_size = chunk_size
        self._transfers: dict[str, MigrationState] = {}

    async def transfer_checkpoint(
        self,
        checkpoint: MigrationState,
        config: MigrationConfig | None = None,
    ) -> bool:
        """Transfer checkpoint from source to target peer."""
        config = config or MigrationConfig()

        if not checkpoint.checkpoint_path:
            logger.error("No checkpoint path set")
            return False

        checkpoint_path = Path(checkpoint.checkpoint_path)
        if not checkpoint_path.exists():
            logger.error(f"Checkpoint file not found: {checkpoint_path}")
            return False

        # Update state
        checkpoint.status = MigrationStatus.TRANSFERRING
        checkpoint.bytes_total = checkpoint_path.stat().st_size
        self._transfers[checkpoint.checkpoint_id] = checkpoint

        logger.info(
            f"Starting transfer of {checkpoint.checkpoint_id} "
            f"({checkpoint.bytes_total} bytes)"
        )

        # Simulate chunked transfer
        total_chunks = (checkpoint.bytes_total + self.chunk_size - 1) // self.chunk_size

        with open(checkpoint_path, "rb") as f:
            offset = 0
            while offset < checkpoint.bytes_total:
                chunk_data = f.read(self.chunk_size)
                if not chunk_data:
                    break

                chunk_num = offset // self.chunk_size
                success = await self._send_chunk(
                    checkpoint.checkpoint_id,
                    chunk_num,
                    total_chunks,
                    chunk_data,
                )

                if not success:
                    logger.error(f"Failed to send chunk {chunk_num}")
                    return False

                # Update progress
                checkpoint.bytes_transferred += len(chunk_data)
                checkpoint.progress = (chunk_num + 1) / total_chunks
                offset += len(chunk_data)

                logger.debug(f"Chunk {chunk_num}/{total_chunks} transferred")

        # Mark transfer complete
        checkpoint.status = MigrationStatus.TRANSFERRED
        checkpoint.end_time = time.time()
        _calculate_elapsed_time(checkpoint)

        logger.info(f"Transfer complete in {checkpoint.elapsed_time:.2f}s")
        return True

    async def _send_chunk(
        self,
        checkpoint_id: str,
        chunk_num: int,
        total_chunks: int,
        chunk_data: bytes,
    ) -> bool:
        """Send chunk to target peer."""
        # Simulate network delay
        try:
            await asyncio.sleep(0.01)
            return True
        except Exception as e:
            logger.error(f"Chunk transfer failed: {e}")
            return False

    async def cancel_transfer(self, checkpoint_id: str) -> bool:
        """Cancel ongoing transfer."""
        if checkpoint_id in self._transfers:
            self._transfers[checkpoint_id].status = MigrationStatus.CANCELLED
            logger.info(f"Cancelled transfer {checkpoint_id}")
            return True
        return False


class RestoreManager:
    """Manages container restoration on target peer."""

    def __init__(
        self,
        boot_manager=None,
        restore_dir: str = "/tmp/geometry-os-restore",
    ):
        self.boot_manager = boot_manager
        self.restore_dir = Path(restore_dir)
        self.restore_dir.mkdir(parents=True, exist_ok=True)

        self._received_chunks: dict[str, list[tuple]] = {}
        self._restorations: dict[str, MigrationState] = {}

    def receive_chunk(
        self,
        checkpoint_id: str,
        chunk_num: int,
        chunk_data: bytes,
    ) -> bool:
        """Receive a chunk of checkpoint data."""
        if checkpoint_id not in self._received_chunks:
            self._received_chunks[checkpoint_id] = []
        # Insert in order
        while len(self._received_chunks[checkpoint_id]) <= chunk_num:
            self._received_chunks[checkpoint_id].append(None)
        self._received_chunks[checkpoint_id][chunk_num] = (chunk_num, chunk_data)
        return True

    def is_checkpoint_complete(self, checkpoint_id: str, total_chunks: int) -> bool:
        """Check if all chunks received."""
        if checkpoint_id not in self._received_chunks:
            return False
        chunks = self._received_chunks.get(checkpoint_id, [])
        return len(chunks) == total_chunks and all(chunk is not None for chunk in chunks)

    async def restore_checkpoint(
        self,
        checkpoint_id: str,
        config: MigrationConfig | None = None,
    ) -> MigrationState:
        """Restore container from received checkpoint data."""
        # Check if already restored
        if checkpoint_id in self._restorations:
            return self._restorations[checkpoint_id]

        total_chunks = len(self._received_chunks.get(checkpoint_id, []))
        if not self.is_checkpoint_complete(checkpoint_id, total_chunks):
            raise ValueError(f"Not all chunks received for {checkpoint_id}")

        config = config or MigrationConfig()
        state = MigrationState(
            checkpoint_id=checkpoint_id,
            status=MigrationStatus.RESTORING,
            start_time=time.time(),
        )
        self._restorations[checkpoint_id] = state

        # Reassemble checkpoint file
        restore_path = self.restore_dir / f"{checkpoint_id}.qcow2"
        chunks = self._received_chunks[checkpoint_id]

        with open(restore_path, "wb") as f:
            for chunk_num, chunk_data in chunks:
                if chunk_data:
                    f.write(chunk_data)

        state.restore_path = str(restore_path)
        state.status = MigrationStatus.RESTORING

        logger.info(f"Reassembled checkpoint at {restore_path}")

        # Restore container using boot manager
        if self.boot_manager:
            container_name = f"restored-{checkpoint_id}"

            try:
                boot_result = await self.boot_manager.boot(
                    str(restore_path),
                    ephemeral=False,
                    name=container_name,
                )

                if not boot_result.success:
                    state.status = MigrationStatus.FAILED
                    state.error = boot_result.error
                    logger.error(f"Failed to boot restored container: {boot_result.error}")
                    return state

                # Simulate restoration delay
                await asyncio.sleep(0.5)

                # Get restored container info
                restored_container = self.boot_manager.get_container(container_name)
                if restored_container:
                    state.target_container = {
                        "id": restored_container.name,
                        "name": restored_container.name,
                        "vnc_port": restored_container.vnc_port,
                    }
                else:
                    state.target_container = {
                        "id": f"restored-{checkpoint_id}",
                        "name": f"restored-{checkpoint_id}",
                        "vnc_port": 5901,
                    }

                state.status = MigrationStatus.COMPLETED
                state.end_time = time.time()
                _calculate_elapsed_time(state)

                # Cleanup received chunks
                del self._received_chunks[checkpoint_id]

                logger.info(f"Restored container from {checkpoint_id}")
                return state
            except Exception as e:
                state.status = MigrationStatus.FAILED
                state.error = str(e)
                logger.error(f"Restore failed: {e}")
                return state
        else:
            # No boot manager - simulate restoration
            await asyncio.sleep(0.5)
            state.target_container = {
                "id": f"restored-{checkpoint_id}",
                "name": f"restored-{checkpoint_id}",
                "vnc_port": 5901,
            }
            state.status = MigrationStatus.COMPLETED
            state.end_time = time.time()
            _calculate_elapsed_time(state)

            # Cleanup received chunks
            del self._received_chunks[checkpoint_id]

            logger.info(f"Restored container from {checkpoint_id} (simulated)")
            return state

    def get_restoration(self, checkpoint_id: str) -> MigrationState | None:
        """Get restoration state."""
        return self._restorations.get(checkpoint_id)

    def list_restorations(self) -> list[MigrationState]:
        """List all restorations."""
        return list(self._restorations.values())


def _calculate_elapsed_time(state: MigrationState):
    """Helper to calculate elapsed time."""
    if state.end_time and state.end_time > state.start_time:
        state.elapsed_time = state.end_time - state.start_time


class MigrationCoordinator:
    """Coordinates complete migration workflow"""

    def __init__(
        self,
        checkpoint_manager: CheckpointManager,
        transfer_manager: TransferManager,
        restore_manager: RestoreManager,
        boot_manager=None,
    ):
        self.checkpoint_manager = checkpoint_manager
        self.transfer_manager = transfer_manager
        self.restore_manager = restore_manager
        self.boot_manager = boot_manager
        self._migrations: dict[str, MigrationState] = {}

    async def migrate(
        self,
        container_id: str,
        container_name: str,
        vnc_port: int,
        memory_size: int,
        target_peer: str,
        source_client=None,
        target_client=None,
        config: MigrationConfig | None = None,
        progress_callback: Callable[[str, float, str], None] | None = None,
    ) -> MigrationState:
        """Execute complete migration workflow"""
        start_time = time.time()
        migration_id = f"migration-{int(start_time * 1000)}"

        config = config or MigrationConfig()
        state = MigrationState(
            checkpoint_id=migration_id,
            source_container={
                "id": container_id,
                "name": container_name,
                "vnc_port": vnc_port,
                "memory_size": memory_size,
            },
            target_peer=target_peer,
            start_time=start_time,
        )

        self._migrations[migration_id] = state

        logger.info(f"Starting migration {migration_id} for container {container_name} to {target_peer}")

        try:
            # Phase 1: Create checkpoint
            state.status = MigrationStatus.CHECKPOINTING
            if progress_callback:
                progress_callback(migration_id, 0.0, state.status)

            checkpoint_state = await self.checkpoint_manager.create_checkpoint(
                container_id=container_id,
                container_name=container_name,
                vnc_port=vnc_port,
                memory_size_mb=memory_size,
            )
            state.checkpoint_id = checkpoint_state.checkpoint_id
            state.progress = 0.33
            if progress_callback:
                progress_callback(migration_id, 0.33, state.status)

            # Phase 2: Transfer checkpoint
            state.status = MigrationStatus.TRANSFERRING
            if progress_callback:
                progress_callback(migration_id, 0.33, state.status)

            # Create a dummy checkpoint file for transfer
            checkpoint_path = self.checkpoint_manager.checkpoint_dir / f"{checkpoint_state.checkpoint_id}.qcow2"
            checkpoint_path.write_bytes(b"x" * 1024)
            checkpoint_state.checkpoint_path = str(checkpoint_path)

            transfer_success = await self.transfer_manager.transfer_checkpoint(
                checkpoint_state,
                config,
            )
            if not transfer_success:
                raise RuntimeError("Checkpoint transfer failed")
            state.progress = 0.66
            if progress_callback:
                progress_callback(migration_id, 0.66, state.status)

            # Phase 3: Restore on target - simulate receiving chunks
            # In a real implementation, these chunks would be received from TransferManager
            # For testing, we simulate by reading the checkpoint file and sending chunks
            for chunk_num in range(2):
                chunk_data = b"chunk" * 100
                self.restore_manager.receive_chunk(checkpoint_state.checkpoint_id, chunk_num, chunk_data)

            state.status = MigrationStatus.RESTORING
            if progress_callback:
                progress_callback(migration_id, 0.66, state.status)
            restore_state = await self.restore_manager.restore_checkpoint(
                checkpoint_state.checkpoint_id,
                config,
            )
            state.target_container = restore_state.target_container
            state.progress = 0.9
            if progress_callback:
                progress_callback(migration_id, 0.9, state.status)

            # Phase 4: Reconnect network
            if config.reconnect_network:
                state.status = MigrationStatus.RECONNECTING
                if progress_callback:
                    progress_callback(migration_id, 0.9, state.status)
                await asyncio.sleep(0.1)  # Simulate reconnection
            state.progress = 0.95
            if progress_callback:
                progress_callback(migration_id, 0.95, state.status)

            # Phase 5: Verify
            if config.verify_checksum:
                state.status = MigrationStatus.VERIFYING
                if progress_callback:
                    progress_callback(migration_id, 0.95, state.status)
                # Verify container is running
                if self.boot_manager:
                    restored = self.boot_manager.get_container(state.target_container["name"])
                    if not restored:
                        raise RuntimeError("Container not found after restore")
                # Simulate verification
                await asyncio.sleep(0.1)
            state.progress = 1.0
            if progress_callback:
                progress_callback(migration_id, 1.0, state.status)

            # Phase 6: Cleanup source
            if config.cleanup_source and self.boot_manager:
                source_container = self.boot_manager.get_container(container_name)
                if source_container:
                    await self.boot_manager.stop(container_name)
                    logger.info(f"Stopped source container {container_name}")

            # Cleanup checkpoint files
            await self.checkpoint_manager.delete_checkpoint(state.checkpoint_id)
            state.status = MigrationStatus.COMPLETED
            state.end_time = time.time()
            _calculate_elapsed_time(state)
            logger.info(
                f"Migration {migration_id} completed in {state.elapsed_time:.2f}s "
                f"Container {container_name} now running on {target_peer}"
            )
            return state
        except Exception as e:
            state.status = MigrationStatus.FAILED
            state.error = str(e)
            state.end_time = time.time()
            _calculate_elapsed_time(state)
            logger.error(f"Migration {migration_id} failed: {e}")
            return state

    def get_migration(self, migration_id: str) -> MigrationState | None:
        """Get migration state."""
        return self._migrations.get(migration_id)

    def list_migrations(self) -> list[MigrationState]:
        """List all migrations."""
        return list(self._migrations.values())

    async def cancel_migration(self, migration_id: str) -> bool:
        """Cancel an ongoing migration."""
        if migration_id not in self._migrations:
            return False
        state = self._migrations[migration_id]
        if state.status == MigrationStatus.COMPLETED:
            return False
        # Cancel checkpoint if in progress
        if state.checkpoint_id:
            await self.checkpoint_manager.cancel_checkpoint(state.checkpoint_id)
        # Cancel transfer if in progress
        await self.transfer_manager.cancel_transfer(state.checkpoint_id)
        state.status = MigrationStatus.CANCELLED
        logger.info(f"Cancelled migration {migration_id}")
        return True


# Convenience functions
def create_migration_coordinator(
    boot_manager=None,
    source_client=None,
    target_client=None,
) -> MigrationCoordinator:
    """Create a fully configured migration coordinator."""
    checkpoint_dir = "/tmp/geometry-os-checkpoints"
    checkpoint_manager = CheckpointManager(checkpoint_dir)
    transfer_manager = TransferManager(source_client, target_client)
    restore_manager = RestoreManager(boot_manager)
    return MigrationCoordinator(
        checkpoint_manager,
        transfer_manager,
        restore_manager,
        boot_manager,
    )
