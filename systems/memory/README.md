# Vector Memory System - The "Hippocampus" of Geometry OS

## Overview

The Vector Memory System provides long-term semantic memory for Geometry OS using PostgreSQL with the pgvector extension. It stores every "Thought Pixel" ever generated and enables fast semantic similarity search for retrieving related thoughts from past sessions.

## Architecture

```
LM Studio → LMStudioBridge → Vector Memory Daemon → PostgreSQL (pgvector)
                          ↓
                    Evolution Daemon → Infinite Map
```

### Components

1. **Vector Memory Daemon** ([`vector_memory_daemon.py`](vector_memory_daemon.py))
   - Unix socket server for receiving thought updates
   - PostgreSQL client with pgvector integration
   - Semantic similarity search using HNSW indexes
   - Memory beam generation for visualization

2. **Thought Pixel** ([`ThoughtPixel`](vector_memory_daemon.py:34))
   - Represents a single thought with embedding
   - Includes Hilbert coordinates for spatial mapping
   - Stores metadata (layer, activation, session, timestamp)

3. **Setup Script** ([`setup_postgres.sh`](setup_postgres.sh))
   - Automated PostgreSQL + pgvector installation
   - Database and user creation
   - Extension enablement

4. **Test Suite** ([`test_vector_memory.py`](test_vector_memory.py))
   - Comprehensive tests for all functionality
   - Performance benchmarks
   - Integration tests

## Features

### Core Capabilities

- **Semantic Storage**: Store thought pixels with vector embeddings
- **Fast Retrieval**: <50ms semantic neighborhood queries using HNSW indexes
- **Memory Beams**: Visual connections between current cursor and historic locations
- **Ghost Pixels**: Low-opacity visualization of retrieved memories
- **Session Organization**: Group thoughts by session for temporal queries
- **Performance Monitoring**: Track store/retrieve statistics

### Performance Targets

- **Retrieval Latency**: <50ms for semantic neighborhood queries
- **Storage Efficiency**: ~1KB per thought pixel (with quantization)
- **Throughput**: 1000+ stores/second, 100+ retrievals/second
- **Scalability**: Millions of thought pixels with linear performance degradation

## Installation

### Prerequisites

- PostgreSQL 14+
- Python 3.8+
- pip

### Quick Start

```bash
# 1. Run setup script
cd systems/memory
bash setup_postgres.sh

# 2. Install Python dependencies
pip3 install --user psycopg2-binary pgvector numpy

# 3. Start the Vector Memory Daemon
python3 vector_memory_daemon.py \
    --db-url postgresql://geometry_os:geometry_os@localhost/geometry_os \
    --socket /tmp/vector_memory_daemon.sock
```

### Manual Setup

```bash
# Install PostgreSQL
sudo apt-get install postgresql postgresql-contrib

# Install pgvector extension
cd /tmp
git clone --branch v0.5.1 https://github.com/pgvector/pgvector.git
cd pgvector
make
sudo make install

# Create database
sudo -u postgres psql -c "CREATE DATABASE geometry_os;"
sudo -u postgres psql -c "CREATE USER geometry_os WITH PASSWORD 'geometry_os';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE geometry_os TO geometry_os;"

# Enable pgvector extension
sudo -u postgres psql -d geometry_os -c "CREATE EXTENSION vector;"

# Install Python dependencies
pip3 install --user psycopg2-binary pgvector numpy
```

## Usage

### Starting the Daemon

```bash
python3 systems/memory/vector_memory_daemon.py \
    --db-url postgresql://geometry_os:geometry_os@localhost/geometry_os \
    --socket /tmp/vector_memory_daemon.sock
```

### Command-Line Options

- `--db-url`: PostgreSQL connection URL (default: `postgresql://localhost/geometry_os`)
- `--socket`: Unix socket path (default: `/tmp/vector_memory_daemon.sock`)
- `--quantize`: Enable binary quantization (experimental)

### Storing Thoughts

```python
import socket
import json
import numpy as np
import time

# Connect to daemon
sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
sock.connect('/tmp/vector_memory_daemon.sock')

# Create thought message
message = {
    'message_type': 'StoreThought',
    'payload': {
        'token_id': 1234,
        'token': 'hello',
        'embedding': np.random.rand(1536).tolist(),
        'hilbert_x': 0.5,
        'hilbert_y': 0.5,
        'layer': 0,
        'activation': 1.0,
        'session_id': 'my_session',
        'timestamp': time.time()
    }
}

# Send message
sock.send(json.dumps(message).encode('utf-8'))

# Receive response
response = json.loads(sock.recv(4096).decode('utf-8'))
print(response)  # {'message_type': 'StoreThoughtResponse', 'success': True, ...}

sock.close()
```

### Recalling Memories

```python
# Connect to daemon
sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
sock.connect('/tmp/vector_memory_daemon.sock')

# Create recall message
message = {
    'message_type': 'RecallMemories',
    'payload': {
        'query_vector': np.random.rand(1536).tolist(),
        'limit': 100,
        'threshold': 0.7,
        'exclude_session': 'current_session'
    }
}

# Send message
sock.send(json.dumps(message).encode('utf-8'))

# Receive response
response = json.loads(sock.recv(65536).decode('utf-8'))
memories = response['memories']

for memory in memories:
    print(f"{memory['token']} (similarity: {memory['similarity']:.3f})")

sock.close()
```

### Getting Memory Beam

```python
# Connect to daemon
sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
sock.connect('/tmp/vector_memory_daemon.sock')

# Create memory beam message
message = {
    'message_type': 'GetMemoryBeam',
    'payload': {
        'query_vector': np.random.rand(1536).tolist(),
        'current_x': 0.5,
        'current_y': 0.5,
        'limit': 20
    }
}

# Send message
sock.send(json.dumps(message).encode('utf-8'))

# Receive response
response = json.loads(sock.recv(65536).decode('utf-8'))
beam = response['beam']

for memory in beam:
    print(f"{memory['token']} at ({memory['hilbert_x']:.2f}, {memory['hilbert_y']:.2f}) "
          f"similarity: {memory['similarity']:.3f}, "
          f"spatial_distance: {memory['spatial_distance']:.3f}")

sock.close()
```

## Testing

### Running Tests

```bash
# Run all tests
python3 systems/memory/test_vector_memory.py

# Run quick tests (skip performance benchmark)
python3 systems/memory/test_vector_memory.py --quick

# Run with custom database URL
python3 systems/memory/test_vector_memory.py \
    --db-url postgresql://user:pass@localhost:5432/geometry_os
```

### Test Coverage

The test suite includes:

1. **Store Thought**: Test storing a single thought pixel
2. **Store Batch**: Test storing multiple thoughts
3. **Recall Semantic Neighborhood**: Test semantic similarity search
4. **Get Memory Beam**: Test memory beam generation
5. **Get Session Stats**: Test session statistics
6. **Performance Benchmark**: Test performance with large dataset

## Integration

### LMStudioBridge Integration

```python
# In LMStudioBridge
async def send_token_activation(self, token: str, token_id: int, 
                                embedding: np.ndarray, layer: int = 0):
    """Send token activation to both compositor and memory daemon"""
    
    # Send to compositor (existing)
    message = self.create_token_message(token, token_id, embedding, layer)
    await self.send_to_compositor(message)
    
    # Send to memory daemon (new)
    thought = ThoughtPixel(
        token_id=token_id,
        token=token,
        embedding=embedding,
        hilbert_x=message['payload']['hilbert_position'][0],
        hilbert_y=message['payload']['hilbert_position'][1],
        layer=layer,
        timestamp=time.time()
    )
    await self.send_to_memory_daemon(thought)
```

### InputInteractionAgent Integration

```python
# In InputInteractionAgent
async def handle_semantic_drag(self, start_pos: Tuple[float, float], 
                               end_pos: Tuple[float, float]):
    """Handle semantic drag gesture (Middle Mouse + Shift)"""
    
    # Get current context embedding
    query_vector = await self.get_context_embedding()
    
    # Query memory daemon
    memories = await self.recall_memories(
        query_vector=query_vector,
        current_x=end_pos[0],
        current_y=end_pos[1],
        limit=20
    )
    
    # Send memory beam data to renderer
    await self.send_memory_beam(memories)
```

### GraphicsRenderingAgent Integration

```wgsl
// WGSL shader for memory beam visualization
struct MemoryBeam {
    start_pos: vec2<f32>,
    end_pos: vec2<f32>,
    similarity: f32,
    timestamp: f32,
};

@group(0) @binding(0) var<uniform> beams: array<MemoryBeam>;

@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    // Cyan color with varying opacity based on similarity
    let similarity = beams[in.instance_index].similarity;
    let alpha = similarity * 0.8;
    return vec4<f32>(0.0, 1.0, 1.0, alpha);
}
```

## Schema

### Database Schema

```sql
-- Core thought_pixels table
CREATE TABLE thought_pixels (
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

-- HNSW index for fast similarity search
CREATE INDEX thought_pixels_embedding_idx 
ON thought_pixels USING hnsw (embedding vector_cosine_ops);

-- Session index for temporal queries
CREATE INDEX thought_pixels_session_idx 
ON thought_pixels(session_id);

-- Timestamp index for chronological queries
CREATE INDEX thought_pixels_timestamp_idx 
ON thought_pixels(timestamp DESC);
```

## Performance

### Benchmarks

Based on test results with 1000 thought pixels:

- **Average Store Time**: ~1ms per thought
- **Average Query Time**: ~10ms for 10 results
- **P95 Query Time**: ~15ms
- **P99 Query Time**: ~20ms
- **Throughput**: 1000+ stores/second, 100+ retrievals/second

### Optimization Tips

1. **Use HNSW Indexes**: Essential for fast similarity search
2. **Batch Operations**: Store thoughts in batches when possible
3. **Connection Pooling**: Use connection pooling for high throughput
4. **Limit Results**: Use appropriate `limit` parameter for queries
5. **Set Threshold**: Use `threshold` to filter low-similarity results

## Troubleshooting

### Connection Issues

```bash
# Check if PostgreSQL is running
sudo -u postgres pg_ctl status

# Start PostgreSQL
sudo -u postgres pg_ctl start

# Check if pgvector is installed
sudo -u postgres psql -c "SELECT * FROM pg_extension WHERE extname = 'vector';"
```

### Performance Issues

```sql
-- Check query performance
EXPLAIN ANALYZE 
SELECT token, token_id, 1 - (embedding <=> '[...]') as similarity
FROM thought_pixels
ORDER BY embedding <=> '[...]'
LIMIT 10;

-- Rebuild indexes if needed
REINDEX INDEX thought_pixels_embedding_idx;
```

### Memory Issues

```sql
-- Check database size
SELECT pg_size_pretty(pg_database_size('geometry_os'));

-- Check table size
SELECT pg_size_pretty(pg_total_relation_size('thought_pixels'));

-- Archive old sessions
DELETE FROM thought_pixels 
WHERE created_at < NOW() - INTERVAL '90 days';
```

## API Reference

### Message Types

#### StoreThought

```json
{
  "message_type": "StoreThought",
  "payload": {
    "token_id": 1234,
    "token": "hello",
    "embedding": [0.1, 0.2, ...],
    "hilbert_x": 0.5,
    "hilbert_y": 0.5,
    "layer": 0,
    "activation": 1.0,
    "session_id": "my_session",
    "timestamp": 1234567890.0
  }
}
```

#### RecallMemories

```json
{
  "message_type": "RecallMemories",
  "payload": {
    "query_vector": [0.1, 0.2, ...],
    "limit": 100,
    "threshold": 0.7,
    "exclude_session": "current_session"
  }
}
```

#### GetMemoryBeam

```json
{
  "message_type": "GetMemoryBeam",
  "payload": {
    "query_vector": [0.1, 0.2, ...],
    "current_x": 0.5,
    "current_y": 0.5,
    "limit": 20
  }
}
```

#### GetStats

```json
{
  "message_type": "GetStats",
  "payload": {}
}
```

## Contributing

See the [OpenSpec proposal](../../openspec/changes/042_postgresql_hippocampus/proposal.md) for the full specification and implementation plan.

## License

See the main Geometry OS license.

## References

- [PostgreSQL](https://www.postgresql.org/)
- [pgvector](https://github.com/pgvector/pgvector)
- [HNSW Algorithm](https://arxiv.org/abs/1603.09320)
- [OpenSpec Proposal](../../openspec/changes/042_postgresql_hippocampus/proposal.md)
