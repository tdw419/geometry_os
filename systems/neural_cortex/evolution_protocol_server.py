"""
Evolution Protocol Server: Socket Server for Harmonic Daemon Synchronization

This module provides a socket server that handles Evolution Protocol messages
from the Rust compositor and responds with daemon synchronization data.

Phase 3: Python Daemon Hub Implementation
"""

import json
import logging
import socket
import struct
import threading
import time
from typing import Optional, Callable, Dict, Any

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [EVO-SERVER] %(message)s',
    handlers=[
        logging.FileHandler("evolution_protocol_server.log"),
        logging.StreamHandler()
    ]
)
logger = logging.getLogger("EvolutionProtocolServer")


class MessageType:
    """Message types matching Rust MessageType enum"""
    # Compositor → Daemon
    HEARTBEAT = "Heartbeat"
    REQUEST_METRICS = "RequestMetrics"
    REQUEST_NEURAL_STATE = "RequestNeuralState"
    REQUEST_VISUAL_THOUGHT = "RequestVisualThought"
    INPUT_EVENT = "InputEvent"
    
    # Communication
    REQUEST_AUDIO_FEATURES = "RequestAudioFeatures"
    REQUEST_INPUT_STATE = "RequestInputState"
    REQUEST_SELF_STATE = "RequestSelfState"
    REQUEST_THEORY_OF_MIND = "RequestTheoryOfMind"
    REQUEST_COGNITIVE_STATE = "RequestCognitiveState"
    
    # Daemon → Compositor
    METRICS_UPDATE = "MetricsUpdate"
    NEURAL_STATE_UPDATE = "NeuralStateUpdate"
    VISUAL_THOUGHT_READY = "VisualThoughtReady"
    EVOLUTION_EVENT = "EvolutionEvent"
    
    # Multi-Modal Data
    AUDIO_FEATURES_UPDATE = "AudioFeaturesUpdate"
    INPUT_STATE_UPDATE = "InputStateUpdate"
    
    # Consciousness
    SELF_STATE_UPDATE = "SelfStateUpdate"
    
    # Theory of Mind
    THEORY_OF_MIND_UPDATE = "TheoryOfMindUpdate"
    
    # Cognitive Visualization
    COGNITIVE_STATE_UPDATE = "CognitiveStateUpdate"
    TOKEN_VISUALIZATION_UPDATE = "TokenVisualizationUpdate"
    WRITE_EVOLVED_GENOME = "WriteEvolvedGenome"
    
    # Bidirectional
    ERROR = "Error"
    ACK = "Ack"
    NOTIFY_WINDOW_EVENT = "NotifyWindowEvent"
    
    # Harmonic Daemon Protocol (Phase 2)
    REGISTER_DAEMON = "RegisterDaemon"
    UNREGISTER_DAEMON = "UnregisterDaemon"
    DAEMON_STATE_UPDATE = "DaemonStateUpdate"
    DAEMON_AMPLITUDE_UPDATE = "DaemonAmplitudeUpdate"
    
    # Polling support (Phase 2 extension)
    REQUEST_DAEMON_STATES = "RequestDaemonStates"
    DAEMON_STATES_UPDATE = "DaemonStatesUpdate"


class ProtocolMessage:
    """Protocol message with header and payload"""
    
    def __init__(self, msg_type: str, sequence: int, payload: Dict[str, Any]):
        self.msg_type = msg_type
        self.sequence = sequence
        self.payload = payload
    
    @staticmethod
    def from_dict(data: Dict) -> 'ProtocolMessage':
        """Create ProtocolMessage from dictionary"""
        return ProtocolMessage(
            msg_type=data.get('msg_type', ''),
            sequence=data.get('sequence', 0),
            payload=data.get('payload', {})
        )
    
    def to_dict(self) -> Dict:
        """Convert ProtocolMessage to dictionary"""
        return {
            'msg_type': self.msg_type,
            'sequence': self.sequence,
            'payload': self.payload
        }
    
    def to_bytes(self) -> bytes:
        """
        Serialize message to bytes with length prefix.
        
        Format: [4-byte length (big-endian)][JSON payload]
        """
        json_data = json.dumps(self.to_dict()).encode('utf-8')
        length = len(json_data)
        
        # Prepend 4-byte big-endian length
        length_bytes = struct.pack('>I', length)
        
        return length_bytes + json_data
    
    @staticmethod
    def from_bytes(data: bytes) -> 'ProtocolMessage':
        """
        Deserialize message from bytes.
        
        Format: [4-byte length (big-endian)][JSON payload]
        """
        if len(data) < 4:
            raise ValueError("Message too short (missing length prefix)")
        
        # Read length
        length = struct.unpack('>I', data[:4])[0]
        
        if len(data) < 4 + length:
            raise ValueError("Incomplete message")
        
        # Read JSON payload
        json_data = data[4:4 + length]
        payload_dict = json.loads(json_data.decode('utf-8'))
        
        return ProtocolMessage.from_dict(payload_dict)


class EvolutionProtocolServer:
    """
    Evolution Protocol Server: Handles IPC communication with Rust compositor.
    
    Features:
    - Unix domain socket server
    - Message handling for daemon synchronization
    - RequestDaemonStates handling
    - DaemonSyncPacket responses
    - Thread-safe operation
    """
    
    def __init__(
        self,
        socket_path: str = "/tmp/evolution_daemon.sock",
        sync_packet_provider: Optional[Callable] = None,
        daemon_bridge: Optional['EvolutionDaemonBridge'] = None
    ):
        self.socket_path = socket_path
        self.sync_packet_provider = sync_packet_provider
        self.daemon_bridge = daemon_bridge
        self.server_socket: Optional[socket.socket] = None
        self.running = False
        self.server_thread: Optional[threading.Thread] = None
        self.sequence_counter = 0
        self.lock = threading.Lock()
        
        # Message handlers
        self.handlers: Dict[str, Callable] = {
            MessageType.HEARTBEAT: self._handle_heartbeat,
            MessageType.REQUEST_METRICS: self._handle_request_metrics,
            MessageType.REQUEST_NEURAL_STATE: self._handle_request_neural_state,
            MessageType.REQUEST_DAEMON_STATES: self._handle_request_daemon_states,
            MessageType.WRITE_EVOLVED_GENOME: self._handle_write_evolved_genome,
        }
        
        logger.info(f"🔌 Evolution Protocol Server initialized")
        logger.info(f"   Socket Path: {socket_path}")
    
    def start(self):
        """Start the socket server in a background thread"""
        if self.running:
            logger.warning("⚠️  Server already running")
            return
        
        # Remove existing socket if present
        import os
        if os.path.exists(self.socket_path):
            os.remove(self.socket_path)
        
        # Create Unix domain socket
        self.server_socket = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        self.server_socket.bind(self.socket_path)
        self.server_socket.listen(5)
        
        # Set socket permissions
        os.chmod(self.socket_path, 0o777)
        
        self.running = True
        
        # Start server thread
        self.server_thread = threading.Thread(target=self._server_loop, daemon=True)
        self.server_thread.start()
        
        logger.info(f"✅ Evolution Protocol Server started on {self.socket_path}")
    
    def stop(self):
        """Stop the socket server"""
        if not self.running:
            return
        
        self.running = False
        
        # Close server socket
        if self.server_socket:
            try:
                self.server_socket.close()
            except Exception as e:
                logger.error(f"Error closing server socket: {e}")
        
        # Wait for thread to finish
        if self.server_thread:
            self.server_thread.join(timeout=5.0)
        
        logger.info("🛑 Evolution Protocol Server stopped")
    
    def _server_loop(self):
        """Main server loop"""
        logger.info("🔄 Server loop started")
        
        while self.running:
            try:
                # Accept connection with timeout
                self.server_socket.settimeout(1.0)
                try:
                    client_socket, _ = self.server_socket.accept()
                except socket.timeout:
                    continue
                
                # Handle client connection
                self._handle_client(client_socket)
                
            except Exception as e:
                if self.running:
                    logger.error(f"Server loop error: {e}")
    
    def _handle_client(self, client_socket: socket.socket):
        """Handle a client connection"""
        try:
            # Set timeout
            client_socket.settimeout(5.0)
            
            # Receive message
            message = self._receive_message(client_socket)
            
            if message:
                # Handle message
                response = self._handle_message(message)
                
                # Send response
                if response:
                    self._send_message(client_socket, response)
            
        except Exception as e:
            logger.error(f"Error handling client: {e}")
        finally:
            try:
                client_socket.close()
            except:
                pass
    
    def _receive_message(self, client_socket: socket.socket) -> Optional[ProtocolMessage]:
        """
        Receive a message from client.
        
        Returns:
            Optional[ProtocolMessage]: Received message or None if error
        """
        try:
            # Read length prefix
            length_bytes = client_socket.recv(4)
            if len(length_bytes) < 4:
                return None
            
            length = struct.unpack('>I', length_bytes)[0]
            
            # Read JSON payload
            json_bytes = b''
            while len(json_bytes) < length:
                chunk = client_socket.recv(length - len(json_bytes))
                if not chunk:
                    return None
                json_bytes += chunk
            
            # Parse message
            return ProtocolMessage.from_bytes(length_bytes + json_bytes)
            
        except Exception as e:
            logger.error(f"Error receiving message: {e}")
            return None
    
    def _send_message(self, client_socket: socket.socket, message: ProtocolMessage):
        """
        Send a message to client.
        
        Args:
            client_socket: Client socket
            message: Message to send
        """
        try:
            data = message.to_bytes()
            client_socket.sendall(data)
        except Exception as e:
            logger.error(f"Error sending message: {e}")
    
    def _handle_message(self, message: ProtocolMessage) -> Optional[ProtocolMessage]:
        """
        Handle incoming message and return response.
        
        Args:
            message: Incoming message
            
        Returns:
            Optional[ProtocolMessage]: Response message or None
        """
        msg_type = message.msg_type
        handler = self.handlers.get(msg_type)
        
        if handler:
            try:
                return handler(message)
            except Exception as e:
                logger.error(f"Error in handler for {msg_type}: {e}")
                return self._error_response(f"Handler error: {e}")
        else:
            logger.warning(f"⚠️  Unknown message type: {msg_type}")
            return self._error_response(f"Unknown message type: {msg_type}")
    
    def _handle_heartbeat(self, message: ProtocolMessage) -> ProtocolMessage:
        """Handle heartbeat message"""
        with self.lock:
            self.sequence_counter += 1
        
        return ProtocolMessage(
            msg_type=MessageType.ACK,
            sequence=self.sequence_counter,
            payload={"status": "alive"}
        )
    
    def _handle_request_metrics(self, message: ProtocolMessage) -> ProtocolMessage:
        """Handle request for evolution metrics"""
        # This would return actual metrics from the daemon
        with self.lock:
            self.sequence_counter += 1
        
        return ProtocolMessage(
            msg_type=MessageType.METRICS_UPDATE,
            sequence=self.sequence_counter,
            payload={
                "generation": 0,
                "pressure_score": 0.0,
                "compilation_success_rate": 0.0,
                "avg_compilation_time": 0.0,
                "visual_renders": 0,
                "components_built": 0,
                "health_status": "healthy",
                "timestamp": time.time()
            }
        )
    
    def _handle_request_neural_state(self, message: ProtocolMessage) -> ProtocolMessage:
        """Handle request for neural state"""
        with self.lock:
            self.sequence_counter += 1
        
        # Return mock neural state
        return ProtocolMessage(
            msg_type=MessageType.NEURAL_STATE_UPDATE,
            sequence=self.sequence_counter,
            payload={
                "layer_activations": [0.0] * 128,
                "attention_weights": [0.0] * 128,
                "memory_patterns": [0.0] * 128,
                "confidence": 0.5,
                "thought_vector": [0.0] * 128
            }
        )
    
    def _handle_request_daemon_states(self, message: ProtocolMessage) -> ProtocolMessage:
        """
        Handle RequestDaemonStates message (Phase 3).
        
        This is the key handler for harmonic daemon synchronization.
        It calls the sync_packet_provider to get the current DaemonSyncPacket.
        """
        with self.lock:
            self.sequence_counter += 1
        
        # Get sync packet from provider
        if self.sync_packet_provider:
            try:
                sync_packet = self.sync_packet_provider()
                payload = sync_packet.to_dict() if hasattr(sync_packet, 'to_dict') else sync_packet
            except Exception as e:
                logger.error(f"Error getting sync packet: {e}")
                payload = {
                    "registered": [],
                    "updates": [],
                    "amplitude_updates": [],
                    "unregistered": []
                }
        else:
            # No provider, return empty packet
            logger.warning("⚠️  No sync packet provider configured")
            payload = {
                "registered": [],
                "updates": [],
                "amplitude_updates": [],
                "unregistered": []
            }
        
        logger.debug(f"📦 Sending DaemonStatesUpdate with {len(payload.get('registered', []))} daemons")
        
        return ProtocolMessage(
            msg_type=MessageType.DAEMON_STATES_UPDATE,
            sequence=self.sequence_counter,
            payload=payload
        )
    
    def _handle_write_evolved_genome(self, message: ProtocolMessage) -> ProtocolMessage:
        """Handle WriteEvolvedGenome message - forward to daemon"""
        with self.lock:
            self.sequence_counter += 1

        payload = message.payload
        genome_id = payload.get('id', 'unknown')

        logger.info(f"🧬 Evolved Genome Received: {genome_id}")
        logger.info(f"   Generation: {payload.get('generation', 0)}")
        logger.info(f"   Fitness: {payload.get('fitness', 0.0)}")

        # Forward to daemon if bridge is available
        success = False
        if self.daemon_bridge:
            success = self.daemon_bridge.forward_genome(payload)
            if success:
                logger.info(f"✅ Genome {genome_id} forwarded to daemon")
            else:
                logger.warning(f"⚠️ Failed to forward genome {genome_id}")
        else:
            logger.warning("⚠️ No daemon bridge available - genome not forwarded")

        return ProtocolMessage(
            msg_type=MessageType.ACK,
            sequence=self.sequence_counter,
            payload={
                "status": "received" if success else "no_bridge",
                "genome_id": genome_id
            }
        )

    def _error_response(self, error_message: str) -> ProtocolMessage:
        """Create an error response message"""
        with self.lock:
            self.sequence_counter += 1
        
        return ProtocolMessage(
            msg_type=MessageType.ERROR,
            sequence=self.sequence_counter,
            payload={"error": error_message}
        )
    
    def set_sync_packet_provider(self, provider: Callable):
        """
        Set the sync packet provider callback.
        
        Args:
            provider: Callable that returns a DaemonSyncPacket or dict
        """
        self.sync_packet_provider = provider
        logger.info("✅ Sync packet provider configured")


# Example usage
if __name__ == "__main__":
    # Create a mock sync packet provider
    def mock_sync_provider():
        return {
            "registered": [
                {
                    "name": "Security",
                    "role": "Security",
                    "preferred_band": "High",
                    "initial_amplitude": 0.8
                },
                {
                    "name": "Creative",
                    "role": "Creative",
                    "preferred_band": "Low",
                    "initial_amplitude": 1.0
                }
            ],
            "updates": [
                {
                    "name": "Security",
                    "data": [0.5] * 128
                },
                {
                    "name": "Creative",
                    "data": [0.3] * 128
                }
            ],
            "amplitude_updates": [
                {
                    "name": "Security",
                    "amplitude": 0.8
                },
                {
                    "name": "Creative",
                    "amplitude": 1.0
                }
            ],
            "unregistered": []
        }
    
    # Create server
    server = EvolutionProtocolServer(
        socket_path="/tmp/evolution_daemon_test.sock",
        sync_packet_provider=mock_sync_provider
    )
    
    # Start server
    server.start()
    
    print("✅ Evolution Protocol Server running...")
    print("   Socket: /tmp/evolution_daemon_test.sock")
    print("   Press Ctrl+C to stop")
    
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        print("\n🛑 Shutting down...")
        server.stop()
