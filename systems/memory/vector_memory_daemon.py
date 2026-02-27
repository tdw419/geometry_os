#!/usr/bin/env python3
import asyncio, json, os, socket, time, sqlite3, sys
from dataclasses import dataclass, asdict
from pathlib import Path
import numpy as np

try:
    import psycopg2
    from pgvector.psycopg2 import register_vector
    HAS_PG = True
except ImportError:
    HAS_PG = False

@dataclass
class ThoughtPixel:
    token_id: int; token: str; embedding: np.ndarray; hilbert_x: float; hilbert_y: float
    layer: int = 0; activation: float = 1.0; session_id: str = ""; timestamp: float = 0.0

class VectorMemoryAgent:
    def __init__(self, db_url="postgresql://localhost/geometry_os", socket_path=".gos_pids/vector_memory_daemon.sock"):
        self.db_url = db_url; self.socket_path = socket_path; self.conn = None; self.cur = None
        self.is_sqlite = False; self.running = False; self.session_id = f"session_{int(time.time())}"
        self.store_count = 0; self.retrieve_count = 0

    def connect(self):
        if self.db_url.startswith("sqlite://"): return self._connect_sqlite()
        if not HAS_PG:
            print("⚠️ Postgres driver missing, using SQLite fallback.")
            self.db_url = "sqlite:///home/jericho/zion/projects/geometry_os/geometry_os/memory/hippocampus.db"
            return self._connect_sqlite()
        try:
            self.conn = psycopg2.connect(self.db_url)
            self.cur = self.conn.cursor()
            register_vector(self.conn)
            self._init_pg_schema()
            return True
        except:
            self.db_url = "sqlite:///home/jericho/zion/projects/geometry_os/geometry_os/memory/hippocampus.db"
            return self._connect_sqlite()

    def _connect_sqlite(self):
        db_path = self.db_url.replace("sqlite://", "")
        os.makedirs(os.path.dirname(os.path.abspath(db_path)), exist_ok=True)
        self.conn = sqlite3.connect(db_path); self.cur = self.conn.cursor(); self.is_sqlite = True
        self.cur.execute("CREATE TABLE IF NOT EXISTS thought_pixels (id INTEGER PRIMARY KEY AUTOINCREMENT, token_id INTEGER, token TEXT, embedding BLOB, hilbert_x REAL, hilbert_y REAL, layer INTEGER, activation REAL, session_id TEXT, timestamp REAL, created_at DATETIME DEFAULT CURRENT_TIMESTAMP)")
        self.conn.commit()
        print(f"✅ SQLite connected: {db_path}")
        return True

    def _init_pg_schema(self):
        self.cur.execute("CREATE TABLE IF NOT EXISTS thought_pixels (id SERIAL PRIMARY KEY, token_id INTEGER, token TEXT, embedding vector(1536), hilbert_x FLOAT, hilbert_y FLOAT, layer INTEGER, activation FLOAT, session_id TEXT, timestamp FLOAT, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)")
        self.conn.commit()

    def store_thought(self, thought):
        try:
            if self.is_sqlite:
                self.cur.execute("INSERT INTO thought_pixels (token_id, token, embedding, hilbert_x, hilbert_y, layer, activation, session_id, timestamp) VALUES (?,?,?,?,?,?,?,?,?)", (thought.token_id, thought.token, thought.embedding.astype(np.float32).tobytes(), thought.hilbert_x, thought.hilbert_y, thought.layer, thought.activation, thought.session_id or self.session_id, thought.timestamp or time.time()))
            else:
                self.cur.execute("INSERT INTO thought_pixels (token_id, token, embedding, hilbert_x, hilbert_y, layer, activation, session_id, timestamp) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)", (thought.token_id, thought.token, thought.embedding, thought.hilbert_x, thought.hilbert_y, thought.layer, thought.activation, thought.session_id or self.session_id, thought.timestamp or time.time()))
            self.conn.commit(); self.store_count += 1; return True
        except Exception as e: print(f"❌ Store error: {e}"); return False

    def recall_semantic_neighborhood(self, query_vector, limit=100, threshold=0.0, exclude_session=None):
        try:
            self.cur.execute("SELECT token_id, token, hilbert_x, hilbert_y, layer, activation, session_id, timestamp, embedding FROM thought_pixels")
            rows = self.cur.fetchall(); similarities = []; q_norm = np.linalg.norm(query_vector)
            for r in rows:
                if exclude_session and r[6] == exclude_session: continue
                emb = np.frombuffer(r[8], dtype=np.float32) if self.is_sqlite else np.array(r[8])
                sim = np.dot(query_vector, emb) / (q_norm * np.linalg.norm(emb) + 1e-9)
                if sim >= threshold: similarities.append((r, sim))
            similarities.sort(key=lambda x: x[1], reverse=True)
            return [{"token_id": r[0], "token": r[1], "hilbert_x": r[2], "hilbert_y": r[3], "similarity": float(s)} for r, s in similarities[:limit]]
        except Exception as e: print(f"❌ Recall error: {e}"); return []

    async def start_server(self):
        if os.path.exists(self.socket_path): os.remove(self.socket_path)
        server = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM); server.bind(self.socket_path); server.listen(5); server.setblocking(False)
        print(f"🚀 Listening on {self.socket_path}"); self.running = True; loop = asyncio.get_event_loop()
        while self.running:
            client, _ = await loop.sock_accept(server); loop.create_task(self.handle_client(client))

    async def handle_client(self, client):
        try:
            data = await asyncio.get_event_loop().sock_recv(client, 65536)
            if not data: return
            msg = json.loads(data.decode('utf-8')); p = msg.get('payload', {})
            if msg.get('message_type') == 'StoreThought':
                t = ThoughtPixel(p.get('token_id', 0), p.get('token', ''), np.array(p.get('embedding', [])), p.get('hilbert_x', 0.0), p.get('hilbert_y', 0.0), p.get('layer', 0), p.get('activation', 1.0), p.get('session_id', ''), p.get('timestamp', 0.0))
                client.send(json.dumps({'success': self.store_thought(t)}).encode('utf-8'))
            elif msg.get('message_type') == 'RecallMemories':
                client.send(json.dumps({'memories': self.recall_semantic_neighborhood(np.array(p.get('query_vector', [])), p.get('limit', 100))}).encode('utf-8'))
            elif msg.get('message_type') == 'GetMemoryBeam':
                mem = self.recall_semantic_neighborhood(np.array(p.get('query_vector', [])), p.get('limit', 20))
                for m in mem: m['spatial_distance'] = np.sqrt((m['hilbert_x']-p.get('current_x',0))**2 + (m['hilbert_y']-p.get('current_y',0))**2)
                mem.sort(key=lambda x: x['similarity']*0.7 + (1.0/(x['spatial_distance']+0.01))*0.3, reverse=True)
                client.send(json.dumps({'beam': mem}).encode('utf-8'))
        except Exception as e: print(f"❌ Client error: {e}")
        finally: client.close()

async def main():
    import argparse
    parser = argparse.ArgumentParser(); parser.add_argument('--db-url', default='postgresql://localhost/geometry_os'); parser.add_argument('--socket', default='/tmp/vector_memory_daemon.sock')
    args = parser.parse_args(); daemon = VectorMemoryAgent(db_url=args.db_url, socket_path=args.socket)
    if daemon.connect(): await daemon.start_server()

if __name__ == '__main__': asyncio.run(main())
