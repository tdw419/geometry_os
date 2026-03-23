// =============================================================================
// Y-WebRTC Adapter - Peer-to-Peer Chunk Sharing for Infinite Map
// =============================================================================
//
// Replaces centralized Yjs WS with peer-to-peer mesh using y-webrtc.
// Reduces server load by having peers share chunks directly.
//
// Usage:
//   import { YWebRTCAdapter } from './ywebrtc_adapter.js';
//   const adapter = new YWebRTCAdapter();
//   await adapter.connect();
//   const doc = adapter.getDoc();
//
// =============================================================================

import * as Y from 'yjs';
import { WebrtcProvider } from 'y-webrtc';

export class YWebRTCAdapter {
  constructor(docName = 'geometry-os-map') {
    this.docName = docName;
    this.ydoc = null;
    this.provider = null;
    this.peerId = null;
    this.connectedPeers = new Set();
    
    // Chunk sharing config
    this.maxChunksPerPeer = 10; // Limit chunks shared with each peer
    this.chunkUpdateThreshold = 50; // Min pixels changed before sync
  }

  /**
   * Connect to the WebRTC mesh network.
   */
  async connect() {
    console.log('Connecting to Y-WebRTC mesh...');
    
    // Generate unique peer ID
    this.peerId = `peer_${this._generateId()}`;
    
    // Create Yjs document
    this.ydoc = new Y.Doc();
    
    // Initialize WebRTC provider with signaling servers
    this.provider = new WebrtcProvider(this.docName, this.ydoc, {
      signal: [
        'wss://signal.y-crdt.com',  // Public signaling server
        // Add custom signaling if needed:
        // 'wss://your-signaling-server.com'
      ],
      id: this.peerId,
    });

    // Track peer connections
    this.provider.on('peer', (peerId) => {
      this.connectedPeers.add(peerId);
      console.log(`Peer connected: ${peerId} (${this.connectedPeers.size} total)`);
    });

    this.provider.on('connection-close', (peerId) => {
      this.connectedPeers.delete(peerId);
      console.log(`Peer disconnected: ${peerId} (${this.connectedPeers.size} remaining)`);
    });

    // Wait for initial connection
    await new Promise(resolve => setTimeout(resolve, 1000));
    
    console.log(`✓ Connected as ${this.peerId}`);
    return this.ydoc;
  }

  /**
   * Get the Yjs document.
   */
  getDoc() {
    if (!this.ydoc) {
      throw new Error('Not connected. Call connect() first.');
    }
    return this.ydoc;
  }

  /**
   * Share a chunk with the mesh.
   */
  shareChunk(chunkKey, chunkData) {
    const doc = this.getDoc();
    const chunks = doc.getMap('chunks');
    
    // Encode chunk data as ArrayBuffer
    const encoded = this._encodeChunk(chunkData);
    chunks.set(chunkKey, encoded);
    
    console.log(`Shared chunk: ${chunkKey} (${encoded.byteLength} bytes)`);
  }

  /**
   * Request a chunk from the mesh.
   */
  async requestChunk(chunkKey) {
    const doc = this.getDoc();
    const chunks = doc.getMap('chunks');
    
    if (chunks.has(chunkKey)) {
      return this._decodeChunk(chunks.get(chunkKey));
    }
    
    // Chunk not in local state - will be synced from peers
    console.log(`Requesting chunk from mesh: ${chunkKey}`);
    return null;
  }

  /**
   * Remove a chunk (e.g., when it goes out of view).
   */
  removeChunk(chunkKey) {
    const doc = this.getDoc();
    const chunks = doc.getMap('chunks');
    chunks.delete(chunkKey);
  }

  /**
   * Get list of connected peers.
   */
  getPeers() {
    return Array.from(this.connectedPeers);
  }

  /**
   * Disconnect from the mesh.
   */
  disconnect() {
    if (this.provider) {
      this.provider.destroy();
      this.provider = null;
    }
    this.ydoc = null;
    this.connectedPeers.clear();
    console.log('Disconnected from Y-WebRTC mesh');
  }

  /**
   * Encode chunk data for CRDT sync.
   */
  _encodeChunk(chunkData) {
    // Convert chunk pixels to compact binary format
    const encoder = new TextEncoder();
    const metadata = {
      x: chunkData.x,
      y: chunkData.y,
      size: chunkData.size,
      timestamp: Date.now()
    };
    
    // Combine metadata + pixel data
    const metaStr = JSON.stringify(metadata);
    const combined = new Uint8Array(metaStr.length + chunkData.pixels.length);
    combined.set(encoder.encode(metaStr), 0);
    combined.set(chunkData.pixels, metaStr.length);
    
    return combined;
  }

  /**
   * Decode chunk data from CRDT.
   */
  _decodeChunk(encoded) {
    const decoder = new TextDecoder();
    
    // Find JSON end (simple heuristic)
    let endIdx = 0;
    let braceCount = 0;
    for (let i = 0; i < encoded.length; i++) {
      const char = String.fromCharCode(encoded[i]);
      if (char === '{') braceCount++;
      if (char === '}') {
        braceCount--;
        if (braceCount === 0) {
          endIdx = i + 1;
          break;
        }
      }
    }
    
    const metaStr = decoder.decode(encoded.slice(0, endIdx));
    const metadata = JSON.parse(metaStr);
    
    return {
      ...metadata,
      pixels: encoded.slice(endIdx)
    };
  }

  /**
   * Generate unique ID.
   */
  _generateId() {
    return Math.random().toString(36).substring(2, 10);
  }
}

// =============================================================================
// CHUNK PRE-COMPUTER (for RTX 5090 sidecar)
// =============================================================================

export class ChunkPrecomputer {
  constructor(ywebrtcAdapter) {
    this.adapter = ywebrtcAdapter;
    this.pendingChunks = new Map();
    this.isProcessing = false;
  }

  /**
   * Start pre-computation loop.
   */
  start() {
    setInterval(() => {
      this._processQueue();
    }, 500); // Check every 500ms
  }

  /**
   * Queue a chunk for pre-computation.
   */
  queueChunk(chunkKey, computeFn) {
    this.pendingChunks.set(chunkKey, { computeFn, queuedAt: Date.now() });
  }

  /**
   * Process pending chunks.
   */
  _processQueue() {
    if (this.isProcessing) return;
    
    this.isProcessing = true;
    
    for (const [key, data] of this.pendingChunks.entries()) {
      // Skip old entries
      if (Date.now() - data.queuedAt > 5000) {
        this.pendingChunks.delete(key);
        continue;
      }
      
      try {
        // Execute pre-computation
        const result = data.computeFn();
        
        // Share with mesh
        if (result) {
          this.adapter.shareChunk(key, result);
          console.log(`Pre-computed and shared: ${key}`);
        }
        
        this.pendingChunks.delete(key);
      } catch (err) {
        console.error(`Pre-computation failed for ${key}:`, err);
        this.pendingChunks.delete(key); // Don't retry failed chunks
      }
    }
    
    this.isProcessing = false;
  }
}

// =============================================================================
// DEMO USAGE
// =============================================================================

if (typeof window !== 'undefined') {
  window.YWebRTCAdapter = YWebRTCAdapter;
  window.ChunkPrecomputer = ChunkPrecomputer;
}
