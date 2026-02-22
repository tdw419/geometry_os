# systems/kernel/inter_kernel_bus.py
"""
Inter-Kernel Communication Bus

Enables message passing between kernels in a cluster.
"""
import asyncio
from dataclasses import dataclass, field
from enum import Enum
from typing import Dict, List, Callable, Any, Optional
import time
import uuid
import logging

logger = logging.getLogger(__name__)


class BusTopic(Enum):
    """Topics for inter-kernel messages."""
    EVENTS = "events"       # Event notifications
    METRICS = "metrics"     # Performance metrics
    CONTROL = "control"     # Control commands
    DATA = "data"           # Data exchange


@dataclass
class BusMessage:
    """Message on the inter-kernel bus."""
    from_kernel: str
    topic: BusTopic
    payload: Dict[str, Any]
    message_id: str = field(default_factory=lambda: str(uuid.uuid4())[:8])
    timestamp: float = field(default_factory=time.time)
    to_kernel: Optional[str] = None


# Type for message handlers
MessageHandler = Callable[[BusMessage], Any]


class InterKernelBus:
    """
    Message bus for inter-kernel communication.

    Usage:
        bus = InterKernelBus()

        # Register kernel to receive messages
        bus.register("kernel-1", handler)

        # Subscribe to topics
        bus.subscribe("kernel-1", BusTopic.METRICS, metrics_handler)

        # Publish to topic
        await bus.publish(BusMessage(
            from_kernel="kernel-2",
            topic=BusTopic.EVENTS,
            payload={"event": "ready"}
        ))

        # Send direct message
        await bus.send_direct("kernel-2", "kernel-1", {"request": "data"})
    """

    def __init__(self):
        # Direct message handlers per kernel
        self._handlers: Dict[str, MessageHandler] = {}
        # Topic subscriptions: topic -> [(kernel_name, handler)]
        self._subscriptions: Dict[BusTopic, List[tuple]] = {
            topic: [] for topic in BusTopic
        }
        # Message queue for async processing
        self._queue: asyncio.Queue = asyncio.Queue()

    def register(self, kernel_name: str, handler: MessageHandler):
        """Register a kernel to receive direct messages."""
        self._handlers[kernel_name] = handler
        logger.info(f"Registered kernel '{kernel_name}' on bus")

    def unregister(self, kernel_name: str):
        """Unregister a kernel from bus."""
        self._handlers.pop(kernel_name, None)
        # Remove from all subscriptions
        for topic in self._subscriptions:
            self._subscriptions[topic] = [
                (k, h) for k, h in self._subscriptions[topic]
                if k != kernel_name
            ]

    def subscribe(
        self,
        kernel_name: str,
        topic: BusTopic,
        handler: MessageHandler
    ):
        """Subscribe a kernel to a topic."""
        self._subscriptions[topic].append((kernel_name, handler))
        logger.info(f"Kernel '{kernel_name}' subscribed to {topic.value}")

    def unsubscribe(self, kernel_name: str, topic: BusTopic):
        """Unsubscribe a kernel from a topic."""
        self._subscriptions[topic] = [
            (k, h) for k, h in self._subscriptions[topic]
            if k != kernel_name
        ]

    async def publish(self, message: BusMessage):
        """Publish a message to all subscribers of a topic."""
        subscribers = self._subscriptions.get(message.topic, [])

        for kernel_name, handler in subscribers:
            if kernel_name != message.from_kernel:  # Don't send to self
                try:
                    if asyncio.iscoroutinefunction(handler):
                        await handler(message)
                    else:
                        handler(message)
                except Exception as e:
                    logger.error(f"Error delivering to {kernel_name}: {e}")

    async def send_direct(
        self,
        from_kernel: str,
        to_kernel: str,
        payload: Dict[str, Any]
    ):
        """Send a direct message to a specific kernel."""
        if to_kernel not in self._handlers:
            logger.warning(f"Kernel '{to_kernel}' not registered")
            return

        message = BusMessage(
            from_kernel=from_kernel,
            to_kernel=to_kernel,
            topic=BusTopic.DATA,
            payload=payload
        )

        handler = self._handlers[to_kernel]
        try:
            if asyncio.iscoroutinefunction(handler):
                await handler(message)
            else:
                handler(message)
        except Exception as e:
            logger.error(f"Error delivering direct message: {e}")

    def get_stats(self) -> Dict[str, Any]:
        """Get bus statistics."""
        return {
            "registered_kernels": len(self._handlers),
            "subscriptions": {
                topic.value: len(subs)
                for topic, subs in self._subscriptions.items()
            }
        }
