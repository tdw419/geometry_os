"""
BuildOrchestrator - NEB-Integrated Build Swarm Coordinator

Rectified (2026-02-24): Integrated with Neural Event Bus for real-time
event publishing. Part of the "World of Rectification" game engine.

NEB Events Published:
- build.job.submitted - New job added to queue
- build.job.dispatched - Job assigned to worker
- build.job.completed - Job finished (success/failure)
- build.worker.started - Worker came online
- build.worker.stopped - Worker went offline
- build.swarm.status - Periodic swarm health update
"""

import asyncio
import logging
import sys
import uuid
import os
import time
from pathlib import Path
from typing import List, Optional, Dict, Any, Callable
from dataclasses import dataclass, field

# Adjust path to enable relative imports if running directly
if __name__ == "__main__":
    sys.path.append(os.getcwd())

from systems.build.worker import BuildWorker
from systems.build.job_queue import JobQueue
from systems.build.job_protocol import BuildJob, JobStatus, JobManifest, create_shell_script_job

# NEB Integration
try:
    from systems.swarm import NEBBus, NEBSignal
    NEB_AVAILABLE = True
except ImportError:
    NEB_AVAILABLE = False
    NEBBus = None
    NEBSignal = None

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger("BuildOrchestrator")


@dataclass
class SwarmMetrics:
    """Metrics for swarm health monitoring."""
    total_workers: int = 0
    active_workers: int = 0
    idle_workers: int = 0
    jobs_queued: int = 0
    jobs_active: int = 0
    jobs_completed: int = 0
    jobs_failed: int = 0
    last_update: float = field(default_factory=time.time)


class BuildOrchestrator:
    """
    Orchestrates build workers with NEB event publishing.

    The orchestrator manages a swarm of build workers, assigns jobs
    from the queue, and publishes events to the Neural Event Bus for
    real-time monitoring and visualization.
    """

    def __init__(
        self,
        artifact_path: Path,
        worker_count: int = 2,
        neb_bus: Optional[Any] = None,
        node_id: str = "build-orchestrator"
    ):
        self.artifact_path = artifact_path
        self.worker_count = worker_count
        self.workers: List[BuildWorker] = []
        self.kernel_path = Path("/tmp/geometry_os/runtime/ubuntu.rts/kernel")
        self.initrd_path = Path("/tmp/geometry_os/runtime/ubuntu.rts/initrd")

        # Initialize JobQueue
        self.job_queue = JobQueue(max_concurrent_jobs=worker_count * 2)

        # NEB Integration
        self.neb_bus = neb_bus
        self.node_id = node_id
        self._setup_neb()

        # Metrics tracking
        self.metrics = SwarmMetrics(total_workers=worker_count)

        # Orchestration state
        self._running = False
        self._orchestrator_task: Optional[asyncio.Task] = None
        self._metrics_task: Optional[asyncio.Task] = None
        self._shutdown_event = asyncio.Event()

    def _setup_neb(self):
        """Setup NEB bus connection and subscriptions."""
        if not NEB_AVAILABLE or not self.neb_bus:
            logger.warning("NEB not available - running without event publishing")
            return

        logger.info(f"🌌 NEB integration enabled for {self.node_id}")

        # Subscribe to build control commands
        self.neb_bus.subscribe("build.control.*", self._on_control_command)

    def _on_control_command(self, signal):
        """Handle build control commands from NEB."""
        command = signal.payload.get("command")
        job_id = signal.payload.get("job_id")

        if command == "cancel_job" and job_id:
            logger.info(f"📡 Received cancel command for job {job_id}")
            # TODO: Implement job cancellation
        elif command == "pause_swarm":
            logger.info("📡 Received pause command")
            self._running = False
        elif command == "resume_swarm":
            logger.info("📡 Received resume command")
            self._running = True

    def _publish_event(self, topic: str, payload: Dict[str, Any]):
        """Publish an event to NEB."""
        if not NEB_AVAILABLE or not self.neb_bus:
            return

        try:
            signal = NEBSignal(
                topic=topic,
                payload=payload,
                source=self.node_id,
                timestamp=time.time()
            )
            self.neb_bus.publish(topic, payload)
            logger.debug(f"📡 Published {topic}")
        except Exception as e:
            logger.warning(f"Failed to publish NEB event: {e}")

    async def setup(self):
        """Prepare the environment and extract artifacts if needed."""
        if not self.kernel_path.exists() or not self.initrd_path.exists():
            logger.warning("Artifacts not found in /tmp. Ensure Phase 18 / Nursery setup is complete.")

        logger.info("Orchestrator setup complete.")

        # Publish startup event
        self._publish_event("build.orchestrator.started", {
            "node_id": self.node_id,
            "worker_count": self.worker_count,
            "timestamp": time.time()
        })

    async def initialize_swarm(self):
        """Spawn the worker pool."""
        logger.info(f"Initializing swarm with {self.worker_count} workers...")

        for i in range(self.worker_count):
            worker = BuildWorker(i, self.artifact_path, self.kernel_path, self.initrd_path)
            await worker.prepare()

            # Create a bootstrap script for each worker
            bootstrap_path = worker.shared_dir / "bootstrap.sh"
            with open(bootstrap_path, "w") as f:
                f.write("""#!/bin/bash
echo "Worker Bootstrap"
# Basic setup - in real system this downloads tools
mkdir -p /mnt/host_shared/output
echo "Build tools installed"
""")

            self.workers.append(worker)

            # Publish worker started event
            self._publish_event("build.worker.started", {
                "worker_id": i,
                "status": "prepared",
                "timestamp": time.time()
            })

        start_tasks = [w.start() for w in self.workers]
        await asyncio.gather(*start_tasks)

        # Update metrics
        self.metrics.active_workers = self.worker_count
        self.metrics.idle_workers = self.worker_count

        logger.info("Swarm initialized and booting.")

        # Publish swarm ready event
        self._publish_event("build.swarm.ready", {
            "total_workers": self.worker_count,
            "timestamp": time.time()
        })

    async def _orchestration_loop(self):
        """Main loop that assigns jobs to idle workers."""
        logger.info("Starting orchestration loop")

        while self._running:
            try:
                # 1. Find idle workers
                idle_workers = [w for w in self.workers if w.is_ready()]
                self.metrics.idle_workers = len(idle_workers)
                self.metrics.active_workers = len(self.workers) - len(idle_workers)

                if not idle_workers:
                    await asyncio.sleep(0.5)
                    continue

                # 2. Get next job
                job = self.job_queue.get_next_job()

                if job:
                    # 3. Assign to first idle worker
                    worker = idle_workers[0]
                    await self.assign_job(worker, job)
                else:
                    # Update queue metrics
                    status = self.job_queue.get_queue_status()
                    self.metrics.jobs_queued = status.get('queued', 0)
                    self.metrics.jobs_active = status.get('active', 0)
                    await asyncio.sleep(0.5)

            except Exception as e:
                logger.error(f"Error in orchestration loop: {e}")
                await asyncio.sleep(1)

    async def _metrics_loop(self):
        """Periodically publish swarm metrics."""
        while self._running:
            try:
                status = self.job_queue.get_queue_status()
                self.metrics.jobs_queued = status.get('queued', 0)
                self.metrics.jobs_active = status.get('active', 0)
                self.metrics.last_update = time.time()

                # Publish metrics event
                self._publish_event("build.swarm.status", {
                    "node_id": self.node_id,
                    "metrics": {
                        "total_workers": self.metrics.total_workers,
                        "active_workers": self.metrics.active_workers,
                        "idle_workers": self.metrics.idle_workers,
                        "jobs_queued": self.metrics.jobs_queued,
                        "jobs_active": self.metrics.jobs_active,
                        "jobs_completed": self.metrics.jobs_completed,
                        "jobs_failed": self.metrics.jobs_failed,
                    },
                    "timestamp": time.time()
                })

                await asyncio.sleep(5.0)  # Publish every 5 seconds

            except Exception as e:
                logger.error(f"Error in metrics loop: {e}")
                await asyncio.sleep(5)

    async def assign_job(self, worker: BuildWorker, job: BuildJob):
        """Assign a job to a specific worker."""
        logger.info(f"Assigning Job {job.job_id} to Worker {worker.worker_id}")

        # Track in JobQueue as active logic
        self.job_queue.active_jobs[job.job_id] = job
        job.update_status(JobStatus.DISPATCHED)
        job.worker_id = worker.worker_id

        # Publish dispatch event
        self._publish_event("build.job.dispatched", {
            "job_id": job.job_id,
            "worker_id": worker.worker_id,
            "manifest_name": job.manifest.name if job.manifest else "unknown",
            "timestamp": time.time()
        })

        # Execute on worker
        success = await worker.execute_job(job, self.on_job_complete_callback)

        if not success:
            logger.error(f"Worker {worker.worker_id} rejected job {job.job_id}")
            self._publish_event("build.job.rejected", {
                "job_id": job.job_id,
                "worker_id": worker.worker_id,
                "error": "Worker rejection",
                "timestamp": time.time()
            })
            self.job_queue.mark_job_completed(job.job_id, success=False, error_message="Worker rejection")

    def on_job_complete_callback(self, job_id: str, success: bool, error_message: str):
        """Callback from worker when job finishes."""
        job = self.job_queue.active_jobs.get(job_id)

        if job:
            logger.info(f"Callback: Job {job_id} finished (Success={success})")

            # Update metrics
            if success:
                self.metrics.jobs_completed += 1
            else:
                self.metrics.jobs_failed += 1

            # Publish completion event
            event_type = "build.job.completed" if success else "build.job.failed"
            self._publish_event(event_type, {
                "job_id": job_id,
                "worker_id": job.worker_id,
                "success": success,
                "error_message": error_message,
                "manifest_name": job.manifest.name if job.manifest else "unknown",
                "timestamp": time.time()
            })

            self.job_queue.mark_job_completed(job_id, success, error_message)
        else:
            logger.warning(f"Callback for unknown or already completed job {job_id}")

    async def submit_manifest(self, manifest: JobManifest):
        """Public API to submit work."""
        self.job_queue.submit_manifest(manifest)

        # Publish submission events for each job
        for job in manifest.jobs:
            self._publish_event("build.job.submitted", {
                "job_id": job.job_id,
                "manifest_name": manifest.name,
                "manifest_version": manifest.version,
                "timestamp": time.time()
            })

        logger.info(f"Submitted manifest {manifest.name} with {len(manifest.jobs)} jobs")

    async def start(self):
        """Start the orchestration system."""
        self._running = True
        await self.setup()
        await self.initialize_swarm()

        # Start orchestration and metrics loops
        self._orchestrator_task = asyncio.create_task(self._orchestration_loop())
        self._metrics_task = asyncio.create_task(self._metrics_loop())

        logger.info("Orchestrator online with NEB integration.")

    async def stop(self):
        """Stop the orchestration system."""
        self._running = False

        # Publish shutdown event
        self._publish_event("build.orchestrator.stopping", {
            "node_id": self.node_id,
            "timestamp": time.time()
        })

        if self._orchestrator_task:
            self._orchestrator_task.cancel()
            try:
                await self._orchestrator_task
            except asyncio.CancelledError:
                pass

        if self._metrics_task:
            self._metrics_task.cancel()
            try:
                await self._metrics_task
            except asyncio.CancelledError:
                pass

        await self.shutdown_swarm()

    async def shutdown_swarm(self):
        """Terminate all workers."""
        logger.info("Shutting down swarm...")

        for worker in self.workers:
            await worker.stop()

            # Publish worker stopped event
            self._publish_event("build.worker.stopped", {
                "worker_id": worker.worker_id,
                "timestamp": time.time()
            })

        self.workers.clear()

        # Publish final metrics
        self._publish_event("build.swarm.shutdown", {
            "final_metrics": {
                "jobs_completed": self.metrics.jobs_completed,
                "jobs_failed": self.metrics.jobs_failed,
            },
            "timestamp": time.time()
        })

        logger.info("Swarm shutdown complete.")

    def get_metrics(self) -> SwarmMetrics:
        """Get current swarm metrics."""
        return self.metrics

    def get_status(self) -> Dict[str, Any]:
        """Get detailed orchestrator status."""
        queue_status = self.job_queue.get_queue_status()

        return {
            "running": self._running,
            "node_id": self.node_id,
            "neb_enabled": self.neb_bus is not None,
            "workers": {
                "total": len(self.workers),
                "idle": sum(1 for w in self.workers if w.is_ready()),
            },
            "queue": queue_status,
            "metrics": {
                "jobs_completed": self.metrics.jobs_completed,
                "jobs_failed": self.metrics.jobs_failed,
            }
        }


# CLI Entry Point
async def main():
    """Demo the BuildOrchestrator with NEB integration."""
    import argparse

    parser = argparse.ArgumentParser(description="Build Orchestrator with NEB")
    parser.add_argument("--workers", type=int, default=2, help="Number of workers")
    parser.add_argument("--neb", action="store_true", help="Enable NEB integration")
    args = parser.parse_args()

    # Setup NEB if requested
    neb_bus = None
    if args.neb and NEB_AVAILABLE:
        neb_bus = NEBBus(node_id="build-orchestrator")
        logger.info("🌌 NEB bus initialized")

    # Create orchestrator
    artifact_path = Path("/tmp/geometry_os/artifacts")
    artifact_path.mkdir(parents=True, exist_ok=True)

    orchestrator = BuildOrchestrator(
        artifact_path=artifact_path,
        worker_count=args.workers,
        neb_bus=neb_bus
    )

    try:
        await orchestrator.start()

        # Submit a test manifest
        manifest = create_shell_script_job(
            name="test-build",
            script_content="#!/bin/bash\necho 'Hello from build swarm'\n",
            output_artifacts=["output/test.txt"]
        )
        await orchestrator.submit_manifest(manifest)

        # Run for a while
        logger.info("Orchestrator running. Press Ctrl+C to stop.")
        await asyncio.Future()  # Run forever

    except KeyboardInterrupt:
        logger.info("Shutting down...")
    finally:
        await orchestrator.stop()


if __name__ == "__main__":
    asyncio.run(main())
