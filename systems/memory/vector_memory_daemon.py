#!/usr/bin/env python3
"""
Vector Memory Daemon - The "Hippocampus" of Geometry OS
=======================================================

Stores and retrieves semantic memories using PostgreSQL + pgvector.
Integrates with the Infinite Map for visual memory retrieval.

Architecture:
- PostgreSQL with pgvector extension for high-dimensional similarity search
- HNSW indexes for sub-50ms semantic neighborhood retrieval
- Hilbert coordinate mapping for spatial visualization
- Binary quantization support for space-efficient storage
"""

import asyncio
import json
import os
import socket
import time
from typing import Dict, List, Optional, Tuple, Any
from dataclasses import dataclass, asdict
from pathlib import Path
import numpy as np

# Add project root to path
project_root = Path(__file__).parent.parent.parent
import sys
sys.path.insert(0, str(project_root))

try:
    import psycopg2
    from psycopg2.extras import execute_values
    from psycopg2 import sql
    HAS_PG = True
except ImportError:
    HAS_PG = False
    print("⚠️  psycopg2 not installed. Install with: pip install psycopg2-binary")

try:
    from pgvector.psycopg2 import register_vector
    HAS_PGVECTOR = True
except ImportError:
    HAS_PGVECTOR = False
    print("⚠️  pgvector not installed. Install with: pip install pgvector")


@dataclass
class ThoughtPixel:
    """Represents a single thought pixel stored in memory"""
    token_id: int
    token: str
    embedding: np.ndarray  # Vector embedding
    hilbert_x: float  # Normalized 0-1
    hilbert_y: float  # Normalized 0-1
    layer: int = 0
    activation: float = 1.0
    session_id: str = ""
    timestamp: float = 0.0
    
    def to_dict(self) -> Dict:
        """Convert to dictionary for JSON serialization"""
        return {
            "token_id": self.token_id,
            "token": self.token,
            "embedding": self.embedding.tolist(),
            "hilbert_x": self.hilbert_x,
            "hilbert_y": self.hilbert_y,
            "layer": self.layer,
            "activation": self.activation,
            "session_id": self.session_id,
            "timestamp": self.timestamp
        }


class VectorMemoryAgent:
    """
    The 'Hippocampus' Agent for Geometry OS.
    Connects the Visual Shell (PixiJS) to long-term vector storage in Postgres.
    """
    
    def __init__(
        self,
        db_url: str = "postgresql://localhost/geometry_os",
        socket_path: str = "/tmp/vector_memory_daemon.sock",
        enable_quantization: bool = False
    ):
        self.db_url = db_url
        self.socket_path = socket_path
        self.enable_quantization = enable_quantization
        self.conn = None
        self.cur = None
        self.running = False
        self.session_id = self._generate_session_id()
        
        # Performance tracking
        self.store_count = 0
        self.retrieve_count = 0
        self.avg_retrieval_time = 0.0
        
    def _generate_session_id(self) -> str:
        """Generate a unique session identifier"""
        return f"session_{int(time.time())}"
    
    def connect(self) -> bool:
        """Connect to PostgreSQL database"""
        if not HAS_PG:
            print("❌ PostgreSQL driver not available")
            return False
            
        try:
            self.conn = psycopg2.connect(self.db_url)
            self.cur = self.conn.cursor()
            
            if HAS_PGVECTOR:
                register_vector(self.conn)
                print("✅ pgvector extension registered")
            else:
                print("⚠️  pgvector not available, falling back to manual cosine similarity")
            
            # Initialize schema
            self._init_schema()
            
            print(f"✅ Connected to PostgreSQL: {self.db_url}")
            return True
            
        except Exception as e:
            print(f"❌ Failed to connect to PostgreSQL: {e}")
            print("   Make sure PostgreSQL is running and pgvector is installed")
            return False
    
    def _init_schema(self):
        """Initialize database schema"""
        # Create thought_pixels table
        create_table_sql = """
        CREATE TABLE IF NOT EXISTS thought_pixels (
            id SERIAL PRIMARY KEY,
            token_id INTEGER NOT NULL,
            token TEXT NOT NULL,
            embedding vector(1536) NOT NULL,
            hilbert_x FLOAT NOT NULL,
            hilbert_y FLOAT NOT NULL,
            layer INTEGER DEFAULT 0,
            activation FLOAT DEFAULT 1.0,
            session_id TEXT NOT NULL,
            timestamp FLOAT NOT NULL,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
        """
        self.cur.execute(create_table_sql)
        
        # Create HNSW index for fast similarity search
        create_index_sql = """
        CREATE INDEX IF NOT EXISTS thought_pixels_embedding_idx 
        ON thought_pixels USING hnsw (embedding vector_cosine_ops);
        """
        self.cur.execute(create_index_sql)
        
        # Create indexes for common queries
        self.cur.execute("""
            CREATE INDEX IF NOT EXISTS thought_pixels_session_idx 
            ON thought_pixels(session_id);
        """)
        
        self.cur.execute("""
            CREATE INDEX IF NOT EXISTS thought_pixels_timestamp_idx 
            ON thought_pixels(timestamp DESC);
        """)
        
        self.conn.commit()
        print("✅ Database schema initialized")
    
    def store_thought(self, thought: ThoughtPixel) -> bool:
        """Store a thought pixel in the database"""
        if not self.conn:
            print("❌ Not connected to database")
            return False
        
        try:
            # Set timestamp if not provided
            if thought.timestamp == 0.0:
                thought.timestamp = time.time()
            
            # Set session ID if not provided
            if not thought.session_id:
                thought.session_id = self.session_id
            
            # Store in database
            if HAS_PGVECTOR:
                # Use pgvector for efficient storage
                self.cur.execute(
                    """
                    INSERT INTO thought_pixels 
                    (token_id, token, embedding, hilbert_x, hilbert_y, layer, activation, session_id, timestamp)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
                    """,
                    (
                        thought.token_id,
                        thought.token,
                        thought.embedding,
                        thought.hilbert_x,
                        thought.hilbert_y,
                        thought.layer,
                        thought.activation,
                        thought.session_id,
                        thought.timestamp
                    )
                )
            else:
                # Fallback: store as JSONB
                self.cur.execute(
                    """
                    INSERT INTO thought_pixels 
                    (token_id, token, embedding, hilbert_x, hilbert_y, layer, activation, session_id, timestamp)
                    VALUES (%s, %s, %s::jsonb, %s, %s, %s, %s, %s, %s)
                    """,
                    (
                        thought.token_id,
                        thought.token,
                        json.dumps(thought.embedding.tolist()),
                        thought.hilbert_x,
                        thought.hilbert_y,
                        thought.layer,
                        thought.activation,
                        thought.session_id,
                        thought.timestamp
                    )
                )
            
            self.conn.commit()
            self.store_count += 1
            
            if self.store_count % 100 == 0:
                print(f"📊 Stored {self.store_count} thought pixels")
            
            return True
            
        except Exception as e:
            print(f"❌ Failed to store thought: {e}")
            self.conn.rollback()
            return False
    
    def recall_semantic_neighborhood(
        self,
        query_vector: np.ndarray,
        limit: int = 100,
        threshold: float = 0.0,
        exclude_session: str = None
    ) -> List[Dict[str, Any]]:
        """
        Retrieve pixels from the past that 'vibe' with current thoughts.
        
        Args:
            query_vector: Query embedding vector
            limit: Maximum number of results to return
            threshold: Minimum cosine similarity (0-1)
            exclude_session: Session ID to exclude (e.g., current session)
        
        Returns:
            List of thought pixels with similarity scores
        """
        if not self.conn:
            print("❌ Not connected to database")
            return []
        
        start_time = time.time()
        
        try:
            if HAS_PGVECTOR:
                # Use pgvector's efficient cosine distance operator (<=>)
                # Cosine distance = 1 - cosine similarity
                # So similarity = 1 - distance
                
                query_sql = """
                SELECT 
                    token_id, token, hilbert_x, hilbert_y, layer, activation, 
                    session_id, timestamp, embedding,
                    1 - (embedding <=> %s) as similarity
                FROM thought_pixels
                WHERE 1 - (embedding <=> %s) >= %s
                """
                params = [query_vector, query_vector, threshold]
                
                if exclude_session:
                    query_sql += " AND session_id != %s"
                    params.append(exclude_session)
                
                query_sql += " ORDER BY embedding <=> %s LIMIT %s"
                params.extend([query_vector, limit])
                
                self.cur.execute(query_sql, params)
                
            else:
                # Fallback: manual cosine similarity
                # This is slower but works without pgvector
                self.cur.execute("""
                    SELECT token_id, token, hilbert_x, hilbert_y, layer, activation, 
                           session_id, timestamp, embedding
                    FROM thought_pixels
                """)
                
                all_results = self.cur.fetchall()
                similarities = []
                
                for row in all_results:
                    stored_embedding = np.array(json.loads(row[8]))
                    similarity = self._cosine_similarity(query_vector, stored_embedding)
                    
                    if similarity >= threshold:
                        if exclude_session and row[6] == exclude_session:
                            continue
                        similarities.append((row, similarity))
                
                # Sort by similarity (descending)
                similarities.sort(key=lambda x: x[1], reverse=True)
                similarities = similarities[:limit]
                
                # Format results
                results = []
                for row, similarity in similarities:
                    results.append({
                        "token_id": row[0],
                        "token": row[1],
                        "hilbert_x": row[2],
                        "hilbert_y": row[3],
                        "layer": row[4],
                        "activation": row[5],
                        "session_id": row[6],
                        "timestamp": row[7],
                        "similarity": similarity
                    })
                
                retrieval_time = time.time() - start_time
                self.retrieve_count += 1
                self.avg_retrieval_time = (
                    (self.avg_retrieval_time * (self.retrieve_count - 1) + retrieval_time) 
                    / self.retrieve_count
                )
                
                if retrieval_time > 0.05:
                    print(f"⚠️  Slow retrieval: {retrieval_time*1000:.2f}ms (avg: {self.avg_retrieval_time*1000:.2f}ms)")
                
                return results
            
            # Format pgvector results
            results = []
            for row in self.cur.fetchall():
                results.append({
                    "token_id": row[0],
                    "token": row[1],
                    "hilbert_x": row[2],
                    "hilbert_y": row[3],
                    "layer": row[4],
                    "activation": row[5],
                    "session_id": row[6],
                    "timestamp": row[7],
                    "similarity": row[9]
                })
            
            retrieval_time = time.time() - start_time
            self.retrieve_count += 1
            self.avg_retrieval_time = (
                (self.avg_retrieval_time * (self.retrieve_count - 1) + retrieval_time) 
                / self.retrieve_count
            )
            
            if retrieval_time > 0.05:
                print(f"⚠️  Slow retrieval: {retrieval_time*1000:.2f}ms (avg: {self.avg_retrieval_time*1000:.2f}ms)")
            
            return results
            
        except Exception as e:
            print(f"❌ Failed to recall semantic neighborhood: {e}")
            return []
    
    def _cosine_similarity(self, a: np.ndarray, b: np.ndarray) -> float:
        """Compute cosine similarity between two vectors"""
        dot_product = np.dot(a, b)
        norm_a = np.linalg.norm(a)
        norm_b = np.linalg.norm(b)
        
        if norm_a == 0 or norm_b == 0:
            return 0.0
        
        return dot_product / (norm_a * norm_b)
    
    def get_session_stats(self, session_id: str = None) -> Dict[str, Any]:
        """Get statistics for a session"""
        if not self.conn:
            return {}
        
        if session_id is None:
            session_id = self.session_id
        
        try:
            self.cur.execute("""
                SELECT 
                    COUNT(*) as total_thoughts,
                    AVG(activation) as avg_activation,
                    MIN(timestamp) as start_time,
                    MAX(timestamp) as end_time
                FROM thought_pixels
                WHERE session_id = %s
            """, (session_id,))
            
            row = self.cur.fetchone()
            
            return {
                "session_id": session_id,
                "total_thoughts": row[0],
                "avg_activation": float(row[1]) if row[1] else 0.0,
                "start_time": row[2],
                "end_time": row[3],
                "duration": row[3] - row[2] if row[2] and row[3] else 0.0
            }
            
        except Exception as e:
            print(f"❌ Failed to get session stats: {e}")
            return {}
    
    def get_memory_beam(
        self,
        query_vector: np.ndarray,
        current_x: float,
        current_y: float,
        limit: int = 20
    ) -> List[Dict[str, Any]]:
        """
        Get memory beam for visualization.
        Returns semantically related thoughts with their spatial coordinates.
        """
        memories = self.recall_semantic_neighborhood(query_vector, limit=limit)
        
        # Add distance from current position
        for memory in memories:
            dx = memory['hilbert_x'] - current_x
            dy = memory['hilbert_y'] - current_y
            memory['spatial_distance'] = np.sqrt(dx*dx + dy*dy)
        
        # Sort by combination of semantic similarity and spatial distance
        # Prioritize semantic similarity, but consider spatial proximity
        memories.sort(
            key=lambda m: (m['similarity'] * 0.7) + (1.0 / (m['spatial_distance'] + 0.01) * 0.3),
            reverse=True
        )
        
        return memories
    
    async def start_server(self):
        """Start the Unix socket server for receiving thought updates"""
        if os.path.exists(self.socket_path):
            os.remove(self.socket_path)
        
        server = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        server.bind(self.socket_path)
        server.listen(5)
        server.setblocking(False)
        
        print(f"🚀 Vector Memory Daemon listening on {self.socket_path}")
        self.running = True
        
        loop = asyncio.get_event_loop()
        
        while self.running:
            try:
                client, _ = await loop.sock_accept(server)
                loop.create_task(self.handle_client(client))
            except Exception as e:
                if self.running:
                    print(f"❌ Server error: {e}")
        
        server.close()
        print("🛑 Vector Memory Daemon stopped")
    
    async def handle_client(self, client: socket.socket):
        """Handle incoming client connections"""
        try:
            data = await asyncio.get_event_loop().sock_recv(client, 4096)
            message = json.loads(data.decode('utf-8'))
            
            if message.get('message_type') == 'StoreThought':
                # Store a thought pixel
                payload = message.get('payload', {})
                thought = ThoughtPixel(
                    token_id=payload.get('token_id', 0),
                    token=payload.get('token', ''),
                    embedding=np.array(payload.get('embedding', [])),
                    hilbert_x=payload.get('hilbert_x', 0.0),
                    hilbert_y=payload.get('hilbert_y', 0.0),
                    layer=payload.get('layer', 0),
                    activation=payload.get('activation', 1.0),
                    session_id=payload.get('session_id', self.session_id),
                    timestamp=payload.get('timestamp', time.time())
                )
                
                success = self.store_thought(thought)
                
                # Send response
                response = {
                    'message_type': 'StoreThoughtResponse',
                    'success': success,
                    'timestamp': time.time()
                }
                client.send(json.dumps(response).encode('utf-8'))
            
            elif message.get('message_type') == 'RecallMemories':
                # Recall semantic neighborhood
                payload = message.get('payload', {})
                query_vector = np.array(payload.get('query_vector', []))
                limit = payload.get('limit', 100)
                threshold = payload.get('threshold', 0.0)
                exclude_session = payload.get('exclude_session')
                
                memories = self.recall_semantic_neighborhood(
                    query_vector, limit=limit, threshold=threshold, exclude_session=exclude_session
                )
                
                # Send response
                response = {
                    'message_type': 'RecallMemoriesResponse',
                    'memories': memories,
                    'timestamp': time.time()
                }
                client.send(json.dumps(response).encode('utf-8'))
            
            elif message.get('message_type') == 'GetMemoryBeam':
                # Get memory beam for visualization
                payload = message.get('payload', {})
                query_vector = np.array(payload.get('query_vector', []))
                current_x = payload.get('current_x', 0.0)
                current_y = payload.get('current_y', 0.0)
                limit = payload.get('limit', 20)
                
                beam = self.get_memory_beam(query_vector, current_x, current_y, limit)
                
                # Send response
                response = {
                    'message_type': 'GetMemoryBeamResponse',
                    'beam': beam,
                    'timestamp': time.time()
                }
                client.send(json.dumps(response).encode('utf-8'))
            
            elif message.get('message_type') == 'GetStats':
                # Get statistics
                stats = {
                    'session_stats': self.get_session_stats(),
                    'store_count': self.store_count,
                    'retrieve_count': self.retrieve_count,
                    'avg_retrieval_time': self.avg_retrieval_time
                }
                
                # Send response
                response = {
                    'message_type': 'GetStatsResponse',
                    'stats': stats,
                    'timestamp': time.time()
                }
                client.send(json.dumps(response).encode('utf-8'))
            
        except Exception as e:
            print(f"❌ Error handling client: {e}")
        finally:
            client.close()
    
    def stop(self):
        """Stop the daemon"""
        self.running = False
        
        if self.cur:
            self.cur.close()
        if self.conn:
            self.conn.close()


async def main():
    """Main entry point"""
    import argparse
    
    parser = argparse.ArgumentParser(description='Vector Memory Daemon for Geometry OS')
    parser.add_argument('--db-url', default='postgresql://localhost/geometry_os',
                        help='PostgreSQL connection URL')
    parser.add_argument('--socket', default='/tmp/vector_memory_daemon.sock',
                        help='Unix socket path')
    parser.add_argument('--quantize', action='store_true',
                        help='Enable binary quantization')
    
    args = parser.parse_args()
    
    daemon = VectorMemoryAgent(
        db_url=args.db_url,
        socket_path=args.socket,
        enable_quantization=args.quantize
    )
    
    if not daemon.connect():
        print("❌ Failed to connect to database")
        return
    
    try:
        await daemon.start_server()
    except KeyboardInterrupt:
        print("\n🛑 Shutting down...")
        daemon.stop()


if __name__ == '__main__':
    asyncio.run(main())
