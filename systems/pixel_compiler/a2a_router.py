#!/usr/bin/env python3
"""
A2A Router - Agent-to-Agent Message Routing Backend
WebMCP Phase D: Agent2Agent Protocol

This module implements a WebSocket-based message router for horizontal
agent-to-agent communication in Geometry OS.

Features:
- Agent registry (register, discover, heartbeat)
- Message routing (direct, broadcast, topic-based)
- Coordination primitives (distributed lock, barrier)

Port: 8766 (WebSocket endpoint: ws://localhost:8766/a2a)
"""

import asyncio
import json
import logging
import time
import uuid
from collections import defaultdict
from dataclasses import dataclass, asdict
from enum import Enum
from typing import Dict, List, Optional, Set, Any
import websockets
from websockets.server import WebSocketServerProtocol

logger = logging.getLogger(__name__)


class MessageType(Enum):
    """A2A message type categories"""
    # Agent lifecycle
    REGISTER = "register"
    UNREGISTER = "unregister"
    HEARTBEAT = "heartbeat"
    DISCOVER = "discover"
    
    # Messaging
    DIRECT = "direct"
    BROADCAST = "broadcast"
    
    # Coordination
    LOCK_REQUEST = "lock_request"
    LOCK_RELEASE = "lock_release"
    BARRIER_ENTER = "barrier_enter"
    BARRIER_RELEASE = "barrier_release"
    
    # Response
    ACK = "ack"
    ERROR = "error"


class AgentStatus(Enum):
    """Agent status enum"""
    ONLINE = "online"
    BUSY = "busy"
    OFFLINE = "offline"


@dataclass
class AgentInfo:
    """Information about a registered agent"""
    agent_id: str
    agent_type: str
    capabilities: List[str]
    region: Optional[Dict[str, int]]  # {x, y, width, height}
    status: AgentStatus
    last_heartbeat: float
    topics: Set[str]
    
    def to_dict(self) -> Dict[str, Any]:
        return {
            "agent_id": self.agent_id,
            "agent_type": self.agent_type,
            "capabilities": self.capabilities,
            "region": self.region,
            "status": self.status.value,
            "last_heartbeat": self.last_heartbeat,
            "topics": list(self.topics)
        }


@dataclass
class Lock:
    """Distributed lock state"""
    lock_id: str
    holder_id: Optional[str]
    acquired_at: Optional[float]
    expires_at: Optional[float]
    waiting_queue: List[str]  # Agent IDs waiting for lock


@dataclass
class Barrier:
    """Barrier synchronization state"""
    barrier_id: str
    expected_count: int
    arrived_agents: Set[str]
    created_at: float


class A2ARouter:
    """
    Agent-to-Agent message routing hub
    
    Manages agent connections, message routing, and coordination primitives.
    """
    
    def __init__(self, host: str = "localhost", port: int = 8766):
        self.host = host
        self.port = port
        
        # Agent registry
        self.agents: Dict[str, AgentInfo] = {}
        self.connections: Dict[str, WebSocketServerProtocol] = {}
        
        # Topic subscriptions: topic -> set of agent_ids
        self.topics: Dict[str, Set[str]] = defaultdict(set)
        
        # Coordination primitives
        self.locks: Dict[str, Lock] = {}
        self.barriers: Dict[str, Barrier] = {}
        
        # Heartbeat timeout (seconds)
        self.heartbeat_timeout = 30.0
        
        # Server reference
        self.server = None
        self.running = False
        
        logger.info(f"A2A Router initialized on {host}:{port}")
    
    async def start(self):
        """Start the A2A router WebSocket server"""
        self.running = True
        
        # Start background tasks
        asyncio.create_task(self._heartbeat_monitor())
        
        # Start WebSocket server
        self.server = await websockets.serve(
            self._handle_connection,
            self.host,
            self.port,
            subprotocols=["a2a"]
        )
        
        logger.info(f"A2A Router started on ws://{self.host}:{self.port}")
    
    async def stop(self):
        """Stop the A2A router"""
        self.running = False
        
        if self.server:
            self.server.close()
            await self.server.wait_closed()
        
        logger.info("A2A Router stopped")
    
    # === Connection Handling ===
    
    async def _handle_connection(self, websocket: WebSocketServerProtocol, path: str):
        """Handle incoming WebSocket connection"""
        agent_id = None
        
        try:
            async for message in websocket:
                try:
                    data = json.loads(message)
                    response = await self._handle_message(data, websocket)
                    
                    if response:
                        await websocket.send(json.dumps(response))
                        
                        # Track agent connection after registration
                        if data.get("type") == "register" and response.get("type") == "ack":
                            agent_id = data.get("agent_id")
                            self.connections[agent_id] = websocket
                            
                except json.JSONDecodeError as e:
                    await websocket.send(json.dumps({
                        "type": "error",
                        "error": "invalid_json",
                        "message": str(e)
                    }))
                    
        except websockets.exceptions.ConnectionClosed:
            pass
        finally:
            if agent_id:
                await self._handle_disconnect(agent_id)
    
    async def _handle_disconnect(self, agent_id: str):
        """Handle agent disconnection"""
        if agent_id in self.agents:
            self.agents[agent_id].status = AgentStatus.OFFLINE
            logger.info(f"Agent {agent_id} disconnected")
        
        # Clean up connections
        self.connections.pop(agent_id, None)
        
        # Release any locks held by this agent
        for lock_id, lock in list(self.locks.items()):
            if lock.holder_id == agent_id:
                lock.holder_id = None
                lock.acquired_at = None
                lock.expires_at = None
                # Notify next in queue
                if lock.waiting_queue:
                    next_agent = lock.waiting_queue.pop(0)
                    await self._grant_lock(lock_id, next_agent)
    
    async def _handle_message(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Optional[Dict[str, Any]]:
        """Route incoming message to appropriate handler"""
        msg_type = data.get("type")
        
        handlers = {
            MessageType.REGISTER.value: self._handle_register,
            MessageType.UNREGISTER.value: self._handle_unregister,
            MessageType.HEARTBEAT.value: self._handle_heartbeat,
            MessageType.DISCOVER.value: self._handle_discover,
            MessageType.DIRECT.value: self._handle_direct,
            MessageType.BROADCAST.value: self._handle_broadcast,
            MessageType.LOCK_REQUEST.value: self._handle_lock_request,
            MessageType.LOCK_RELEASE.value: self._handle_lock_release,
            MessageType.BARRIER_ENTER.value: self._handle_barrier_enter,
            MessageType.BARRIER_RELEASE.value: self._handle_barrier_release,
        }
        
        handler = handlers.get(msg_type)
        if handler:
            return await handler(data, websocket)
        
        return {
            "type": "error",
            "error": "unknown_message_type",
            "message": f"Unknown message type: {msg_type}"
        }
    
    # === Agent Registry ===
    
    async def _handle_register(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        """Register a new agent"""
        agent_id = data.get("agent_id", f"agent-{uuid.uuid4().hex[:8]}")
        agent_type = data.get("agent_type", "generic")
        capabilities = data.get("capabilities", [])
        region = data.get("region")
        subscribe_topics = data.get("topics", [])
        
        # Create agent info
        agent_info = AgentInfo(
            agent_id=agent_id,
            agent_type=agent_type,
            capabilities=capabilities,
            region=region,
            status=AgentStatus.ONLINE,
            last_heartbeat=time.time(),
            topics=set(subscribe_topics)
        )
        
        self.agents[agent_id] = agent_info
        self.connections[agent_id] = websocket
        
        # Subscribe to topics
        for topic in subscribe_topics:
            self.topics[topic].add(agent_id)
        
        logger.info(f"Agent registered: {agent_id} (type={agent_type})")
        
        return {
            "type": "ack",
            "agent_id": agent_id,
            "status": "registered",
            "timestamp": time.time()
        }
    
    async def _handle_unregister(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        """Unregister an agent"""
        agent_id = data.get("agent_id")
        
        if agent_id in self.agents:
            # Unsubscribe from topics
            for topic in self.agents[agent_id].topics:
                self.topics[topic].discard(agent_id)
            
            del self.agents[agent_id]
            self.connections.pop(agent_id, None)
            
            logger.info(f"Agent unregistered: {agent_id}")
            
            return {
                "type": "ack",
                "agent_id": agent_id,
                "status": "unregistered"
            }
        
        return {
            "type": "error",
            "error": "agent_not_found",
            "message": f"Agent {agent_id} not found"
        }
    
    async def _handle_heartbeat(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        """Handle heartbeat from agent"""
        agent_id = data.get("agent_id")
        status = data.get("status", "online")
        
        if agent_id in self.agents:
            self.agents[agent_id].last_heartbeat = time.time()
            self.agents[agent_id].status = AgentStatus(status)
            
            return {
                "type": "ack",
                "agent_id": agent_id,
                "timestamp": time.time()
            }
        
        return {
            "type": "error",
            "error": "agent_not_found"
        }
    
    async def _handle_discover(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        """Discover agents matching criteria"""
        agent_type = data.get("agent_type")
        capability = data.get("capability")
        region_overlap = data.get("region_overlap")
        
        matching_agents = []
        
        for agent in self.agents.values():
            if agent.status == AgentStatus.OFFLINE:
                continue
            
            # Filter by type
            if agent_type and agent.agent_type != agent_type:
                continue
            
            # Filter by capability
            if capability and capability not in agent.capabilities:
                continue
            
            # Filter by region overlap
            if region_overlap and agent.region:
                if not self._regions_overlap(region_overlap, agent.region):
                    continue
            
            matching_agents.append(agent.to_dict())
        
        return {
            "type": "ack",
            "agents": matching_agents,
            "count": len(matching_agents)
        }
    
    def _regions_overlap(self, r1: Dict[str, int], r2: Dict[str, int]) -> bool:
        """Check if two regions overlap"""
        return not (
            r1["x"] + r1["width"] < r2["x"] or
            r2["x"] + r2["width"] < r1["x"] or
            r1["y"] + r1["height"] < r2["y"] or
            r2["y"] + r2["height"] < r1["y"]
        )
    
    # === Message Routing ===
    
    async def _handle_direct(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        """Route direct message to another agent"""
        from_id = data.get("from_agent")
        to_id = data.get("to_agent")
        message_type = data.get("message_type", "message")
        payload = data.get("payload", {})
        correlation_id = data.get("correlation_id")
        
        if to_id not in self.agents:
            return {
                "type": "error",
                "error": "agent_not_found",
                "message": f"Target agent {to_id} not found"
            }
        
        target_ws = self.connections.get(to_id)
        if not target_ws:
            return {
                "type": "error",
                "error": "agent_offline",
                "message": f"Target agent {to_id} is offline"
            }
        
        # Forward message
        forward_msg = {
            "type": "direct",
            "from_agent": from_id,
            "message_type": message_type,
            "payload": payload,
            "correlation_id": correlation_id,
            "timestamp": time.time()
        }
        
        await target_ws.send(json.dumps(forward_msg))
        
        return {
            "type": "ack",
            "delivered": True,
            "target_status": self.agents[to_id].status.value
        }
    
    async def _handle_broadcast(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        """Broadcast message to agents of a specific type or all"""
        from_id = data.get("from_agent")
        agent_type = data.get("agent_type", "all")
        message_type = data.get("message_type", "broadcast")
        payload = data.get("payload", {})
        exclude_self = data.get("exclude_self", True)
        
        broadcast_msg = {
            "type": "broadcast",
            "from_agent": from_id,
            "message_type": message_type,
            "payload": payload,
            "timestamp": time.time()
        }
        
        recipients = 0
        delivered = 0
        
        for agent_id, agent in self.agents.items():
            # Skip self if requested
            if exclude_self and agent_id == from_id:
                continue
            
            # Filter by agent type
            if agent_type != "all" and agent.agent_type != agent_type:
                continue
            
            if agent.status == AgentStatus.OFFLINE:
                continue
            
            recipients += 1
            target_ws = self.connections.get(agent_id)
            
            if target_ws:
                try:
                    await target_ws.send(json.dumps(broadcast_msg))
                    delivered += 1
                except Exception:
                    pass
        
        return {
            "type": "ack",
            "recipients": recipients,
            "delivered_count": delivered
        }
    
    # === Coordination Primitives ===
    
    async def _handle_lock_request(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        """Handle distributed lock acquisition request"""
        agent_id = data.get("agent_id")
        lock_id = data.get("lock_id")
        timeout = data.get("timeout", 30)
        
        if lock_id not in self.locks:
            self.locks[lock_id] = Lock(
                lock_id=lock_id,
                holder_id=None,
                acquired_at=None,
                expires_at=None,
                waiting_queue=[]
            )
        
        lock = self.locks[lock_id]
        
        # Lock is free
        if lock.holder_id is None or (lock.expires_at and time.time() > lock.expires_at):
            await self._grant_lock(lock_id, agent_id, timeout)
            return {
                "type": "ack",
                "lock_id": lock_id,
                "granted": True,
                "expires_at": lock.expires_at
            }
        
        # Lock is held by this agent (reentrant)
        if lock.holder_id == agent_id:
            lock.expires_at = time.time() + timeout
            return {
                "type": "ack",
                "lock_id": lock_id,
                "granted": True,
                "expires_at": lock.expires_at
            }
        
        # Lock is held by another agent, add to queue
        lock.waiting_queue.append(agent_id)
        
        return {
            "type": "ack",
            "lock_id": lock_id,
            "granted": False,
            "queue_position": len(lock.waiting_queue)
        }
    
    async def _grant_lock(self, lock_id: str, agent_id: str, timeout: float = 30):
        """Grant lock to an agent"""
        lock = self.locks[lock_id]
        lock.holder_id = agent_id
        lock.acquired_at = time.time()
        lock.expires_at = time.time() + timeout
        
        # Notify agent
        target_ws = self.connections.get(agent_id)
        if target_ws:
            await target_ws.send(json.dumps({
                "type": "lock_granted",
                "lock_id": lock_id,
                "expires_at": lock.expires_at
            }))
    
    async def _handle_lock_release(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        """Handle lock release"""
        agent_id = data.get("agent_id")
        lock_id = data.get("lock_id")
        
        if lock_id not in self.locks:
            return {
                "type": "error",
                "error": "lock_not_found"
            }
        
        lock = self.locks[lock_id]
        
        if lock.holder_id != agent_id:
            return {
                "type": "error",
                "error": "not_lock_holder"
            }
        
        lock.holder_id = None
        lock.acquired_at = None
        lock.expires_at = None
        
        # Grant to next in queue
        if lock.waiting_queue:
            next_agent = lock.waiting_queue.pop(0)
            await self._grant_lock(lock_id, next_agent)
        
        return {
            "type": "ack",
            "lock_id": lock_id,
            "released": True
        }
    
    async def _handle_barrier_enter(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        """Handle barrier entry"""
        agent_id = data.get("agent_id")
        barrier_id = data.get("barrier_id")
        expected_count = data.get("expected_count", 2)
        
        if barrier_id not in self.barriers:
            self.barriers[barrier_id] = Barrier(
                barrier_id=barrier_id,
                expected_count=expected_count,
                arrived_agents=set(),
                created_at=time.time()
            )
        
        barrier = self.barriers[barrier_id]
        barrier.arrived_agents.add(agent_id)
        
        # Check if all agents have arrived
        if len(barrier.arrived_agents) >= barrier.expected_count:
            # Release all waiting agents
            await self._release_barrier(barrier_id)
            return {
                "type": "ack",
                "barrier_id": barrier_id,
                "released": True,
                "arrived_count": len(barrier.arrived_agents)
            }
        
        return {
            "type": "ack",
            "barrier_id": barrier_id,
            "released": False,
            "arrived_count": len(barrier.arrived_agents),
            "expected_count": barrier.expected_count
        }
    
    async def _release_barrier(self, barrier_id: str):
        """Release all agents waiting at barrier"""
        barrier = self.barriers[barrier_id]
        
        release_msg = {
            "type": "barrier_release",
            "barrier_id": barrier_id,
            "timestamp": time.time()
        }
        
        for agent_id in barrier.arrived_agents:
            target_ws = self.connections.get(agent_id)
            if target_ws:
                try:
                    await target_ws.send(json.dumps(release_msg))
                except Exception:
                    pass
        
        # Clean up barrier
        del self.barriers[barrier_id]
    
    # === Background Tasks ===
    
    async def _heartbeat_monitor(self):
        """Monitor agent heartbeats and mark stale agents offline"""
        while self.running:
            try:
                current_time = time.time()
                
                for agent_id, agent in list(self.agents.items()):
                    if agent.status == AgentStatus.OFFLINE:
                        continue
                    
                    time_since_heartbeat = current_time - agent.last_heartbeat
                    
                    if time_since_heartbeat > self.heartbeat_timeout:
                        agent.status = AgentStatus.OFFLINE
                        logger.warning(f"Agent {agent_id} marked offline (no heartbeat for {time_since_heartbeat:.1f}s)")
                
                await asyncio.sleep(10.0)
                
            except Exception as e:
                logger.error(f"Error in heartbeat monitor: {e}")
                await asyncio.sleep(1.0)
    
    # === Utility Methods ===
    
    def get_stats(self) -> Dict[str, Any]:
        """Get router statistics"""
        return {
            "agents_online": sum(1 for a in self.agents.values() if a.status == AgentStatus.ONLINE),
            "agents_total": len(self.agents),
            "active_locks": sum(1 for l in self.locks.values() if l.holder_id is not None),
            "active_barriers": len(self.barriers),
            "topics": {t: list(a) for t, a in self.topics.items() if a}
        }


async def main():
    """Run the A2A Router as a standalone server"""
    import argparse
    
    parser = argparse.ArgumentParser(description="A2A Router - Agent-to-Agent Message Router")
    parser.add_argument("--host", default="localhost", help="Host to bind to")
    parser.add_argument("--port", type=int, default=8766, help="Port to listen on")
    parser.add_argument("--log-level", default="INFO", help="Logging level")
    args = parser.parse_args()
    
    logging.basicConfig(
        level=getattr(logging, args.log_level.upper()),
        format="%(asctime)s - %(name)s - %(levelname)s - %(message)s"
    )
    
    router = A2ARouter(host=args.host, port=args.port)
    
    try:
        await router.start()
        
        # Keep running until interrupted
        while True:
            await asyncio.sleep(1)
            
    except KeyboardInterrupt:
        logger.info("Shutting down...")
    finally:
        await router.stop()


if __name__ == "__main__":
    asyncio.run(main())
