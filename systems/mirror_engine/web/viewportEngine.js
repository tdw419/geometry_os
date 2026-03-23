/**
 * Viewport Culling Engine — Infinite Canvas Chunk Manager
 *
 * Manages chunks of frame buffer data for an infinite scrolling canvas.
 * Only loads chunks visible on screen + pre-fetches adjacent chunks.
 * Uses Yjs + WebRTC for P2P sync per chunk.
 *
 * Chunk naming: vision_os_{x}_{y} where x,y are chunk coordinates
 * Each chunk: 256x256 pixels
 */

// =============================================================================
// IMPORTS
// =============================================================================

import { HexDecoder, SPATIAL_TOKENS } from './hexDecoder.js';

// =============================================================================
// CONFIGURATION
// =============================================================================

export const CHUNK_SIZE = 256;           // Pixels per chunk
export const PRE_FETCH_MARGIN = 1;       // Chunks beyond screen to pre-fetch
export const UNLOAD_MARGIN = 3;          // Chunks beyond this margin get unloaded
export const CAMERA_SMOOTHING = 0.15;    // Damping factor (0-1, lower = smoother)
export const CAMERA_MAX_SPEED = 50;      // Max pixels per frame

// Security Pulse Configuration
export const PULSE_CONFIG = {
  pulseSpeed: 60,        // Frames per pulse cycle
  minOpacity: 0.4,
  maxOpacity: 1.0,
};

// Agent signature ranges
export const AGENT_SIG_RANGES = {
  human: { start: 0x100, end: 0x200 },
  ai: { start: 0x200, end: 0x300 },
  system: { start: 0x300, end: 0x400 },
};


// =============================================================================
// CAMERA CLASS — Smooth Camera Movement
// =============================================================================

export class Camera {
  constructor(x = 0, y = 0) {
    // Current position (rendered)
    this.x = x;
    this.y = y;

    // Target position (where camera wants to be)
    this.targetX = x;
    this.targetY = y;

    // Velocity for momentum
    this.velocityX = 0;
    this.velocityY = 0;

    // Zoom
    this.zoom = 1;
    this.targetZoom = 1;
  }

  /**
   * Set camera target position (will smooth to this)
   */
  setTarget(x, y) {
    this.targetX = x;
    this.targetY = y;
  }

  /**
   * Immediately snap to position (no smoothing)
   */
  snapTo(x, y) {
    this.x = x;
    this.y = y;
    this.targetX = x;
    this.targetY = y;
    this.velocityX = 0;
    this.velocityY = 0;
  }

  /**
   * Move camera by delta (with smoothing)
   */
  move(dx, dy) {
    this.targetX += dx;
    this.targetY += dy;
  }

  /**
   * Zoom camera
   */
  zoomBy(factor, centerX = null, centerY = null) {
    this.targetZoom *= factor;
    this.targetZoom = Math.max(0.1, Math.min(5, this.targetZoom));

    // Zoom toward a point if provided
    if (centerX !== null && centerY !== null) {
      const zoomDelta = this.targetZoom - this.zoom;
      this.targetX -= (centerX - this.x) * zoomDelta / this.zoom;
      this.targetY -= (centerY - this.y) * zoomDelta / this.zoom;
    }
  }

  /**
   * Update camera position with damping/smoothing
   * Returns true if camera is still moving
   */
  update() {
    // Calculate spring force toward target
    const dx = this.targetX - this.x;
    const dy = this.targetY - this.y;

    // Apply smoothing with velocity limiting
    let moveX = dx * CAMERA_SMOOTHING;
    let moveY = dy * CAMERA_SMOOTHING;

    // Limit max speed
    const speed = Math.sqrt(moveX * moveX + moveY * moveY);
    if (speed > CAMERA_MAX_SPEED) {
      moveX = (moveX / speed) * CAMERA_MAX_SPEED;
      moveY = (moveY / speed) * CAMERA_MAX_SPEED;
    }

    // Apply movement
    this.x += moveX;
    this.y += moveY;

    // Zoom smoothing
    const zoomDx = this.targetZoom - this.zoom;
    this.zoom += zoomDx * CAMERA_SMOOTHING;

    // Return true if still moving significantly
    const isMoving = Math.abs(dx) > 0.5 || Math.abs(dy) > 0.5 || Math.abs(zoomDx) > 0.001;
    return isMoving;
  }

  /**
   * Convert screen coordinates to world coordinates
   */
  screenToWorld(screenX, screenY, screenWidth, screenHeight) {
    const worldX = this.x + (screenX - screenWidth / 2) / this.zoom;
    const worldY = this.y + (screenY - screenHeight / 2) / this.zoom;
    return { x: worldX, y: worldY };
  }

  /**
   * Convert world coordinates to screen coordinates
   */
  worldToScreen(worldX, worldY, screenWidth, screenHeight) {
    const screenX = (worldX - this.x) * this.zoom + screenWidth / 2;
    const screenY = (worldY - this.y) * this.zoom + screenHeight / 2;
    return { x: screenX, y: screenY };
  }

  /**
   * Get visible world bounds
   */
  getVisibleBounds(screenWidth, screenHeight) {
    const topLeft = this.screenToWorld(0, 0, screenWidth, screenHeight);
    const bottomRight = this.screenToWorld(screenWidth, screenHeight, screenWidth, screenHeight);
    return {
      minX: topLeft.x,
      minY: topLeft.y,
      maxX: bottomRight.x,
      maxY: bottomRight.y
    };
  }
}


// =============================================================================
// CHUNK MANAGER — Load/Unload Chunks
// =============================================================================

export class ChunkManager {
  constructor(options = {}) {
    this.chunkSize = options.chunkSize || CHUNK_SIZE;
    this.preFetchMargin = options.preFetchMargin || PRE_FETCH_MARGIN;
    this.unloadMargin = options.unloadMargin || UNLOAD_MARGIN;

    // Active chunks: Map<chunkId, ChunkData>
    // ChunkData = { doc, provider, pixels, loaded, loading }
    this.activeChunks = new Map();

    // Reference to Yjs/Webrtc (injected)
    this.Y = options.Y || window.Y;
    this.WebrtcProvider = options.WebrtcProvider || window.WebrtcProvider;

    // Callbacks
    this.onChunkLoaded = options.onChunkLoaded || (() => {});
    this.onChunkUnloaded = options.onChunkUnloaded || (() => {});

    // Stats
    this.stats = {
      loaded: 0,
      unloaded: 0,
      active: 0
    };
  }

  /**
   * Calculate which chunks are visible on screen
   * @returns {{startX, endX, startY, endY}} Chunk coordinate bounds
   */
  calculateChunksOnScreen(cameraX, cameraY, screenWidth, screenHeight) {
    // Convert screen bounds to chunk coordinates
    const halfW = screenWidth / 2;
    const halfH = screenHeight / 2;

    // World coordinates of screen edges
    const worldLeft = cameraX - halfW;
    const worldRight = cameraX + halfW;
    const worldTop = cameraY - halfH;
    const worldBottom = cameraY + halfH;

    // Chunk coordinates (may be negative for left/up of origin)
    const startX = Math.floor(worldLeft / this.chunkSize);
    const endX = Math.ceil(worldRight / this.chunkSize);
    const startY = Math.floor(worldTop / this.chunkSize);
    const endY = Math.ceil(worldBottom / this.chunkSize);

    return { startX, endX, startY, endY };
  }

  /**
   * Get chunk ID from chunk coordinates
   */
  getChunkId(chunkX, chunkY) {
    return `vision_os_${chunkX}_${chunkY}`;
  }

  /**
   * Parse chunk ID to coordinates
   */
  parseChunkId(chunkId) {
    const match = chunkId.match(/vision_os_(-?\d+)_(-?\d+)/);
    if (!match) return null;
    return {
      x: parseInt(match[1]),
      y: parseInt(match[2])
    };
  }

  /**
   * Get world position of chunk origin (top-left)
   */
  getChunkWorldPos(chunkX, chunkY) {
    return {
      x: chunkX * this.chunkSize,
      y: chunkY * this.chunkSize
    };
  }

  /**
   * Load a new chunk — joins Yjs room, fetches buffer
   */
  async loadChunk(chunkX, chunkY) {
    const chunkId = this.getChunkId(chunkX, chunkY);

    // Already loaded or loading?
    if (this.activeChunks.has(chunkId)) {
      const chunk = this.activeChunks.get(chunkId);
      if (chunk.loaded || chunk.loading) {
        return chunk;
      }
    }

    // Create chunk entry
    const chunk = {
      id: chunkId,
      x: chunkX,
      y: chunkY,
      worldX: chunkX * this.chunkSize,
      worldY: chunkY * this.chunkSize,
      doc: null,
      provider: null,
      pixels: null,
      loaded: false,
      loading: true,
      loadPromise: null
    };

    this.activeChunks.set(chunkId, chunk);

    // Start loading
    chunk.loadPromise = this._doLoadChunk(chunk);
    await chunk.loadPromise;

    return chunk;
  }

  async _doLoadChunk(chunk) {
    try {
      // Create Yjs document for this chunk
      chunk.doc = new this.Y.Y();

      // Create shared pixels map
      const ypixels = chunk.doc.getMap('pixels');

      // Connect via WebRTC
      chunk.provider = new this.WebrtcProvider(chunk.id, chunk.doc, {
        signaling: [
          'wss://signaling.yjs.dev',
          'wss://y-webrtc-signaling-eu.herokuapp.com'
        ]
      });

      // Wait for sync (with timeout)
      await Promise.race([
        new Promise(resolve => {
          chunk.provider.on('sync', resolve);
        }),
        new Promise(resolve => setTimeout(resolve, 5000)) // 5s timeout
      ]);

      // Create pixel buffer
      chunk.pixels = new Uint8ClampedArray(this.chunkSize * this.chunkSize * 4);
      // Fill with default background
      for (let i = 0; i < chunk.pixels.length; i += 4) {
        chunk.pixels[i] = 10;
        chunk.pixels[i + 1] = 10;
        chunk.pixels[i + 2] = 20;
        chunk.pixels[i + 3] = 255;
      }

      // Load pixels from Yjs
      for (const [key, hex] of ypixels) {
        const [localX, localY] = key.split(',').map(Number);
        if (localX >= 0 && localX < this.chunkSize &&
            localY >= 0 && localY < this.chunkSize) {
          const idx = (localY * this.chunkSize + localX) * 4;
          chunk.pixels[idx] = parseInt(hex.slice(0, 2), 16);
          chunk.pixels[idx + 1] = parseInt(hex.slice(2, 4), 16);
          chunk.pixels[idx + 2] = parseInt(hex.slice(4, 6), 16);
        }
      }

      // Watch for updates
      ypixels.observe((event) => {
        if (event.transaction.local) return;
        for (const [key, change] of event.changes.keys) {
          if (change.action === 'add' || change.action === 'update') {
            const [localX, localY] = key.split(',').map(Number);
            const hex = ypixels.get(key);
            const idx = (localY * this.chunkSize + localX) * 4;
            if (idx >= 0 && idx < chunk.pixels.length - 3) {
              chunk.pixels[idx] = parseInt(hex.slice(0, 2), 16);
              chunk.pixels[idx + 1] = parseInt(hex.slice(2, 4), 16);
              chunk.pixels[idx + 2] = parseInt(hex.slice(4, 6), 16);
            }
          }
        }
      });

      chunk.loaded = true;
      chunk.loading = false;
      this.stats.loaded++;
      this.stats.active = this.activeChunks.size;

      this.onChunkLoaded(chunk);

    } catch (error) {
      console.error(`Failed to load chunk ${chunk.id}:`, error);
      chunk.loading = false;
      // Keep in map for retry
    }
  }

  /**
   * Unload distant chunks to free memory
   */
  unloadDistantChunks(visibleStartX, visibleEndX, visibleStartY, visibleEndY) {
    const toUnload = [];

    for (const [chunkId, chunk] of this.activeChunks) {
      // Check if chunk is outside unload margin
      const outsideX = chunk.x < visibleStartX - this.unloadMargin ||
                       chunk.x > visibleEndX + this.unloadMargin;
      const outsideY = chunk.y < visibleStartY - this.unloadMargin ||
                       chunk.y > visibleEndY + this.unloadMargin;

      if (outsideX || outsideY) {
        toUnload.push(chunkId);
      }
    }

    // Unload chunks
    for (const chunkId of toUnload) {
      this.unloadChunk(chunkId);
    }

    return toUnload.length;
  }

  /**
   * Unload a specific chunk
   */
  unloadChunk(chunkId) {
    const chunk = this.activeChunks.get(chunkId);
    if (!chunk) return;

    // Disconnect WebRTC
    if (chunk.provider) {
      chunk.provider.disconnect();
      chunk.provider.destroy();
    }

    // Destroy Yjs doc
    if (chunk.doc) {
      chunk.doc.destroy();
    }

    // Remove from active
    this.activeChunks.delete(chunkId);

    this.stats.unloaded++;
    this.stats.active = this.activeChunks.size;

    this.onChunkUnloaded(chunk);
  }

  /**
   * Update visible chunks — load new, unload distant
   * @param {Camera} camera
   * @param {number} screenWidth
   * @param {number} screenHeight
   * @returns {Promise<string[]>} IDs of newly loaded chunks
   */
  async updateVisibleChunks(camera, screenWidth, screenHeight) {
    const bounds = camera.getVisibleBounds(screenWidth, screenHeight);

    // Calculate visible chunks
    const visible = this.calculateChunksOnScreen(
      camera.x, camera.y, screenWidth, screenHeight
    );

    // Expand for pre-fetching
    const startX = visible.startX - this.preFetchMargin;
    const endX = visible.endX + this.preFetchMargin;
    const startY = visible.startY - this.preFetchMargin;
    const endY = visible.endY + this.preFetchMargin;

    // Load new chunks
    const loadPromises = [];
    const loadedIds = [];

    for (let cy = startY; cy <= endY; cy++) {
      for (let cx = startX; cx <= endX; cx++) {
        const chunkId = this.getChunkId(cx, cy);
        if (!this.activeChunks.has(chunkId)) {
          loadPromises.push(this.loadChunk(cx, cy));
          loadedIds.push(chunkId);
        }
      }
    }

    // Unload distant chunks
    const unloadedCount = this.unloadDistantChunks(
      visible.startX, visible.endX,
      visible.startY, visible.endY
    );

    // Wait for all loads
    if (loadPromises.length > 0) {
      await Promise.all(loadPromises);
    }

    return loadedIds;
  }

  /**
   * Get all active chunks sorted by distance from camera
   */
  getSortedChunks(cameraX, cameraY) {
    const chunks = Array.from(this.activeChunks.values());
    chunks.sort((a, b) => {
      const distA = Math.abs(a.worldX - cameraX) + Math.abs(a.worldY - cameraY);
      const distB = Math.abs(b.worldX - cameraX) + Math.abs(b.worldY - cameraY);
      return distA - distB;
    });
    return chunks;
  }

  /**
   * Get chunk at world coordinates
   */
  getChunkAt(worldX, worldY) {
    const chunkX = Math.floor(worldX / this.chunkSize);
    const chunkY = Math.floor(worldY / this.chunkSize);
    const chunkId = this.getChunkId(chunkX, chunkY);
    return this.activeChunks.get(chunkId);
  }

  /**
   * Set pixel at world coordinates
   */
  setPixel(worldX, worldY, r, g, b, a = 255) {
    const chunk = this.getChunkAt(worldX, worldY);
    if (!chunk || !chunk.loaded) return false;

    // Local coordinates within chunk
    const localX = ((worldX % this.chunkSize) + this.chunkSize) % this.chunkSize;
    const localY = ((worldY % this.chunkSize) + this.chunkSize) % this.chunkSize;

    // Set in pixel buffer
    const idx = (localY * this.chunkSize + localX) * 4;
    chunk.pixels[idx] = r;
    chunk.pixels[idx + 1] = g;
    chunk.pixels[idx + 2] = b;
    chunk.pixels[idx + 3] = a;

    // Sync to Yjs
    const ypixels = chunk.doc.getMap('pixels');
    const key = `${localX},${localY}`;
    const hex = r.toString(16).padStart(2, '0').toUpperCase() +
                g.toString(16).padStart(2, '0').toUpperCase() +
                b.toString(16).padStart(2, '0').toUpperCase();
    ypixels.set(key, hex);

    return true;
  }

  /**
   * Get pixel at world coordinates
   */
  getPixel(worldX, worldY) {
    const chunk = this.getChunkAt(worldX, worldY);
    if (!chunk || !chunk.loaded) return null;

    const localX = ((worldX % this.chunkSize) + this.chunkSize) % this.chunkSize;
    const localY = ((worldY % this.chunkSize) + this.chunkSize) % this.chunkSize;

    const idx = (localY * this.chunkSize + localX) * 4;
    return {
      r: chunk.pixels[idx],
      g: chunk.pixels[idx + 1],
      b: chunk.pixels[idx + 2],
      a: chunk.pixels[idx + 3]
    };
  }
}


// =============================================================================
// VIEWPORT ENGINE — Main Entry Point
// =============================================================================

export class ViewportEngine {
  constructor(canvas, options = {}) {
    this.canvas = canvas;
    this.ctx = canvas.getContext('2d');

    this.camera = new Camera(options.cameraX || 0, options.cameraY || 0);
    this.chunkManager = new ChunkManager(options);

    this.screenWidth = canvas.width;
    this.screenHeight = canvas.height;

    this.running = false;
    this.lastUpdate = 0;
    this.frameCount = 0;

    // Input state
    this.keys = new Set();
    this.mouse = { x: 0, y: 0, down: false };

    // Security pulse for agents
    this.agentSignatures = options.agentSignatures || {};
    this.securityPulse = null;
    if (options.enableSecurityPulse !== false) {
      this._initSecurityPulse();
    }

    // Callbacks
    this.onUpdate = options.onUpdate || (() => {});
    this.onRender = options.onRender || (() => {});

    this._setupInput();
  }

  _initSecurityPulse() {
    // Inline SecurityPulse class for viewport integration
    this.securityPulse = {
      colors: {
        human: '#00FF00',
        ai: '#00FFFF',
        system: '#FF00FF',
        unauthorized: '#FF0000'
      },

      getAgentType(signature) {
        if (signature >= AGENT_SIG_RANGES.human.start && signature < AGENT_SIG_RANGES.human.end) return 'human';
        if (signature >= AGENT_SIG_RANGES.ai.start && signature < AGENT_SIG_RANGES.ai.end) return 'ai';
        if (signature >= AGENT_SIG_RANGES.system.start && signature < AGENT_SIG_RANGES.system.end) return 'system';
        return 'unauthorized';
      },

      getAgentColor(signature) {
        const type = this.getAgentType(signature);
        return this.colors[type];
      },

      calculatePulse(agentSignature, frame) {
        const agentType = this.getAgentType(agentSignature);
        const frequency = { human: 1.0, ai: 1.5, system: 0.5 }[agentType] || 1.0;
        const phase = (frame / PULSE_CONFIG.pulseSpeed) * Math.PI * 2 * frequency;
        const pulse = Math.sin(phase) * 0.5 + 0.5;
        return PULSE_CONFIG.minOpacity + pulse * (PULSE_CONFIG.maxOpacity - PULSE_CONFIG.minOpacity);
      },

      renderPulseRing(ctx, agentSignature, x, y, frame, radius = 20) {
        const opacity = this.calculatePulse(agentSignature, frame);
        const color = this.getAgentColor(agentSignature);
        ctx.save();
        ctx.globalAlpha = opacity * 0.3;
        ctx.beginPath();
        ctx.strokeStyle = color;
        ctx.lineWidth = 2;
        ctx.arc(x, y, radius + Math.sin(frame * 0.1) * 5, 0, Math.PI * 2);
        ctx.stroke();
        ctx.restore();
      },

      renderStatusIndicator(ctx, agents, frame, x = 10, y = 10) {
        ctx.save();
        ctx.font = '12px monospace';
        let yOffset = 0;
        for (const [sig, valid] of Object.entries(agents)) {
          const signature = parseInt(sig);
          const type = this.getAgentType(signature);
          const color = this.getAgentColor(signature);
          const opacity = this.calculatePulse(signature, frame);
          ctx.globalAlpha = opacity;
          ctx.fillStyle = color;
          ctx.fillText(`0x${signature.toString(16).toUpperCase().padStart(3, '0')} ${type.toUpperCase()} ${valid ? '✓' : '✗'}`, x, y + yOffset);
          yOffset += 15;
        }
        ctx.restore();
      }
    };
  }

  _setupInput() {
    // Keyboard
    window.addEventListener('keydown', (e) => {
      this.keys.add(e.code);
    });
    window.addEventListener('keyup', (e) => {
      this.keys.delete(e.code);
    });

    // Mouse
    this.canvas.addEventListener('mousedown', (e) => {
      this.mouse.down = true;
      this._updateMouse(e);
    });
    this.canvas.addEventListener('mouseup', () => {
      this.mouse.down = false;
    });
    this.canvas.addEventListener('mousemove', (e) => {
      this._updateMouse(e);
    });
    this.canvas.addEventListener('wheel', (e) => {
      e.preventDefault();
      const zoomFactor = e.deltaY > 0 ? 0.9 : 1.1;
      const world = this.camera.screenToWorld(
        this.mouse.x, this.mouse.y,
        this.screenWidth, this.screenHeight
      );
      this.camera.zoomBy(zoomFactor, world.x, world.y);
    });

    // Resize
    window.addEventListener('resize', () => {
      this.resize(this.canvas.offsetWidth, this.canvas.offsetHeight);
    });
  }

  _updateMouse(e) {
    const rect = this.canvas.getBoundingClientRect();
    this.mouse.x = e.clientX - rect.left;
    this.mouse.y = e.clientY - rect.top;
  }

  resize(width, height) {
    this.canvas.width = width;
    this.canvas.height = height;
    this.screenWidth = width;
    this.screenHeight = height;
  }

  /**
   * Handle keyboard input for camera movement
   */
  _handleInput() {
    const speed = 10 / this.camera.zoom;

    if (this.keys.has('KeyW') || this.keys.has('ArrowUp')) {
      this.camera.move(0, -speed);
    }
    if (this.keys.has('KeyS') || this.keys.has('ArrowDown')) {
      this.camera.move(0, speed);
    }
    if (this.keys.has('KeyA') || this.keys.has('ArrowLeft')) {
      this.camera.move(-speed, 0);
    }
    if (this.keys.has('KeyD') || this.keys.has('ArrowRight')) {
      this.camera.move(speed, 0);
    }
  }

  /**
   * Render all visible chunks
   */
  _render() {
    // Clear canvas
    this.ctx.fillStyle = '#0a0a14';
    this.ctx.fillRect(0, 0, this.screenWidth, this.screenHeight);

    // Get visible chunks
    const bounds = this.camera.getVisibleBounds(this.screenWidth, this.screenHeight);

    // Render each visible chunk
    for (const [chunkId, chunk] of this.chunkManager.activeChunks) {
      if (!chunk.loaded) continue;

      // Check if chunk is visible
      if (chunk.worldX + this.chunkSize < bounds.minX ||
          chunk.worldX > bounds.maxX ||
          chunk.worldY + this.chunkSize < bounds.minY ||
          chunk.worldY > bounds.maxY) {
        continue;
      }

      // Convert chunk position to screen coordinates
      const topLeft = this.camera.worldToScreen(
        chunk.worldX, chunk.worldY,
        this.screenWidth, this.screenHeight
      );

      // Create ImageData for chunk
      const imageData = new ImageData(
        chunk.pixels,
        this.chunkSize,
        this.chunkSize
      );

      // Create temp canvas for scaling
      const tempCanvas = document.createElement('canvas');
      tempCanvas.width = this.chunkSize;
      tempCanvas.height = this.chunkSize;
      const tempCtx = tempCanvas.getContext('2d');
      tempCtx.putImageData(imageData, 0, 0);

      // Draw scaled to main canvas
      const scaledSize = this.chunkSize * this.camera.zoom;
      this.ctx.imageSmoothingEnabled = false; // Pixelated
      this.ctx.drawImage(
        tempCanvas,
        topLeft.x, topLeft.y,
        scaledSize, scaledSize
      );
    }

    // Render security pulse rings for agents
    if (this.securityPulse && Object.keys(this.agentSignatures).length > 0) {
      this._renderAgentPulses();
    }

    // Render spatial tokens from hex-encoded pixels
    this._renderSpatialTokens();

    // Custom render callback
    this.onRender(this.ctx, this.camera);
  }

  /**
   * Render agent pulse effects
   */
  _renderAgentPulses() {
    for (const [sig, data] of Object.entries(this.agentSignatures)) {
      const signature = parseInt(sig);
      const { x, y, isValidated } = typeof data === 'object' ? data : { x: 0, y: 0, isValidated: true };
      
      // Convert world coords to screen
      const screenPos = this.camera.worldToScreen(x, y, this.screenWidth, this.screenHeight);
      
      // Render pulse ring
      if (this.securityPulse) {
        this.securityPulse.renderPulseRing(
          this.ctx,
          signature,
          screenPos.x,
          screenPos.y,
          this.frameCount
        );
      }
    }
  }

  /**
   * Render spatial tokens from hex-encoded pixels.
   */
  _renderSpatialTokens() {
    for (const [chunkId, chunk] of this.chunkManager.activeChunks) {
      if (!chunk.loaded || !chunk.pixels.data) continue;

      const bounds = this.camera.getVisibleBounds(this.screenWidth, this.screenHeight);
      
      // Check visibility
      if (chunk.worldX + this.chunkSize < bounds.minX ||
          chunk.worldX > bounds.maxX ||
          chunk.worldY + this.chunkSize < bounds.minY ||
          chunk.worldY > bounds.maxY) {
        continue;
      }

      // Scan pixels for spatial tokens
      const pixelData = chunk.pixels.data;
      for (let i = 0; i < pixelData.length; i += 4) {
        const r = pixelData[i];
        const g = pixelData[i + 1];
        const b = pixelData[i + 2];
        const a = pixelData[i + 3];

        // Check if this is a spatial token (red channel in 0x80-0x8F range)
        if (r >= 0x80 && r <= 0x8F && a > 128) {
          const tokenIndex = i / 4;
          const localX = tokenIndex % this.chunkSize;
          const localY = Math.floor(tokenIndex / this.chunkSize);

          // Convert to world then screen coordinates
          const worldX = chunk.worldX + localX;
          const worldY = chunk.worldY + localY;
          const screenPos = this.camera.worldToScreen(worldX, worldY, this.screenWidth, this.screenHeight);

          // Render the token shape
          this._renderTokenShape(r, g, b, a, screenPos.x, screenPos.y);
        }
      }
    }
  }

  /**
   * Render individual spatial token shape.
   */
  _renderTokenShape(tokenId, r, g, b, a, x, y) {
    const token = SPATIAL_TOKENS[`0x${tokenId.toString(16).toUpperCase()}`];
    if (!token) return;

    this.ctx.save();
    this.ctx.globalAlpha = a / 255;
    this.ctx.fillStyle = `rgb(${r}, ${g}, ${b})`;
    this.ctx.strokeStyle = `rgb(${r}, ${g}, ${b})`;
    this.ctx.lineWidth = 2;

    const size = 16; // Token size in pixels
    const half = size / 2;

    switch (token.shape) {
      case 'point':
        this.ctx.fillRect(x, y, 4, 4);
        break;

      case 'circle':
        this.ctx.beginPath();
        this.ctx.arc(x + half, y + half, half - 2, 0, Math.PI * 2);
        this.ctx.fill();
        break;

      case 'square':
      case 'rect':
        this.ctx.fillRect(x, y, size, size);
        break;

      case 'triangle':
        this.ctx.beginPath();
        this.ctx.moveTo(x + half, y);
        this.ctx.lineTo(x + size, y + size);
        this.ctx.lineTo(x, y + size);
        this.ctx.closePath();
        this.ctx.fill();
        break;

      case 'arrow-right':
        this.ctx.beginPath();
        this.ctx.moveTo(x, y + half);
        this.ctx.lineTo(x + size - 4, y + half);
        this.ctx.lineTo(x + size - 8, y + half - 4);
        this.ctx.lineTo(x + size - 8, y + half + 4);
        this.ctx.closePath();
        this.ctx.fill();
        break;

      case 'heart':
        // Simplified heart shape
        this.ctx.beginPath();
        this.ctx.arc(x + half - 3, y + half - 2, 4, 0, Math.PI * 2);
        this.ctx.arc(x + half + 3, y + half - 2, 4, 0, Math.PI * 2);
        this.ctx.fill();
        break;

      default:
        // Fallback: render as colored square
        this.ctx.fillRect(x, y, size, size);
    }

    this.ctx.restore();
  }

  /**
   * Main update loop
   */
  async _update() {
    const now = performance.now();
    const dt = now - this.lastUpdate;
    this.lastUpdate = now;
    this.frameCount++;

    // Handle input
    this._handleInput();

    // Update camera (smoothing)
    this.camera.update();

    // Update visible chunks
    await this.chunkManager.updateVisibleChunks(
      this.camera,
      this.screenWidth,
      this.screenHeight
    );

    // Custom update callback
    this.onUpdate(dt);

    // Render
    this._render();

    // Continue loop
    if (this.running) {
      requestAnimationFrame(() => this._update());
    }
  }

  /**
   * Start the engine
   */
  start() {
    this.running = true;
    this.lastUpdate = performance.now();
    this._update();
  }

  /**
   * Set a pixel in the chunk manager.
   */
  setPixel(x, y, color) {
    this.chunkManager.setPixel(x, y, color);
  }

  /**
   * Get a pixel from the chunk manager.
   */
  getPixel(x, y) {
    return this.chunkManager.getPixel(x, y);
  }

  /**
   * Write a spatial token at world coordinates.
   * @param {number} x - World X coordinate
   * @param {number} y - World Y coordinate
   * @param {string|number} token - Token ID (0x84 or 'RECT') or hex string '#84FF00AA'
   */
  writeSpatialToken(x, y, token) {
    let tokenId;
    
    if (typeof token === 'string') {
      // Parse hex format like '#84' or lookup name like 'RECT'
      if (token.startsWith('#')) {
        tokenId = parseInt(token.substring(1), 16);
      } else {
        // Find token by name
        for (const [key, val] of Object.entries(SPATIAL_TOKENS)) {
          if (val.name === token.toUpperCase()) {
            tokenId = parseInt(key, 16);
            break;
          }
        }
      }
    } else {
      tokenId = token;
    }

    if (!tokenId) return;

    // Encode as RGBA: R=tokenID, G=0, B=0, A=255
    const color = {
      r: tokenId,
      g: 0,
      b: 0,
      a: 255
    };

    this.chunkManager.setPixel(x, y, color);
  }

  /**
   * Write using multi-dim hex format #AABBCCDD.
   */
  writeHex(hexString, x, y) {
    const data = HexDecoder.parse(hexString);
    if (!data) return;

    this.chunkManager.setPixel(x, y, {
      r: data.r,
      g: data.g,
      b: data.b,
      a: data.a
    });
  }
}


// =============================================================================
// DEFAULT EXPORT
// =============================================================================

export default {
  CHUNK_SIZE,
  Camera,
  ChunkManager,
  ViewportEngine
};
