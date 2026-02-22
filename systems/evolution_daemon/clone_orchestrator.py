#!/usr/bin/env python3
"""
Clone Orchestrator - Manages autonomous UI cloning pipeline.

Orchestrates the flow:
    Extraction Result -> UITransmuter -> WGSL Shader -> .geometry/clones/

Task 3 of substrate-cloning spec.
"""

import uuid
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Dict, Any, Optional, List

# Import UITransmuter from wrapper
from systems.evolution_daemon.ui_transmuter import UITransmuter


@dataclass
class CloneTask:
    """
    Dataclass for tracking a clone operation.

    Attributes:
        task_id: Unique identifier for this clone task
        source_tile_id: ID of the source tile being cloned
        extraction_result: Dict with 'widgets' and 'metadata' from extraction
        target_name: Human-readable name for the cloned output
        status: Current status (pending, completed, failed)
        generated_wgsl: The generated WGSL shader code (None until completed)
        output_path: Path where WGSL was saved (None until completed)
        error: Error message if status is failed
        created_at: Timestamp when task was created
        completed_at: Timestamp when task completed
    """
    task_id: str
    source_tile_id: str
    extraction_result: Dict[str, Any]
    target_name: str
    status: str = "pending"
    generated_wgsl: Optional[str] = None
    output_path: Optional[Path] = None
    error: Optional[str] = None
    created_at: datetime = field(default_factory=datetime.now)
    completed_at: Optional[datetime] = None


class CloneOrchestrator:
    """
    Orchestrates the UI cloning pipeline.

    Manages clone tasks from request through completion, coordinating:
    1. Task queue management
    2. UITransmuter invocation
    3. WGSL output to .geometry/clones/

    Usage:
        orchestrator = CloneOrchestrator()
        task_id = orchestrator.request_clone(
            source_tile_id="tile-123",
            extraction_result={"widgets": [...], "metadata": {...}},
            target_name="my_panel"
        )
        orchestrator._execute_clone(task_id)
        wgsl = orchestrator.get_generated_wgsl(task_id)
    """

    def __init__(self, output_dir: Optional[Path] = None):
        """
        Initialize the orchestrator.

        Args:
            output_dir: Directory to save cloned WGSL files
                       (default: .geometry/clones/)
        """
        self.tasks: Dict[str, CloneTask] = {}

        # Default output directory
        if output_dir is None:
            output_dir = Path(__file__).parent.parent.parent / ".geometry" / "clones"
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(parents=True, exist_ok=True)

        # Initialize transmuter
        self.transmuter = UITransmuter()

    def request_clone(
        self,
        source_tile_id: str,
        extraction_result: Dict[str, Any],
        target_name: str
    ) -> str:
        """
        Request a new clone operation.

        Creates a CloneTask and adds it to the queue.

        Args:
            source_tile_id: ID of the source tile to clone
            extraction_result: Dict with 'widgets' and 'metadata'
            target_name: Name for the cloned output

        Returns:
            Task ID for tracking the clone operation
        """
        # Generate unique task ID
        task_id = f"clone-{uuid.uuid4().hex[:8]}"

        # Create task
        task = CloneTask(
            task_id=task_id,
            source_tile_id=source_tile_id,
            extraction_result=extraction_result,
            target_name=target_name
        )

        # Add to queue
        self.tasks[task_id] = task

        return task_id

    def _execute_clone(self, task_id: str) -> None:
        """
        Execute the clone pipeline for a task.

        Pipeline:
        1. Get extraction result from task
        2. Transmute to WGSL via UITransmuter
        3. Save to output directory

        Args:
            task_id: ID of task to execute

        Raises:
            ValueError: If task not found
        """
        if task_id not in self.tasks:
            raise ValueError(f"Task {task_id} not found")

        task = self.tasks[task_id]

        try:
            # Generate WGSL from extraction
            wgsl = self.transmuter.transmute(task.extraction_result)

            # Create output filename
            output_file = self.output_dir / f"{task.target_name}.wgsl"

            # Save WGSL
            output_file.write_text(wgsl)

            # Update task
            task.generated_wgsl = wgsl
            task.output_path = output_file
            task.status = "completed"
            task.completed_at = datetime.now()

        except Exception as e:
            task.status = "failed"
            task.error = str(e)
            task.completed_at = datetime.now()
            raise

    def get_generated_wgsl(self, task_id: str) -> Optional[str]:
        """
        Get the generated WGSL for a completed task.

        Args:
            task_id: Task ID to query

        Returns:
            WGSL string if task completed, None otherwise
        """
        if task_id not in self.tasks:
            return None
        return self.tasks[task_id].generated_wgsl

    def get_task(self, task_id: str) -> Optional[CloneTask]:
        """
        Get a task by ID.

        Args:
            task_id: Task ID to query

        Returns:
            CloneTask if found, None otherwise
        """
        return self.tasks.get(task_id)

    def list_tasks(self) -> List[CloneTask]:
        """
        List all tasks.

        Returns:
            List of all CloneTask objects
        """
        return list(self.tasks.values())


# Convenience function for one-shot cloning
def clone_extraction(
    extraction_result: Dict[str, Any],
    target_name: str,
    source_tile_id: str = "unknown",
    output_dir: Optional[Path] = None
) -> tuple[str, Path]:
    """
    Convenience function for one-shot cloning.

    Args:
        extraction_result: Dict with 'widgets' and 'metadata'
        target_name: Name for the cloned output
        source_tile_id: Optional source tile ID
        output_dir: Optional output directory

    Returns:
        Tuple of (task_id, output_path)

    Example:
        task_id, path = clone_extraction(
            extraction_result={"widgets": [...]},
            target_name="my_button"
        )
    """
    orchestrator = CloneOrchestrator(output_dir=output_dir)
    task_id = orchestrator.request_clone(
        source_tile_id=source_tile_id,
        extraction_result=extraction_result,
        target_name=target_name
    )
    orchestrator._execute_clone(task_id)
    return task_id, orchestrator.get_task(task_id).output_path
