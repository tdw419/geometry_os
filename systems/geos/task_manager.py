"""
Geometry OS Task Manager
Manages task metadata and lifecycle in the spatial stratum.
"""

from typing import Dict, List, Optional
from dataclasses import dataclass
from enum import IntEnum

class TaskState(IntEnum):
    EMPTY = 0
    ACTIVE = 1
    PAUSED = 2
    ZOMBIE = 3

@dataclass
class TaskEntry:
    vm_id: int
    start_addr: int
    page_count: int
    state: TaskState
    parent_id: int = 0
    focus_score: float = 0.0

class TaskManager:
    """Manages the lifecycle of spatial tasks."""
    
    def __init__(self, max_tasks: int = 8):
        self.max_tasks = max_tasks
        # Simplified in-memory table matching the VRAM layout
        self.tasks: Dict[int, TaskEntry] = {}
        
    def register_task(self, vm_id: int, start_addr: int, page_count: int, parent_id: int = 0) -> bool:
        """Register a new task in the table."""
        if len(self.tasks) >= self.max_tasks:
            return False
            
        self.tasks[vm_id] = TaskEntry(
            vm_id=vm_id,
            start_addr=start_addr,
            page_count=page_count,
            state=TaskState.ACTIVE,
            parent_id=parent_id
        )
        return True
        
    def unregister_task(self, vm_id: int):
        """Remove a task from the table."""
        if vm_id in self.tasks:
            del self.tasks[vm_id]
            
    def set_state(self, vm_id: int, state: TaskState):
        """Update task state."""
        if vm_id in self.tasks:
            self.tasks[vm_id].state = state
            
    def get_task_list(self) -> List[Dict]:
        """Get all registered tasks as a list of dicts."""
        return [
            {
                "vm_id": t.vm_id,
                "start_addr": t.start_addr,
                "start_addr_hex": f"0x{t.start_addr:08X}",
                "page_count": t.page_count,
                "state": t.state.name,
                "parent_id": t.parent_id,
                "focus_score": t.focus_score
            }
            for t in self.tasks.values()
        ]
