# systems/kernel/tests/test_inter_kernel_bus.py
import pytest
from systems.kernel.inter_kernel_bus import (
    InterKernelBus,
    BusMessage,
    BusTopic
)


class TestInterKernelBus:
    """Tests for inter-kernel communication."""

    def test_bus_creation(self):
        """Can create inter-kernel bus."""
        bus = InterKernelBus()

        assert bus is not None

    @pytest.mark.asyncio
    async def test_publish_subscribe(self):
        """Kernels can publish and subscribe."""
        bus = InterKernelBus()

        received = []

        async def handler(message):
            received.append(message)

        # Subscribe
        bus.subscribe("kernel-1", BusTopic.EVENTS, handler)

        # Publish
        msg = BusMessage(
            from_kernel="kernel-2",
            topic=BusTopic.EVENTS,
            payload={"event": "test"}
        )
        await bus.publish(msg)

        assert len(received) == 1
        assert received[0].payload["event"] == "test"

    @pytest.mark.asyncio
    async def test_direct_message(self):
        """Can send direct message between kernels."""
        bus = InterKernelBus()

        received = []

        async def handler(message):
            received.append(message)

        bus.register("kernel-1", handler)

        # Send direct
        await bus.send_direct("kernel-2", "kernel-1", {"data": "hello"})

        assert len(received) == 1

    def test_bus_topics(self):
        """All bus topics are defined."""
        assert BusTopic.EVENTS.value == "events"
        assert BusTopic.METRICS.value == "metrics"
        assert BusTopic.CONTROL.value == "control"
        assert BusTopic.DATA.value == "data"


class TestBusMessage:
    """Tests for bus messages."""

    def test_message_creation(self):
        """Can create bus message."""
        msg = BusMessage(
            from_kernel="k1",
            topic=BusTopic.EVENTS,
            payload={"test": 123}
        )

        assert msg.from_kernel == "k1"
        assert msg.topic == BusTopic.EVENTS
        assert msg.payload["test"] == 123
