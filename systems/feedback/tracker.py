"""
Interaction Tracker Module

Tracks user interaction events for behavioral analysis:
- Clicks, hovers, scrolls
- Navigation patterns
- Timing data (dwell time, task completion)
- Error encounters
- Feature usage
"""

import json
import uuid
import time
import threading
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Optional, Callable
from collections import deque, defaultdict
import logging

logger = logging.getLogger(__name__)


class EventType(Enum):
    """Types of interaction events."""

    # Mouse/Touch events
    CLICK = "click"
    DOUBLE_CLICK = "double_click"
    RIGHT_CLICK = "right_click"
    HOVER_START = "hover_start"
    HOVER_END = "hover_end"
    SCROLL = "scroll"
    DRAG_START = "drag_start"
    DRAG_END = "drag_end"

    # Keyboard events
    KEY_PRESS = "key_press"
    SHORTCUT = "shortcut"

    # Navigation events
    VIEW_ENTER = "view_enter"
    VIEW_EXIT = "view_exit"
    NAVIGATION = "navigation"

    # Timing events
    SESSION_START = "session_start"
    SESSION_END = "session_end"
    IDLE_START = "idle_start"
    IDLE_END = "idle_end"
    TASK_START = "task_start"
    TASK_END = "task_end"

    # Feature usage
    FEATURE_USE = "feature_use"
    COMMAND_EXECUTE = "command_execute"

    # Error/Issue events
    ERROR_ENCOUNTER = "error_encounter"
    ERROR_RECOVER = "error_recover"
    UNDO = "undo"
    REDO = "redo"

    # Custom events
    CUSTOM = "custom"


@dataclass
class InteractionEvent:
    """A single interaction event."""

    id: str = field(default_factory=lambda: str(uuid.uuid4()))
    event_type: EventType = EventType.CUSTOM
    timestamp: float = field(default_factory=time.time)
    component: Optional[str] = None
    view: Optional[str] = None
    session_id: Optional[str] = None
    user_id: Optional[str] = None

    # Event-specific data
    data: dict = field(default_factory=dict)

    # Timing data
    duration_ms: Optional[float] = None  # For timed events (hover, task)

    # Position data (for spatial analysis)
    position: Optional[tuple] = None  # (x, y)

    # Metadata
    metadata: dict = field(default_factory=dict)

    def to_dict(self) -> dict:
        return {
            "id": self.id,
            "event_type": self.event_type.value,
            "timestamp": self.timestamp,
            "component": self.component,
            "view": self.view,
            "session_id": self.session_id,
            "user_id": self.user_id,
            "data": self.data,
            "duration_ms": self.duration_ms,
            "position": self.position,
            "metadata": self.metadata,
        }

    @classmethod
    def from_dict(cls, data: dict) -> "InteractionEvent":
        return cls(
            id=data.get("id", str(uuid.uuid4())),
            event_type=EventType(data.get("event_type", "custom")),
            timestamp=data.get("timestamp", time.time()),
            component=data.get("component"),
            view=data.get("view"),
            session_id=data.get("session_id"),
            user_id=data.get("user_id"),
            data=data.get("data", {}),
            duration_ms=data.get("duration_ms"),
            position=tuple(data["position"]) if data.get("position") else None,
            metadata=data.get("metadata", {}),
        )


class InteractionTracker:
    """
    Tracks and analyzes user interaction events.

    Features:
    - Event collection with automatic batching
    - Session management
    - Idle detection
    - Privacy-conscious tracking (configurable detail levels)
    - Real-time event callbacks
    """

    def __init__(
        self,
        storage_path: Optional[Path] = None,
        max_in_memory: int = 5000,
        batch_size: int = 100,
        idle_timeout_seconds: float = 30.0,
        track_positions: bool = True,
        auto_persist: bool = True,
    ):
        self.storage_path = storage_path or (
            Path.home() / ".geometry_os" / "interactions"
        )
        self.storage_path.mkdir(parents=True, exist_ok=True)
        self.events_file = self.storage_path / "events.jsonl"

        self._events: deque[InteractionEvent] = deque(maxlen=max_in_memory)
        self._batch_buffer: list[InteractionEvent] = []
        self._batch_size = batch_size
        self._lock = threading.RLock()
        self._auto_persist = auto_persist
        self._track_positions = track_positions

        # Session management
        self._session_id = str(uuid.uuid4())
        self._session_start = time.time()
        self._last_activity = time.time()
        self._idle_timeout = idle_timeout_seconds
        self._is_idle = False

        # Event callbacks
        self._callbacks: dict[EventType, list[Callable]] = defaultdict(list)

        # Timers for tracked events
        self._active_timers: dict[str, float] = {}

        # Load existing events
        self._load_from_disk()

        # Record session start
        self.track_event(EventType.SESSION_START)

        logger.info(f"InteractionTracker started for session {self._session_id}")

    def _load_from_disk(self):
        """Load existing events from disk."""
        if not self.events_file.exists():
            return

        try:
            with open(self.events_file) as f:
                for line in f:
                    if line.strip():
                        event = InteractionEvent.from_dict(json.loads(line))
                        self._events.append(event)
            logger.info(f"Loaded {len(self._events)} existing events")
        except Exception as e:
            logger.error(f"Failed to load events: {e}")

    def _persist_event(self, event: InteractionEvent):
        """Persist an event to disk."""
        if not self._auto_persist:
            return

        try:
            with open(self.events_file, "a") as f:
                f.write(json.dumps(event.to_dict()) + "\n")
        except Exception as e:
            logger.error(f"Failed to persist event: {e}")

    def register_callback(self, event_type: EventType, callback: Callable):
        """Register a callback for a specific event type."""
        self._callbacks[event_type].append(callback)

    def _notify_callbacks(self, event: InteractionEvent):
        """Notify registered callbacks of an event."""
        for callback in self._callbacks.get(event.event_type, []):
            try:
                callback(event)
            except Exception as e:
                logger.error(f"Event callback error: {e}")

        # Also notify wildcard callbacks
        for callback in self._callbacks.get(EventType.CUSTOM, []):
            try:
                callback(event)
            except Exception as e:
                logger.error(f"Wildcard callback error: {e}")

    def _update_activity(self):
        """Update last activity timestamp and handle idle state."""
        now = time.time()
        was_idle = self._is_idle

        self._last_activity = now
        self._is_idle = False

        if was_idle:
            self.track_event(EventType.IDLE_END)

    def check_idle(self) -> bool:
        """Check if user has been idle and update state."""
        now = time.time()
        if not self._is_idle and (now - self._last_activity) > self._idle_timeout:
            self._is_idle = True
            self.track_event(EventType.IDLE_START)
            return True
        return False

    # --- Core Tracking Methods ---

    def track_event(
        self,
        event_type: EventType,
        component: Optional[str] = None,
        view: Optional[str] = None,
        data: Optional[dict] = None,
        position: Optional[tuple] = None,
        duration_ms: Optional[float] = None,
        metadata: Optional[dict] = None,
    ) -> InteractionEvent:
        """Track a generic interaction event."""
        self._update_activity()

        event = InteractionEvent(
            event_type=event_type,
            component=component,
            view=view,
            session_id=self._session_id,
            data=data or {},
            duration_ms=duration_ms,
            position=position if self._track_positions else None,
            metadata=metadata or {},
        )

        with self._lock:
            self._events.append(event)
            self._batch_buffer.append(event)

            if len(self._batch_buffer) >= self._batch_size:
                self._batch_buffer.clear()

        self._persist_event(event)
        self._notify_callbacks(event)

        return event

    # --- Convenience Methods for Common Events ---

    def track_click(
        self,
        component: str,
        view: Optional[str] = None,
        position: Optional[tuple] = None,
        button: str = "left",
    ) -> InteractionEvent:
        """Track a click event."""
        event_type = {
            "left": EventType.CLICK,
            "right": EventType.RIGHT_CLICK,
            "double": EventType.DOUBLE_CLICK,
        }.get(button, EventType.CLICK)

        return self.track_event(
            event_type=event_type,
            component=component,
            view=view,
            position=position,
            data={"button": button},
        )

    def track_hover(
        self,
        component: str,
        duration_ms: float,
        view: Optional[str] = None,
        position: Optional[tuple] = None,
    ) -> InteractionEvent:
        """Track a hover event (call on hover end)."""
        return self.track_event(
            event_type=EventType.HOVER_END,
            component=component,
            view=view,
            position=position,
            duration_ms=duration_ms,
            data={"duration_seconds": duration_ms / 1000},
        )

    def start_hover_timer(self, component: str):
        """Start timing a hover."""
        self._active_timers[f"hover_{component}"] = time.time()

    def end_hover_timer(
        self, component: str, view: Optional[str] = None, position: Optional[tuple] = None
    ) -> Optional[InteractionEvent]:
        """End timing a hover and track the event."""
        timer_key = f"hover_{component}"
        start_time = self._active_timers.pop(timer_key, None)
        if start_time is None:
            return None

        duration_ms = (time.time() - start_time) * 1000
        return self.track_hover(component, duration_ms, view, position)

    def track_scroll(
        self,
        component: str,
        direction: str,
        distance: float,
        view: Optional[str] = None,
    ) -> InteractionEvent:
        """Track a scroll event."""
        return self.track_event(
            event_type=EventType.SCROLL,
            component=component,
            view=view,
            data={"direction": direction, "distance": distance},
        )

    def track_navigation(
        self,
        from_view: str,
        to_view: str,
        method: str = "click",
    ) -> InteractionEvent:
        """Track a navigation event."""
        return self.track_event(
            event_type=EventType.NAVIGATION,
            data={"from": from_view, "to": to_view, "method": method},
        )

    def track_view_enter(self, view: str) -> InteractionEvent:
        """Track entering a view."""
        return self.track_event(event_type=EventType.VIEW_ENTER, view=view)

    def track_view_exit(self, view: str, duration_ms: Optional[float] = None) -> InteractionEvent:
        """Track exiting a view."""
        return self.track_event(
            event_type=EventType.VIEW_EXIT,
            view=view,
            duration_ms=duration_ms,
        )

    def track_feature_use(
        self,
        feature_name: str,
        component: Optional[str] = None,
        parameters: Optional[dict] = None,
    ) -> InteractionEvent:
        """Track feature usage."""
        return self.track_event(
            event_type=EventType.FEATURE_USE,
            component=component or feature_name,
            data={"feature": feature_name, "parameters": parameters or {}},
        )

    def track_command(
        self,
        command: str,
        args: Optional[list] = None,
        result: Optional[str] = None,
    ) -> InteractionEvent:
        """Track command execution."""
        return self.track_event(
            event_type=EventType.COMMAND_EXECUTE,
            data={"command": command, "args": args or [], "result": result},
        )

    def track_error(
        self,
        error_type: str,
        message: str,
        component: Optional[str] = None,
        recoverable: bool = True,
    ) -> InteractionEvent:
        """Track an error encounter."""
        return self.track_event(
            event_type=EventType.ERROR_ENCOUNTER,
            component=component,
            data={
                "error_type": error_type,
                "message": message,
                "recoverable": recoverable,
            },
        )

    def track_error_recovery(
        self,
        error_id: str,
        recovery_method: str,
        success: bool = True,
    ) -> InteractionEvent:
        """Track error recovery."""
        return self.track_event(
            event_type=EventType.ERROR_RECOVER,
            data={
                "error_id": error_id,
                "recovery_method": recovery_method,
                "success": success,
            },
        )

    # --- Task Tracking ---

    def start_task(self, task_name: str, metadata: Optional[dict] = None) -> str:
        """Start tracking a task. Returns task ID."""
        task_id = f"task_{task_name}_{uuid.uuid4().hex[:8]}"
        self._active_timers[task_id] = time.time()

        self.track_event(
            event_type=EventType.TASK_START,
            data={"task_name": task_name, "task_id": task_id},
            metadata=metadata or {},
        )

        return task_id

    def end_task(
        self,
        task_id: str,
        success: bool = True,
        metadata: Optional[dict] = None,
    ) -> Optional[InteractionEvent]:
        """End tracking a task."""
        start_time = self._active_timers.pop(task_id, None)
        if start_time is None:
            return None

        duration_ms = (time.time() - start_time) * 1000

        return self.track_event(
            event_type=EventType.TASK_END,
            duration_ms=duration_ms,
            data={"task_id": task_id, "success": success, "duration_ms": duration_ms},
            metadata=metadata or {},
        )

    # --- Session Management ---

    def end_session(self) -> InteractionEvent:
        """End the current session."""
        duration_ms = (time.time() - self._session_start) * 1000

        return self.track_event(
            event_type=EventType.SESSION_END,
            duration_ms=duration_ms,
            data={"session_duration_ms": duration_ms},
        )

    # --- Query Methods ---

    def get_events(
        self,
        event_type: Optional[EventType] = None,
        component: Optional[str] = None,
        view: Optional[str] = None,
        since: Optional[float] = None,
        limit: int = 100,
    ) -> list[InteractionEvent]:
        """Query events with optional filters."""
        with self._lock:
            events = list(self._events)

        if event_type:
            events = [e for e in events if e.event_type == event_type]
        if component:
            events = [e for e in events if e.component == component]
        if view:
            events = [e for e in events if e.view == view]
        if since:
            events = [e for e in events if e.timestamp >= since]

        return events[-limit:]

    def get_event_counts(self, since: Optional[float] = None) -> dict:
        """Get counts of events by type."""
        events = self.get_events(since=since, limit=10000)

        counts = defaultdict(int)
        for event in events:
            counts[event.event_type.value] += 1

        return dict(counts)

    def get_component_usage(self, since: Optional[float] = None) -> dict:
        """Get usage counts by component."""
        events = self.get_events(since=since, limit=10000)

        usage = defaultdict(int)
        for event in events:
            if event.component:
                usage[event.component] += 1

        return dict(sorted(usage.items(), key=lambda x: -x[1]))

    def get_view_durations(self, since: Optional[float] = None) -> dict:
        """Calculate time spent in each view."""
        events = self.get_events(since=since, limit=10000)

        view_times = defaultdict(list)
        current_view = None
        enter_time = None

        for event in events:
            if event.event_type == EventType.VIEW_ENTER:
                current_view = event.view
                enter_time = event.timestamp
            elif event.event_type == EventType.VIEW_EXIT and current_view:
                if enter_time:
                    duration = event.timestamp - enter_time
                    view_times[current_view].append(duration)
                current_view = None
                enter_time = None

        # Calculate averages
        return {
            view: {
                "total_time": sum(times),
                "avg_time": sum(times) / len(times) if times else 0,
                "visits": len(times),
            }
            for view, times in view_times.items()
        }

    def get_session_stats(self) -> dict:
        """Get statistics for the current session."""
        now = time.time()
        session_duration = now - self._session_start

        events = self.get_events(limit=10000)

        # Calculate idle time
        idle_events = [e for e in events if e.event_type in (EventType.IDLE_START, EventType.IDLE_END)]
        idle_time = 0
        idle_start = None
        for event in idle_events:
            if event.event_type == EventType.IDLE_START:
                idle_start = event.timestamp
            elif event.event_type == EventType.IDLE_END and idle_start:
                idle_time += event.timestamp - idle_start
                idle_start = None

        # Error count
        errors = len([e for e in events if e.event_type == EventType.ERROR_ENCOUNTER])

        return {
            "session_id": self._session_id,
            "duration_seconds": session_duration,
            "active_seconds": session_duration - idle_time,
            "idle_seconds": idle_time,
            "total_events": len(events),
            "error_count": errors,
            "event_counts": self.get_event_counts(),
            "top_components": dict(list(self.get_component_usage().items())[:10]),
        }

    def export_events(
        self,
        output_path: Optional[Path] = None,
        format: str = "json",
        **query_kwargs,
    ) -> Path:
        """Export events to a file for analysis."""
        events = self.get_events(**query_kwargs, limit=100000)
        output_path = output_path or (
            self.storage_path / f"events_export_{int(time.time())}.{format}"
        )

        if format == "json":
            data = [e.to_dict() for e in events]
            with open(output_path, "w") as f:
                json.dump(data, f, indent=2)
        elif format == "jsonl":
            with open(output_path, "w") as f:
                for event in events:
                    f.write(json.dumps(event.to_dict()) + "\n")

        logger.info(f"Exported {len(events)} events to {output_path}")
        return output_path
