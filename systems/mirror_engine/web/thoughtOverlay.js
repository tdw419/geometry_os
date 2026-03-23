// =============================================================================
// THOUGHT OVERLAY - Time-Travel UI for ChromaDB Thought Logging
// =============================================================================
//
// Provides:
// - THINK overlay showing AI's current thoughts
// - Timeline slider to scrub through history
// - Error teleportation button
// - Spatial query visualization
//
// Usage:
//   import { ThoughtOverlay } from './thoughtOverlay.js';
//   const overlay = new ThoughtOverlay(engine);
//   overlay.connect('http://localhost:8765');
//
// =============================================================================

export class ThoughtOverlay {
  constructor(viewportEngine) {
    this.engine = viewportEngine;
    this.apiUrl = null;
    this.thoughts = [];
    this.currentThoughtIndex = -1;
    this.autoUpdate = true;
    this.updateInterval = null;
    
    // UI elements
    this.overlayEl = null;
    this.timelineSlider = null;
    this.thoughtDisplay = null;
    this.teleportBtn = null;
    
    this._initUI();
  }

  /**
   * Initialize the overlay UI elements.
   */
  _initUI() {
    // Create main overlay container
    this.overlayEl = document.createElement('div');
    this.overlayEl.id = 'thought-overlay';
    this.overlayEl.style.cssText = `
      position: fixed;
      top: 10px;
      right: 10px;
      width: 350px;
      background: rgba(0, 0, 0, 0.85);
      border: 2px solid #40e0d0;
      border-radius: 8px;
      padding: 15px;
      font-family: 'Courier New', monospace;
      font-size: 13px;
      color: #b8f5eb;
      z-index: 1000;
      box-shadow: 0 4px 20px rgba(64, 224, 208, 0.3);
    `;

    // Header
    const header = document.createElement('div');
    header.style.cssText = 'font-weight: bold; margin-bottom: 10px; border-bottom: 1px solid #40e0d0; padding-bottom: 5px;';
    header.innerHTML = '🧠 AI THOUGHT STREAM';
    this.overlayEl.appendChild(header);

    // Thought display area
    this.thoughtDisplay = document.createElement('div');
    this.thoughtDisplay.id = 'thought-display';
    this.thoughtDisplay.style.cssText = `
      min-height: 80px;
      max-height: 150px;
      overflow-y: auto;
      background: rgba(0, 20, 30, 0.6);
      border: 1px solid #204050;
      border-radius: 4px;
      padding: 8px;
      margin-bottom: 10px;
      font-size: 12px;
      line-height: 1.4;
    `;
    this.overlayEl.appendChild(this.thoughtDisplay);

    // Timeline slider section
    const timelineContainer = document.createElement('div');
    timelineContainer.style.cssText = 'margin-bottom: 10px;';
    
    const timelineLabel = document.createElement('label');
    timelineLabel.style.cssText = 'display: block; margin-bottom: 5px; color: #40e0d0;';
    timelineLabel.innerHTML = '⏮️ TIME TRAVEL';
    timelineContainer.appendChild(timelineLabel);

    this.timelineSlider = document.createElement('input');
    this.timelineSlider.type = 'range';
    this.timelineSlider.min = 0;
    this.timelineSlider.max = 0;
    this.timelineSlider.value = 0;
    this.timelineSlider.style.cssText = `
      width: 100%;
      margin-bottom: 5px;
      accent-color: #40e0d0;
    `;
    timelineContainer.appendChild(this.timelineSlider);

    const timeLabel = document.createElement('div');
    timeLabel.id = 'time-label';
    timeLabel.style.cssText = 'font-size: 11px; color: #888; text-align: right;';
    timeLabel.innerHTML = 'Live';
    timelineContainer.appendChild(timeLabel);

    this.overlayEl.appendChild(timelineContainer);

    // Controls
    const controls = document.createElement('div');
    controls.style.cssText = 'display: flex; gap: 8px; margin-bottom: 10px;';

    this.teleportBtn = document.createElement('button');
    this.teleportBtn.innerHTML = '🧭 TELEPORT TO ERROR';
    this.teleportBtn.style.cssText = `
      flex: 1;
      padding: 8px;
      background: #ff6b6b;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 11px;
      font-weight: bold;
    `;
    this.teleportBtn.onclick = () => this._teleportToError();
    controls.appendChild(this.teleportBtn);

    const searchBtn = document.createElement('button');
    searchBtn.innerHTML = '🔍 SEARCH';
    searchBtn.style.cssText = `
      padding: 8px 12px;
      background: #40e0d0;
      color: #001a15;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 11px;
      font-weight: bold;
    `;
    searchBtn.onclick = () => this._showSearchDialog();
    controls.appendChild(searchBtn);

    this.overlayEl.appendChild(controls);

    // Status indicator
    const statusEl = document.createElement('div');
    statusEl.id = 'thought-status';
    statusEl.style.cssText = `
      font-size: 10px;
      color: #888;
      text-align: center;
      padding-top: 10px;
      border-top: 1px solid #204050;
    `;
    statusEl.innerHTML = 'Disconnected';
    this.overlayEl.appendChild(statusEl);

    // Add to document
    document.body.appendChild(this.overlayEl);

    // Slider event listener
    this.timelineSlider.addEventListener('input', (e) => {
      const index = parseInt(e.target.value);
      if (index >= 0 && index < this.thoughts.length) {
        this._loadThoughtAtIndex(index);
      }
    });
  }

  /**
   * Connect to the Thought Gateway API.
   */
  async connect(apiUrl) {
    this.apiUrl = apiUrl;
    this._updateStatus('Connecting...');

    try {
      const response = await fetch(`${apiUrl}/`);
      if (!response.ok) throw new Error('API not available');
      
      const info = await response.json();
      this._updateStatus(`Connected to ${info.service}`);
      
      // Start auto-updating
      this._startAutoUpdate();
      
      // Load initial timeline
      await this._loadTimeline();
      
    } catch (err) {
      console.error('ThoughtOverlay connection failed:', err);
      this._updateStatus('Disconnected - ' + err.message);
    }
  }

  /**
   * Start automatic updates from the API.
   */
  _startAutoUpdate() {
    if (this.updateInterval) clearInterval(this.updateInterval);
    
    this.updateInterval = setInterval(async () => {
      if (this.autoUpdate) {
        await this._fetchLatestThoughts();
      }
    }, 2000); // Update every 2 seconds
  }

  /**
   * Fetch the latest thoughts from the timeline.
   */
  async _fetchLatestThoughts() {
    try {
      const response = await fetch(`${this.apiUrl}/timeline`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ limit: 20 })
      });

      if (!response.ok) throw new Error('Failed to fetch timeline');
      
      const data = await response.json();
      
      // Update thoughts array (keep unique entries)
      const existingIds = new Set(this.thoughts.map(t => t.id || `${t.x}-${t.y}-${t.timestamp}`));
      let added = 0;
      
      for (const thought of data.results) {
        const id = thought.id || `${thought.x}-${thought.y}-${thought.timestamp}`;
        if (!existingIds.has(id)) {
          this.thoughts.unshift(thought); // Add to beginning
          existingIds.add(id);
          added++;
        }
      }
      
      // Keep only last 100 thoughts
      if (this.thoughts.length > 100) {
        this.thoughts = this.thoughts.slice(0, 100);
      }
      
      // Update slider max
      this.timelineSlider.max = Math.max(this.thoughts.length - 1, 0);
      
      // Show latest thought if in live mode
      if (this.currentThoughtIndex === -1 && this.thoughts.length > 0) {
        this._displayThought(this.thoughts[0]);
      }
      
    } catch (err) {
      console.error('Failed to fetch thoughts:', err);
    }
  }

  /**
   * Load the full timeline for time-travel.
   */
  async _loadTimeline() {
    try {
      const response = await fetch(`${this.apiUrl}/timeline`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ limit: 100 })
      });

      if (!response.ok) throw new Error('Failed to load timeline');
      
      const data = await response.json();
      this.thoughts = data.results;
      
      // Update slider
      this.timelineSlider.max = Math.max(this.thoughts.length - 1, 0);
      this.timelineSlider.value = this.thoughts.length - 1; // Start at latest
      
      // Display most recent thought
      if (this.thoughts.length > 0) {
        this._displayThought(this.thoughts[this.thoughts.length - 1]);
        this.currentThoughtIndex = this.thoughts.length - 1;
      }
      
    } catch (err) {
      console.error('Failed to load timeline:', err);
    }
  }

  /**
   * Load a specific thought by index.
   */
  _loadThoughtAtIndex(index) {
    if (index >= 0 && index < this.thoughts.length) {
      this.currentThoughtIndex = index;
      const thought = this.thoughts[index];
      this._displayThought(thought);
      
      // Update time label
      const timeLabel = document.getElementById('time-label');
      if (thought.timestamp) {
        timeLabel.innerHTML = new Date(thought.timestamp).toLocaleString();
      }
      
      // Optionally pan camera to thought location
      if (thought.x !== undefined && thought.y !== undefined) {
        this._highlightLocation(thought.x, thought.y);
      }
    }
  }

  /**
   * Display a thought in the overlay.
   */
  _displayThought(thought) {
    const typeColors = {
      'analysis': '#40e0d0',   // Cyan
      'error': '#ff6b6b',       // Red
      'write': '#ffd700',       // Gold
      'security': '#ff1493',    // Pink
      'navigation': '#87ceeb',  // Sky blue
      'generation': '#98fb98'   // Pale green
    };

    const color = typeColors[thought.type] || '#ffffff';
    const icon = this._getThoughtIcon(thought.type);

    this.thoughtDisplay.innerHTML = `
      <div style="margin-bottom: 8px;">
        <span style="color: ${color}; font-weight: bold;">${icon} [${thought.type.toUpperCase()}]</span>
        <span style="color: #888; font-size: 10px; margin-left: 8px;">(${thought.x}, ${thought.y})</span>
      </div>
      <div style="color: #b8f5eb; white-space: pre-wrap;">${this._escapeHtml(thought.content)}</div>
      ${thought.agent_sig ? `<div style="color: #666; font-size: 10px; margin-top: 5px;">Agent: ${thought.agent_sig}</div>` : ''}
    `;
  }

  /**
   * Get icon for thought type.
   */
  _getThoughtIcon(type) {
    const icons = {
      'analysis': '🧠',
      'error': '❌',
      'write': '✏️',
      'security': '🛡️',
      'navigation': '🧭',
      'generation': '✨'
    };
    return icons[type] || '💭';
  }

  /**
   * Highlight a location on the map.
   */
  _highlightLocation(x, y) {
    // Create a temporary visual marker
    if (this.engine.securityPulse) {
      // Use existing pulse system to highlight
      const sig = `thought_${x}_${y}`;
      this.engine.agentSignatures[sig] = { x, y, isValidated: true };
      
      // Clear after 2 seconds
      setTimeout(() => {
        delete this.engine.agentSignatures[sig];
      }, 2000);
    }
  }

  /**
   * Teleport camera to the last error location.
   */
  async _teleportToError() {
    try {
      const response = await fetch(`${this.apiUrl}/teleport-error`);
      const data = await response.json();
      
      if (data.success && data.x !== undefined && data.y !== undefined) {
        // Pan camera to error location
        this.engine.targetCameraX = data.x;
        this.engine.targetCameraY = data.y;
        
        this._updateStatus(`Teleporting to error at (${data.x}, ${data.y})`);
        
        // Visual feedback
        this.teleportBtn.style.background = '#40e0d0';
        setTimeout(() => {
          this.teleportBtn.style.background = '#ff6b6b';
        }, 500);
      } else {
        this._updateStatus(data.message || 'No errors found');
      }
      
    } catch (err) {
      console.error('Teleport failed:', err);
      this._updateStatus('Teleport failed: ' + err.message);
    }
  }

  /**
   * Show search dialog.
   */
  async _showSearchDialog() {
    const query = prompt('Search thoughts (e.g., "error", "spiral"):');
    if (!query) return;
    
    try {
      const response = await fetch(`${this.apiUrl}/search`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ query, n_results: 5 })
      });

      if (!response.ok) throw new Error('Search failed');
      
      const data = await response.json();
      
      if (data.results.length === 0) {
        alert('No results found');
        return;
      }
      
      // Display results
      let resultText = `Found ${data.results.length} results:\n\n`;
      for (const r of data.results) {
        resultText += `[${r.type}] (${r.x}, ${r.y})\n${r.content.substring(0, 60)}...\n\n`;
      }
      
      alert(resultText);
      
      // Teleport to first result
      if (data.results[0]) {
        const first = data.results[0];
        this.engine.targetCameraX = first.x;
        this.engine.targetCameraY = first.y;
        this._updateStatus(`Teleported to search result: "${query}"`);
      }
      
    } catch (err) {
      alert('Search failed: ' + err.message);
    }
  }

  /**
   * Update status indicator.
   */
  _updateStatus(message) {
    const statusEl = document.getElementById('thought-status');
    if (statusEl) {
      statusEl.innerHTML = message;
    }
  }

  /**
   * Log a new thought directly from the frontend.
   */
  async logThought(content, x, y, type = 'analysis') {
    if (!this.apiUrl) return;
    
    try {
      await fetch(`${this.apiUrl}/thought`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ content, x, y, thought_type: type })
      });
      
      // Refresh timeline
      await this._fetchLatestThoughts();
      
    } catch (err) {
      console.error('Failed to log thought:', err);
    }
  }

  /**
   * Destroy the overlay and cleanup.
   */
  destroy() {
    if (this.updateInterval) clearInterval(this.updateInterval);
    if (this.overlayEl && this.overlayEl.parentNode) {
      this.overlayEl.parentNode.removeChild(this.overlayEl);
    }
  }

  /**
   * Toggle visibility of the overlay.
   */
  toggle() {
    if (this.overlayEl) {
      this.overlayEl.style.display = this.overlayEl.style.display === 'none' ? 'block' : 'none';
    }
  }

  /**
   * Check if overlay is visible.
   */
  get visible() {
    return this.overlayEl && this.overlayEl.style.display !== 'none';
  }
}

// =============================================================================
// AUTO-INITIALIZATION (if viewportEngine is available globally)
// =============================================================================

if (typeof window !== 'undefined') {
  window.ThoughtOverlay = ThoughtOverlay;
  
  // Auto-connect if engine exists
  window.addEventListener('load', () => {
    if (window.viewportEngine) {
      const overlay = new ThoughtOverlay(window.viewportEngine);
      overlay.connect('http://localhost:8765');
      console.log('ThoughtOverlay initialized and connected');
    }
  });
}
</parameter> </function> }</tool_call><tool_call><function=write> <parameter=content> # Geometry OS - Phase 2 Implementation Guide ## Thought Logging & Time-Travel UI ### Overview Phase 2 connects AI thoughts to the physical map via ChromaDB, enabling semantic search and temporal navigation. ### Components Built | File | Purpose | Status | |------|---------|--------| | `thought_logger.py` | ChromaDB integration for spatial thought logging | ✅ | | `thought_gateway.py` | FastAPI backend (port 8765) | ✅ | | `thoughtOverlay.js` | Frontend time-travel UI with THINK overlay | ✅ | ### Quick Start #### 1. Install Dependencies ```bash pip install chromadb fastapi uvicorn pydantic ``` #### 2. Start the Thought Gateway ```bash cd systems/mirror_engine python3 thought_gateway.py ``` Server runs at `http://localhost:8765` #### 3. Include in Frontend Add to your HTML before viewportEngine.js: ```html <script type=