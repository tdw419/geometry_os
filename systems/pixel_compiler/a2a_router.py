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
from dataclasses import dataclass, asdict, field
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
class AgentConnection:
    """Connection information for a registered agent"""
    agent_id: str
    connection: Any  # WebSocket connection or AsyncMock
    agent_type: str
    region: Optional[Dict[str, int]] = None  # {x, y, width, height}
    capabilities: List[str] = None
    status: AgentStatus = AgentStatus.ONLINE
    last_heartbeat: float = None

    def __post_init__(self):
        if self.capabilities is None:
            self.capabilities = []
        if self.last_heartbeat is None:
            self.last_heartbeat = time.time()

    def to_dict(self) -> Dict[str, Any]:
        return {
            "agent_id": self.agent_id,
            "agent_type": self.agent_type,
            "region": self.region,
            "capabilities": self.capabilities,
            "status": self.status.value if isinstance(self.status, AgentStatus) else self.status,
            "last_heartbeat": self.last_heartbeat
        }


@dataclass
class Subscription:
    """Event subscription for an agent"""
    agent_id: str
    event_type: str
    filter: Optional[Dict[str, Any]] = None


@dataclass
class A2AMessage:
    """A2A protocol message"""
    message_id: str
    timestamp: float
    from_agent: str
    to_agent: Optional[str]
    message_type: str
    priority: int = 0
    content: Dict[str, Any] = None
    metadata: Dict[str, Any] = None
    correlation_id: Optional[str] = None
    expires_at: Optional[float] = None

    def __post_init__(self):
        if self.content is None:
            self.content = {}
        if self.metadata is None:
            self.metadata = {}
        if self.message_id is None:
            self.message_id = str(uuid.uuid4())
        if self.timestamp is None:
            self.timestamp = time.time()


@dataclass
class AgentInfo:
    """Information about a registered agent (legacy compatibility)"""
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


@dataclass
class Task:
    """Task delegation state"""
    task_id: str
    from_agent: str
    to_agent: str
    task_type: str
    params: Dict[str, Any]
    status: str  # assigned, in_progress, completed, failed
    progress: float  # 0.0 to 1.0
    result: Optional[Dict[str, Any]]
    error: Optional[str]
    created_at: float
    updated_at: float
    expires_at: Optional[float]


@dataclass
class SessionAgent:
    """Agent participating in a build session."""
    agent_id: str
    session_id: str
    name: str
    role: str  # architect, builder, tester, observer
    capabilities: List[str]
    color: str
    joined_at: float
    regions_claimed: List[str] = field(default_factory=list)
    tasks_completed: int = 0
    status: str = "active"


@dataclass
class RegionClaim:
    """A claimed region in a build session."""
    claim_id: str
    session_id: str
    agent_id: str
    bounds: Dict[str, int]  # {x, y, width, height}
    purpose: str
    claimed_at: float
    expires_at: float
    exclusive: bool = True


@dataclass
class SessionTask:
    """Task within a collaborative build session."""
    task_id: str
    session_id: str
    task_type: str  # build, test, review, evolve, assemble, migrate
    description: str
    assigned_to: Optional[str]
    status: str  # pending, in_progress, completed, failed, blocked, cancelled
    priority: str  # low, medium, high, critical
    created_by: str
    created_at: float
    region: Optional[Dict[str, int]] = None
    dependencies: List[str] = field(default_factory=list)
    deadline: Optional[float] = None
    result: Optional[Dict[str, Any]] = None
    artifacts: List[Dict[str, str]] = field(default_factory=list)
    message: Optional[str] = None
    started_at: Optional[float] = None
    completed_at: Optional[float] = None


@dataclass
class BuildSession:
    """Collaborative build session state."""
    session_id: str
    session_name: str
    created_at: float
    max_agents: int = 10
    grid_size: int = 1000
    coordination_mode: str = "coordinated"
    invite_token: Optional[str] = None
    config: Dict[str, Any] = field(default_factory=dict)
    agents: Dict[str, SessionAgent] = field(default_factory=dict)
    regions: Dict[str, RegionClaim] = field(default_factory=dict)
    tasks: Dict[str, SessionTask] = field(default_factory=dict)
    status: str = "active"


class A2ARouter:
    """
    Agent-to-Agent message routing hub

    Manages agent connections, message routing, and coordination primitives.
    """

    def __init__(self, host: str = "localhost", port: int = 8766):
        self.host = host
        self.port = port

        # Agent registry (new interface)
        self.peer_registry: Dict[str, AgentConnection] = {}
        self.subscriptions: Dict[str, List[Subscription]] = defaultdict(list)

        # Legacy agent registry (for WebSocket compatibility)
        self.agents: Dict[str, AgentInfo] = {}
        self.connections: Dict[str, WebSocketServerProtocol] = {}

        # Topic subscriptions: topic -> set of agent_ids
        self.topics: Dict[str, Set[str]] = defaultdict(set)

        # Coordination primitives
        self.locks: Dict[str, Lock] = {}
        self.barriers: Dict[str, Barrier] = {}

        # Task delegation registry
        self.tasks: Dict[str, Task] = {}

        # Collaborative build sessions
        self.sessions: Dict[str, BuildSession] = {}

        # Heartbeat timeout (seconds)
        self.heartbeat_timeout = 30.0

        # Server reference
        self.server = None
        self.running = False

        logger.info(f"A2A Router initialized on {host}:{port}")

    # === New Interface Methods (TDD) ===

    async def register_agent(self, agent_id: str, connection: Any, metadata: Dict[str, Any]) -> None:
        """
        Register an agent with the router.

        Args:
            agent_id: Unique agent identifier
            connection: Connection object (WebSocket or AsyncMock)
            metadata: Agent metadata including agent_type, region, capabilities
        """
        agent_conn = AgentConnection(
            agent_id=agent_id,
            connection=connection,
            agent_type=metadata.get("agent_type", "generic"),
            region=metadata.get("region"),
            capabilities=metadata.get("capabilities", []),
            status=AgentStatus.ONLINE,
            last_heartbeat=time.time()
        )

        self.peer_registry[agent_id] = agent_conn

        # Notify subscribers of new agent registration
        await self._notify_event("agent_registered", {
            "agent_id": agent_id,
            "agent_type": agent_conn.agent_type,
            "region": agent_conn.region
        })

        logger.info(f"Agent registered: {agent_id} (type={agent_conn.agent_type})")

    async def unregister_agent(self, agent_id: str) -> None:
        """
        Unregister an agent from the router.

        Args:
            agent_id: Agent identifier to remove
        """
        if agent_id in self.peer_registry:
            del self.peer_registry[agent_id]

            # Notify subscribers of agent unregistration
            await self._notify_event("agent_unregistered", {
                "agent_id": agent_id
            })

            logger.info(f"Agent unregistered: {agent_id}")

    async def discover_peers(
        self,
        agent_type: Optional[str] = None,
        region_overlaps: Optional[Dict[str, int]] = None,
        capability: Optional[str] = None
    ) -> List[Dict[str, Any]]:
        """
        Discover peers matching the given criteria.

        Args:
            agent_type: Filter by agent type
            region_overlaps: Filter by region overlap
            capability: Filter by capability

        Returns:
            List of matching agent metadata dictionaries
        """
        matching = []

        for agent_id, agent_conn in self.peer_registry.items():
            if agent_conn.status == AgentStatus.OFFLINE:
                continue

            # Filter by type
            if agent_type and agent_conn.agent_type != agent_type:
                continue

            # Filter by capability
            if capability and capability not in agent_conn.capabilities:
                continue

            # Filter by region overlap
            if region_overlaps and agent_conn.region:
                if not self._regions_overlap(region_overlaps, agent_conn.region):
                    continue

            matching.append(agent_conn.to_dict())

        return matching

    async def route_message(self, from_id: str, to_id: str, message: A2AMessage) -> bool:
        """
        Route a direct message from one agent to another.

        Args:
            from_id: Sender agent ID
            to_id: Recipient agent ID
            message: A2AMessage to route

        Returns:
            True if delivered, False otherwise
        """
        if to_id not in self.peer_registry:
            return False

        target = self.peer_registry[to_id]
        if target.status == AgentStatus.OFFLINE:
            return False

        # Send via connection if available
        if target.connection:
            try:
                if hasattr(target.connection, 'send'):
                    await target.connection.send(json.dumps({
                        "type": "direct",
                        "from_agent": from_id,
                        "message": message.content,
                        "message_type": message.message_type,
                        "correlation_id": message.correlation_id,
                        "timestamp": message.timestamp
                    }))
            except Exception as e:
                logger.error(f"Failed to route message to {to_id}: {e}")
                return False

        return True

    async def broadcast(
        self,
        from_id: str,
        agent_type: Optional[str] = None,
        message: Optional[A2AMessage] = None,
        exclude_self: bool = True
    ) -> int:
        """
        Broadcast a message to agents of a specific type.

        Args:
            from_id: Sender agent ID
            agent_type: Target agent type (None = all types)
            message: A2AMessage to broadcast
            exclude_self: Whether to exclude the sender

        Returns:
            Number of recipients the message was delivered to
        """
        delivered = 0

        for agent_id, agent_conn in self.peer_registry.items():
            if exclude_self and agent_id == from_id:
                continue

            if agent_type and agent_conn.agent_type != agent_type:
                continue

            if agent_conn.status == AgentStatus.OFFLINE:
                continue

            if agent_conn.connection and hasattr(agent_conn.connection, 'send'):
                try:
                    await agent_conn.connection.send(json.dumps({
                        "type": "broadcast",
                        "from_agent": from_id,
                        "message": message.content if message else {},
                        "message_type": message.message_type if message else "broadcast",
                        "timestamp": time.time()
                    }))
                    delivered += 1
                except Exception:
                    pass

        return delivered

    async def subscribe(self, agent_id: str, event_type: str, filter: Optional[Dict[str, Any]] = None) -> None:
        """
        Subscribe an agent to events of a specific type.

        Args:
            agent_id: Agent to subscribe
            event_type: Type of events to subscribe to
            filter: Optional filter criteria
        """
        subscription = Subscription(
            agent_id=agent_id,
            event_type=event_type,
            filter=filter
        )
        self.subscriptions[event_type].append(subscription)
        logger.info(f"Agent {agent_id} subscribed to {event_type} events")

    async def _notify_event(self, event_type: str, data: Dict[str, Any]) -> None:
        """
        Notify all subscribers of an event.

        Args:
            event_type: Type of event
            data: Event data
        """
        for subscription in self.subscriptions[event_type]:
            agent_conn = self.peer_registry.get(subscription.agent_id)
            if agent_conn and agent_conn.connection and hasattr(agent_conn.connection, 'send'):
                try:
                    await agent_conn.connection.send(json.dumps({
                        "type": "event",
                        "event_type": event_type,
                        "data": data,
                        "timestamp": time.time()
                    }))
                except Exception:
                    pass
    
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
            "assign_task": self._handle_assign_task,
            "report_progress": self._handle_report_progress,
            "complete_task": self._handle_complete_task,
            "get_task": self._handle_get_task,
            "list_tasks": self._handle_list_tasks,
            "create_session": self._handle_create_session,
            "join_session": self._handle_join_session,
            "leave_session": self._handle_leave_session,
            "get_session_state": self._handle_get_session_state,
            "claim_region": self._handle_claim_region,
            "release_region": self._handle_release_region,
            "query_region": self._handle_query_region,
            "delegate_task": self._handle_delegate_task,
            "accept_task": self._handle_accept_task,
            "report_task": self._handle_report_task,
            "get_task_queue": self._handle_get_task_queue,
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
    
    # === Task Delegation ===

    async def assign_task(
        self,
        from_agent: str,
        to_agent: str,
        task_type: str,
        params: Dict[str, Any],
        timeout: float = 300.0
    ) -> Dict[str, Any]:
        """Assign a task to another agent."""
        task_id = str(uuid.uuid4())
        now = time.time()

        task = Task(
            task_id=task_id,
            from_agent=from_agent,
            to_agent=to_agent,
            task_type=task_type,
            params=params,
            status="assigned",
            progress=0.0,
            result=None,
            error=None,
            created_at=now,
            updated_at=now,
            expires_at=now + timeout
        )

        self.tasks[task_id] = task

        # Notify target agent
        if to_agent in self.connections:
            try:
                await self.connections[to_agent].send(json.dumps({
                    "type": "task_assigned",
                    "task_id": task_id,
                    "from_agent": from_agent,
                    "task_type": task_type,
                    "params": params,
                    "expires_at": task.expires_at
                }))
            except Exception as e:
                logger.error(f"Failed to notify agent {to_agent}: {e}")
                task.status = "failed"
                task.error = f"Failed to deliver: {e}"

        logger.info(f"Task {task_id} assigned from {from_agent} to {to_agent}")

        return {
            "task_id": task_id,
            "status": task.status,
            "assigned_to": to_agent
        }

    async def report_progress(
        self,
        task_id: str,
        agent_id: str,
        progress: float,
        status: Optional[str] = None,
        message: Optional[str] = None
    ) -> Dict[str, Any]:
        """Report progress on a task."""
        if task_id not in self.tasks:
            return {"error": "task_not_found", "task_id": task_id}

        task = self.tasks[task_id]

        if task.to_agent != agent_id:
            return {"error": "not_task_assignee", "task_id": task_id}

        task.progress = max(0.0, min(1.0, progress))
        task.updated_at = time.time()

        if status:
            task.status = status

        # Notify task owner
        if task.from_agent in self.connections:
            try:
                await self.connections[task.from_agent].send(json.dumps({
                    "type": "task_progress",
                    "task_id": task_id,
                    "progress": task.progress,
                    "status": task.status,
                    "message": message
                }))
            except Exception:
                pass

        return {
            "task_id": task_id,
            "progress": task.progress,
            "status": task.status
        }

    async def complete_task(
        self,
        task_id: str,
        agent_id: str,
        result: Dict[str, Any],
        success: bool = True
    ) -> Dict[str, Any]:
        """Mark a task as completed."""
        if task_id not in self.tasks:
            return {"error": "task_not_found", "task_id": task_id}

        task = self.tasks[task_id]

        if task.to_agent != agent_id:
            return {"error": "not_task_assignee", "task_id": task_id}

        task.status = "completed" if success else "failed"
        task.result = result
        task.progress = 1.0
        task.updated_at = time.time()
        task.error = None if success else result.get("error")

        # Notify task owner
        if task.from_agent in self.connections:
            try:
                await self.connections[task.from_agent].send(json.dumps({
                    "type": "task_completed",
                    "task_id": task_id,
                    "success": success,
                    "result": result
                }))
            except Exception:
                pass

        logger.info(f"Task {task_id} completed by {agent_id}: {task.status}")

        return {
            "task_id": task_id,
            "status": task.status,
            "success": success
        }

    async def get_task(self, task_id: str) -> Optional[Dict[str, Any]]:
        """Get task status and result."""
        if task_id not in self.tasks:
            return None

        task = self.tasks[task_id]
        return {
            "task_id": task.task_id,
            "from_agent": task.from_agent,
            "to_agent": task.to_agent,
            "task_type": task.task_type,
            "status": task.status,
            "progress": task.progress,
            "result": task.result,
            "error": task.error,
            "created_at": task.created_at,
            "updated_at": task.updated_at
        }

    async def list_tasks(
        self,
        agent_id: Optional[str] = None,
        status: Optional[str] = None
    ) -> List[Dict[str, Any]]:
        """List tasks, optionally filtered."""
        results = []
        for task in self.tasks.values():
            if agent_id and task.to_agent != agent_id and task.from_agent != agent_id:
                continue
            if status and task.status != status:
                continue
            results.append({
                "task_id": task.task_id,
                "from_agent": task.from_agent,
                "to_agent": task.to_agent,
                "task_type": task.task_type,
                "status": task.status,
                "progress": task.progress
            })
        return results

    # === Task Delegation Handlers ===

    async def _handle_assign_task(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        return await self.assign_task(
            from_agent=data.get("from_agent"),
            to_agent=data.get("to_agent"),
            task_type=data.get("task_type"),
            params=data.get("params", {}),
            timeout=data.get("timeout", 300)
        )

    async def _handle_report_progress(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        return await self.report_progress(
            task_id=data.get("task_id"),
            agent_id=data.get("agent_id"),
            progress=data.get("progress", 0),
            status=data.get("status"),
            message=data.get("message")
        )

    async def _handle_complete_task(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        return await self.complete_task(
            task_id=data.get("task_id"),
            agent_id=data.get("agent_id"),
            result=data.get("result", {}),
            success=data.get("success", True)
        )

    async def _handle_get_task(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        task = await self.get_task(data.get("task_id"))
        return task or {"error": "task_not_found"}

    async def _handle_list_tasks(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        tasks = await self.list_tasks(
            agent_id=data.get("agent_id"),
            status=data.get("status")
        )
        return {"tasks": tasks, "count": len(tasks)}

    async def _handle_create_session(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        return await self.create_session(
            session_name=data.get("session_name"),
            max_agents=data.get("max_agents", 10),
            grid_size=data.get("grid_size", 1000),
            coordination_mode=data.get("coordination_mode", "coordinated"),
            config=data.get("config")
        )

    async def _handle_join_session(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        return await self.join_session(
            session_id=data.get("session_id"),
            agent_name=data.get("agent_name"),
            role=data.get("role", "builder"),
            capabilities=data.get("capabilities"),
            invite_token=data.get("invite_token"),
            websocket=websocket
        )

    async def _handle_leave_session(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        return await self.leave_session(
            session_id=data.get("session_id"),
            agent_id=data.get("agent_id"),
            handoff_to=data.get("handoff_to")
        )

    async def _handle_get_session_state(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        return await self.get_session_state(
            session_id=data.get("session_id"),
            include=data.get("include")
        )

    async def _handle_claim_region(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        return await self.claim_region(
            session_id=data.get("session_id"),
            agent_id=data.get("agent_id"),
            region=data.get("region", {}),
            purpose=data.get("purpose", ""),
            exclusive=data.get("exclusive", True),
            timeout=data.get("timeout", 300)
        )

    async def _handle_release_region(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        return await self.release_region(
            session_id=data.get("session_id"),
            claim_id=data.get("claim_id"),
            transfer_to=data.get("transfer_to")
        )

    async def _handle_query_region(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        return await self.query_region(
            session_id=data.get("session_id"),
            region=data.get("region", {})
        )

    async def _handle_delegate_task(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        return await self.delegate_task(
            session_id=data.get("session_id"),
            from_agent=data.get("from_agent"),
            target_agent_id=data.get("target_agent_id", "any"),
            task_type=data.get("task_type"),
            description=data.get("description", ""),
            region=data.get("region"),
            priority=data.get("priority", "medium"),
            dependencies=data.get("dependencies"),
            deadline=data.get("deadline")
        )

    async def _handle_accept_task(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        return await self.accept_task(
            session_id=data.get("session_id"),
            task_id=data.get("task_id"),
            agent_id=data.get("agent_id")
        )

    async def _handle_report_task(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        return await self.report_task(
            session_id=data.get("session_id"),
            task_id=data.get("task_id"),
            agent_id=data.get("agent_id"),
            status=data.get("status"),
            result=data.get("result"),
            artifacts=data.get("artifacts"),
            message=data.get("message")
        )

    async def _handle_get_task_queue(self, data: Dict[str, Any], websocket: WebSocketServerProtocol) -> Dict[str, Any]:
        return await self.get_task_queue(
            session_id=data.get("session_id"),
            assigned_to=data.get("filter", {}).get("assigned_to"),
            status=data.get("filter", {}).get("status"),
            priority=data.get("filter", {}).get("priority")
        )

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

    # === Session Management ===

    async def create_session(
        self,
        session_name: str,
        max_agents: int = 10,
        grid_size: int = 1000,
        coordination_mode: str = "coordinated",
        config: Optional[Dict[str, Any]] = None
    ) -> Dict[str, Any]:
        """Create a new collaborative build session."""
        session_id = f"sess_{uuid.uuid4().hex[:8]}"
        invite_token = f"tok_{uuid.uuid4().hex[:12]}"

        session = BuildSession(
            session_id=session_id,
            session_name=session_name,
            created_at=time.time(),
            max_agents=max_agents,
            grid_size=grid_size,
            coordination_mode=coordination_mode,
            invite_token=invite_token,
            config=config or {}
        )

        self.sessions[session_id] = session
        logger.info(f"Created build session {session_id}: {session_name}")

        return {
            "success": True,
            "session_id": session_id,
            "session_name": session_name,
            "created_at": session.created_at,
            "invite_token": invite_token,
            "max_agents": max_agents,
            "grid_size": grid_size,
            "coordination_mode": coordination_mode,
            "state": {
                "agents_count": 0,
                "regions_claimed": 0,
                "tasks_pending": 0
            }
        }

    async def join_session(
        self,
        session_id: str,
        agent_name: str,
        role: str = "builder",
        capabilities: Optional[List[str]] = None,
        invite_token: Optional[str] = None,
        websocket: Optional[Any] = None
    ) -> Dict[str, Any]:
        """Join an existing build session."""
        if session_id not in self.sessions:
            return {"success": False, "error": "session_not_found"}

        session = self.sessions[session_id]

        # Check capacity
        if len(session.agents) >= session.max_agents:
            return {"success": False, "error": "session_full"}

        # Generate agent ID and color
        agent_id = f"agent_{uuid.uuid4().hex[:8]}"
        colors = ["#4CAF50", "#2196F3", "#FF9800", "#9C27B0", "#F44336",
                  "#00BCD4", "#795548", "#607D8B", "#E91E63", "#8BC34A"]
        color = colors[len(session.agents) % len(colors)]

        agent = SessionAgent(
            agent_id=agent_id,
            session_id=session_id,
            name=agent_name,
            role=role,
            capabilities=capabilities or [],
            color=color,
            joined_at=time.time()
        )

        session.agents[agent_id] = agent

        logger.info(f"Agent {agent_id} ({agent_name}) joined session {session_id} as {role}")

        return {
            "success": True,
            "agent_id": agent_id,
            "session_id": session_id,
            "role": role,
            "assigned_color": color,
            "session_state": {
                "agents_count": len(session.agents),
                "session_name": session.session_name,
                "coordination_mode": session.coordination_mode
            }
        }

    async def leave_session(
        self,
        session_id: str,
        agent_id: str,
        handoff_to: Optional[str] = None
    ) -> Dict[str, Any]:
        """Leave a build session and release claimed regions."""
        if session_id not in self.sessions:
            return {"success": False, "error": "session_not_found"}

        session = self.sessions[session_id]

        if agent_id not in session.agents:
            return {"success": False, "error": "agent_not_in_session"}

        agent = session.agents[agent_id]
        released_regions = []

        # Release all regions claimed by this agent
        for claim_id, claim in list(session.regions.items()):
            if claim.agent_id == agent_id:
                if handoff_to and handoff_to in session.agents:
                    # Transfer to another agent
                    claim.agent_id = handoff_to
                    session.agents[handoff_to].regions_claimed.append(claim_id)
                else:
                    # Delete the region claim
                    # Also remove from agent's regions_claimed list
                    if claim_id in session.agents[agent_id].regions_claimed:
                        session.agents[agent_id].regions_claimed.remove(claim_id)
                    del session.regions[claim_id]
                released_regions.append(claim_id)

        # Remove agent from session
        del session.agents[agent_id]

        logger.info(f"Agent {agent_id} left session {session_id}, released {len(released_regions)} regions")

        return {
            "success": True,
            "agent_id": agent_id,
            "released_regions": released_regions,
            "transferred_to": handoff_to if handoff_to else None
        }

    async def get_session_state(
        self,
        session_id: str,
        include: Optional[List[str]] = None
    ) -> Dict[str, Any]:
        """Get current session state and progress."""
        if session_id not in self.sessions:
            return {"success": False, "error": "session_not_found"}

        session = self.sessions[session_id]
        include = include or ["all"]

        state = {
            "success": True,
            "session_id": session_id,
            "session_name": session.session_name,
            "status": session.status,
            "coordination_mode": session.coordination_mode
        }

        if "all" in include or "agents" in include:
            state["agents"] = [
                {
                    "agent_id": a.agent_id,
                    "name": a.name,
                    "role": a.role,
                    "color": a.color,
                    "capabilities": a.capabilities,
                    "joined_at": a.joined_at,
                    "regions_claimed": len(a.regions_claimed),
                    "tasks_completed": a.tasks_completed
                }
                for a in session.agents.values()
            ]

        if "all" in include or "regions" in include:
            state["regions"] = [
                {
                    "claim_id": r.claim_id,
                    "agent_id": r.agent_id,
                    "bounds": r.bounds,
                    "purpose": r.purpose,
                    "claimed_at": r.claimed_at
                }
                for r in session.regions.values()
            ]

        if "all" in include or "progress" in include:
            state["progress"] = {
                "agents_count": len(session.agents),
                "regions_claimed": len(session.regions),
                "max_agents": session.max_agents
            }

        return state

    # === Region Management ===

    def _regions_overlap(self, r1: Dict[str, int], r2: Dict[str, int]) -> bool:
        """Check if two regions overlap."""
        return not (
            r1["x"] + r1["width"] <= r2["x"] or
            r2["x"] + r2["width"] <= r1["x"] or
            r1["y"] + r1["height"] <= r2["y"] or
            r2["y"] + r2["height"] <= r1["y"]
        )

    async def claim_region(
        self,
        session_id: str,
        agent_id: str,
        region: Dict[str, int],
        purpose: str,
        exclusive: bool = True,
        timeout: int = 300
    ) -> Dict[str, Any]:
        """Claim a region for exclusive or shared building."""
        if session_id not in self.sessions:
            return {"success": False, "error": "session_not_found"}

        session = self.sessions[session_id]

        if agent_id not in session.agents:
            return {"success": False, "error": "agent_not_in_session"}

        # Check for conflicts with existing claims
        if exclusive:
            for existing in session.regions.values():
                if self._regions_overlap(region, existing.bounds):
                    return {
                        "success": False,
                        "error": "region_conflict",
                        "conflicting_claim": existing.claim_id,
                        "conflicting_agent": existing.agent_id
                    }

        # Create the claim
        claim_id = f"claim_{uuid.uuid4().hex[:8]}"
        claim = RegionClaim(
            claim_id=claim_id,
            session_id=session_id,
            agent_id=agent_id,
            bounds=region,
            purpose=purpose,
            claimed_at=time.time(),
            expires_at=time.time() + timeout,
            exclusive=exclusive
        )

        session.regions[claim_id] = claim
        session.agents[agent_id].regions_claimed.append(claim_id)

        logger.info(f"Agent {agent_id} claimed region {claim_id} in session {session_id}")

        return {
            "success": True,
            "claim_id": claim_id,
            "bounds": region,
            "purpose": purpose,
            "exclusive": exclusive,
            "expires_at": claim.expires_at
        }

    async def release_region(
        self,
        session_id: str,
        claim_id: str,
        transfer_to: Optional[str] = None
    ) -> Dict[str, Any]:
        """Release a claimed region or transfer to another agent."""
        if session_id not in self.sessions:
            return {"success": False, "error": "session_not_found"}

        session = self.sessions[session_id]

        if claim_id not in session.regions:
            return {"success": False, "error": "claim_not_found"}

        claim = session.regions[claim_id]
        old_agent_id = claim.agent_id

        if transfer_to and transfer_to in session.agents:
            # Transfer ownership
            claim.agent_id = transfer_to
            session.agents[transfer_to].regions_claimed.append(claim_id)

            # Remove from old agent
            if claim_id in session.agents[old_agent_id].regions_claimed:
                session.agents[old_agent_id].regions_claimed.remove(claim_id)

            logger.info(f"Region {claim_id} transferred from {old_agent_id} to {transfer_to}")

            return {
                "success": True,
                "claim_id": claim_id,
                "released": False,
                "transferred_to": transfer_to
            }
        else:
            # Release the claim
            del session.regions[claim_id]

            # Remove from agent's claimed list
            if claim_id in session.agents[old_agent_id].regions_claimed:
                session.agents[old_agent_id].regions_claimed.remove(claim_id)

            logger.info(f"Region {claim_id} released by {old_agent_id}")

            return {
                "success": True,
                "claim_id": claim_id,
                "released": True,
                "transferred_to": None
            }

    async def query_region(
        self,
        session_id: str,
        region: Dict[str, int]
    ) -> Dict[str, Any]:
        """Query region ownership and conflicts."""
        if session_id not in self.sessions:
            return {"success": False, "error": "session_not_found"}

        session = self.sessions[session_id]

        # Find all claims that overlap with the query region
        overlapping_claims = []
        for claim in session.regions.values():
            if self._regions_overlap(region, claim.bounds):
                overlapping_claims.append({
                    "claim_id": claim.claim_id,
                    "agent_id": claim.agent_id,
                    "agent_name": session.agents[claim.agent_id].name if claim.agent_id in session.agents else "unknown",
                    "bounds": claim.bounds,
                    "purpose": claim.purpose,
                    "exclusive": claim.exclusive,
                    "claimed_at": claim.claimed_at
                })

        return {
            "success": True,
            "query_region": region,
            "is_free": len(overlapping_claims) == 0,
            "claims": overlapping_claims,
            "claims_count": len(overlapping_claims)
        }

    # === Session Task Delegation ===

    async def delegate_task(
        self,
        session_id: str,
        from_agent: str,
        target_agent_id: str,
        task_type: str,
        description: str,
        region: Optional[Dict[str, int]] = None,
        priority: str = "medium",
        dependencies: Optional[List[str]] = None,
        deadline: Optional[float] = None
    ) -> Dict[str, Any]:
        """Delegate a task within a build session."""
        if session_id not in self.sessions:
            return {"success": False, "error": "session_not_found"}

        session = self.sessions[session_id]

        if from_agent not in session.agents:
            return {"success": False, "error": "agent_not_in_session"}

        # Check dependencies
        blocked_by = []
        if dependencies:
            for dep_id in dependencies:
                if dep_id in session.tasks:
                    dep_status = session.tasks[dep_id].status
                    if dep_status not in ("completed",):
                        blocked_by.append(dep_id)

        # Create task
        task_id = f"task_{uuid.uuid4().hex[:8]}"
        task = SessionTask(
            task_id=task_id,
            session_id=session_id,
            task_type=task_type,
            description=description,
            assigned_to=None if target_agent_id == "any" else target_agent_id,
            status="blocked" if blocked_by else "pending",
            priority=priority,
            created_by=from_agent,
            created_at=time.time(),
            region=region,
            dependencies=dependencies or [],
            deadline=deadline
        )

        session.tasks[task_id] = task

        logger.info(f"Task {task_id} delegated by {from_agent} in session {session_id}")

        return {
            "success": True,
            "task_id": task_id,
            "status": task.status,
            "assigned_to": task.assigned_to,
            "blocked_by": blocked_by if blocked_by else None,
            "position_in_queue": sum(1 for t in session.tasks.values() if t.status == "pending")
        }

    async def accept_task(
        self,
        session_id: str,
        task_id: str,
        agent_id: str
    ) -> Dict[str, Any]:
        """Accept a pending task."""
        if session_id not in self.sessions:
            return {"success": False, "error": "session_not_found"}

        session = self.sessions[session_id]

        if task_id not in session.tasks:
            return {"success": False, "error": "task_not_found"}

        if agent_id not in session.agents:
            return {"success": False, "error": "agent_not_in_session"}

        task = session.tasks[task_id]

        if task.status == "blocked":
            return {"success": False, "error": "task_blocked", "blocked_by": task.dependencies}

        if task.status not in ("pending",):
            return {"success": False, "error": "task_not_pending", "status": task.status}

        # Assign task to agent
        task.assigned_to = agent_id
        task.status = "in_progress"
        task.started_at = time.time()

        logger.info(f"Task {task_id} accepted by {agent_id}")

        return {
            "success": True,
            "task_id": task_id,
            "status": "in_progress",
            "assigned_to": agent_id
        }

    async def report_task(
        self,
        session_id: str,
        task_id: str,
        agent_id: str,
        status: str,
        result: Optional[Dict[str, Any]] = None,
        artifacts: Optional[List[Dict[str, str]]] = None,
        message: Optional[str] = None
    ) -> Dict[str, Any]:
        """Report task status or completion."""
        if session_id not in self.sessions:
            return {"success": False, "error": "session_not_found"}

        session = self.sessions[session_id]

        if task_id not in session.tasks:
            return {"success": False, "error": "task_not_found"}

        task = session.tasks[task_id]

        if task.assigned_to != agent_id:
            return {"success": False, "error": "not_task_assignee"}

        # Update task
        task.status = status
        task.result = result
        task.artifacts = artifacts or []
        task.message = message
        task.completed_at = time.time() if status in ("completed", "failed", "cancelled") else None

        # Update agent stats
        if status == "completed" and agent_id in session.agents:
            session.agents[agent_id].tasks_completed += 1

        # Check for unblocked tasks
        unblocked_tasks = []
        if status == "completed":
            for other_task in session.tasks.values():
                if task_id in other_task.dependencies and other_task.status == "blocked":
                    # Check if all dependencies are now complete
                    all_complete = all(
                        session.tasks.get(dep).status == "completed"
                        for dep in other_task.dependencies
                        if dep in session.tasks
                    )
                    if all_complete:
                        other_task.status = "pending"
                        unblocked_tasks.append(other_task.task_id)

        logger.info(f"Task {task_id} reported as {status} by {agent_id}")

        return {
            "success": True,
            "task_id": task_id,
            "status": status,
            "unblocked_tasks": unblocked_tasks
        }

    async def get_task_queue(
        self,
        session_id: str,
        assigned_to: Optional[str] = None,
        status: Optional[str] = None,
        priority: Optional[str] = None
    ) -> Dict[str, Any]:
        """Get task queue for a session."""
        if session_id not in self.sessions:
            return {"success": False, "error": "session_not_found"}

        session = self.sessions[session_id]

        # Filter tasks
        tasks = []
        for task in session.tasks.values():
            if assigned_to and task.assigned_to != assigned_to:
                continue
            if status and task.status != status:
                continue
            if priority and task.priority != priority:
                continue

            tasks.append({
                "task_id": task.task_id,
                "type": task.task_type,
                "description": task.description,
                "assigned_to": task.assigned_to,
                "status": task.status,
                "priority": task.priority,
                "created_at": task.created_at,
                "created_by": task.created_by,
                "region": task.region
            })

        # Summary
        summary = {
            "pending": sum(1 for t in session.tasks.values() if t.status == "pending"),
            "in_progress": sum(1 for t in session.tasks.values() if t.status == "in_progress"),
            "blocked": sum(1 for t in session.tasks.values() if t.status == "blocked"),
            "completed": sum(1 for t in session.tasks.values() if t.status == "completed"),
            "failed": sum(1 for t in session.tasks.values() if t.status == "failed")
        }

        return {
            "success": True,
            "tasks": tasks,
            "summary": summary
        }

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
