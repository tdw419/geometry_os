/**
 * Terminal Component — ASCII I/O Window on Infinite Map
 *
 * Renders a terminal "window" at world coordinates.
 * Supports input handling and API bridge to OpenClaw.
 *
 * Connection options:
 *   A) Direct HTTP to OpenClaw gateway
 *   B) WebRTC P2P to local machine
 *   C) Proxy via Cloudflare Worker
 */

import { Color, BitmapFont8x8 } from './bitmapFont.js';

// =============================================================================
// TERMINAL CONFIG
// =============================================================================

export const TERMINAL_DEFAULTS = {
  width: 80,          // Characters per line
  height: 25,         // Lines visible
  charWidth: 8,
  charHeight: 8,
  padding: 8,
  borderWidth: 2,
  titleBarHeight: 16,

  // Colors
  bgColor: new Color(10, 10, 20),
  fgColor: new Color(0, 255, 0),
  borderColor: new Color(0, 255, 255),
  titleColor: new Color(0, 0, 0),
  titleBgColor: new Color(0, 255, 255),

  // API
  apiEndpoint: null,  // Set to OpenClaw gateway URL
  apiType: 'http',    // 'http' | 'webrtc' | 'cloudflare'
};


// =============================================================================
// TERMINAL CLASS
// =============================================================================

export class Terminal {
  constructor(x, y, options = {}) {
    // Position in world coordinates
    this.x = x;
    this.y = y;

    // Merge options
    this.options = { ...TERMINAL_DEFAULTS, ...options };

    // Dimensions in pixels
    this.pixelWidth = this.options.width * this.options.charWidth +
                      this.options.padding * 2;
    this.pixelHeight = this.options.height * this.options.charHeight +
                       this.options.padding * 2 +
                       this.options.titleBarHeight;

    // Font
    this.font = new BitmapFont8x8();

    // Terminal state
    this.lines = [''];
    this.inputBuffer = '';
    this.cursorVisible = true;
    this.cursorBlink = 0;

    // History
    this.history = [];
    this.historyIndex = -1;

    // Connection state
    this.connected = false;
    this.connecting = false;

    // API bridge
    this.api = null;

    // Window state
    this.focused = false;
    this.dragging = false;
    this.dragOffset = { x: 0, y: 0 };

    // Initialize with welcome message
    this._initWelcome();
  }

  _initWelcome() {
    this.writeLine('\x1b[36mMIRROR ENGINE TERMINAL\x1b[0m');
    this.writeLine('\x1b[90mType commands or prompts for OpenClaw\x1b[0m');
    this.writeLine('');
    this.write('\x1b[32m>\x1b[0m ');
  }

  // =========================================================================
  // RENDERING
  // =========================================================================

  /**
   * Render terminal to pixel buffer
   * @param {Uint8ClampedArray} pixels - Target pixel buffer
   * @param {number} bufferWidth - Buffer width
   * @param {number} bufferHeight - Buffer height
   * @param {number} offsetX - World X offset (camera)
   * @param {number} offsetY - World Y offset (camera)
   */
  render(pixels, bufferWidth, bufferHeight, offsetX = 0, offsetY = 0) {
    const startX = this.x - offsetX;
    const startY = this.y - offsetY;

    // Skip if completely off-screen
    if (startX + this.pixelWidth < 0 || startX >= bufferWidth ||
        startY + this.pixelHeight < 0 || startY >= bufferHeight) {
      return;
    }

    // Draw window background
    this._fillRect(pixels, bufferWidth, bufferHeight,
                   startX, startY, this.pixelWidth, this.pixelHeight,
                   this.options.bgColor);

    // Draw border
    this._drawBorder(pixels, bufferWidth, bufferHeight, startX, startY);

    // Draw title bar
    this._drawTitleBar(pixels, bufferWidth, bufferHeight, startX, startY);

    // Draw text content
    this._renderContent(pixels, bufferWidth, bufferHeight, startX, startY);

    // Draw cursor
    this._renderCursor(pixels, bufferWidth, bufferHeight, startX, startY);
  }

  _fillRect(pixels, bufW, bufH, x, y, w, h, color) {
    for (let py = y; py < y + h; py++) {
      for (let px = x; px < x + w; px++) {
        if (px < 0 || px >= bufW || py < 0 || py >= bufH) continue;
        const idx = (py * bufW + px) * 4;
        pixels[idx] = color.r;
        pixels[idx + 1] = color.g;
        pixels[idx + 2] = color.b;
        pixels[idx + 3] = 255;
      }
    }
  }

  _drawBorder(pixels, bufW, bufH, x, y) {
    const bw = this.options.borderWidth;
    const w = this.pixelWidth;
    const h = this.pixelHeight;
    const color = this.focused ? this.options.borderColor : new Color(60, 60, 80);

    // Top
    this._fillRect(pixels, bufW, bufH, x, y, w, bw, color);
    // Bottom
    this._fillRect(pixels, bufW, bufH, x, y + h - bw, w, bw, color);
    // Left
    this._fillRect(pixels, bufW, bufH, x, y, bw, h, color);
    // Right
    this._fillRect(pixels, bufW, bufH, x + w - bw, y, bw, h, color);
  }

  _drawTitleBar(pixels, bufW, bufH, x, y) {
    const th = this.options.titleBarHeight;
    const w = this.pixelWidth;

    // Background
    this._fillRect(pixels, bufW, bufH, x + 2, y + 2, w - 4, th - 2,
                   this.options.titleBgColor);

    // Title text
    const title = ' TERMINAL - OpenClaw ';
    this.font.renderString(pixels, bufW, bufH, title,
                           x + 6, y + 4, this.options.titleColor);
  }

  _renderContent(pixels, bufW, bufH, x, y) {
    const pad = this.options.padding;
    const th = this.options.titleBarHeight;
    const cw = this.options.charWidth;
    const ch = this.options.charHeight;
    const lineStart = Math.max(0, this.lines.length - this.options.height);

    let cy = y + th + pad;

    for (let i = lineStart; i < this.lines.length; i++) {
      const line = this._stripAnsi(this.lines[i]);
      const color = this._getLineColor(this.lines[i]);

      this.font.renderString(pixels, bufW, bufH, line,
                             x + pad, cy, color);
      cy += ch;
    }

    // Render input buffer
    const inputY = cy;
    this.font.renderString(pixels, bufW, bufH, this.inputBuffer,
                           x + pad + cw * 2, inputY, this.options.fgColor);
  }

  _renderCursor(pixels, bufW, bufH, x, y) {
    if (!this.focused) return;

    // Blink cursor
    this.cursorBlink++;
    if (this.cursorBlink > 30) {
      this.cursorVisible = !this.cursorVisible;
      this.cursorBlink = 0;
    }

    if (!this.cursorVisible) return;

    const pad = this.options.padding;
    const th = this.options.titleBarHeight;
    const cw = this.options.charWidth;
    const ch = this.options.charHeight;

    const cursorX = x + pad + cw * (2 + this.inputBuffer.length);
    const cursorY = y + th + pad + (this.options.height - 1) * ch;

    this._fillRect(pixels, bufW, bufH, cursorX, cursorY, cw, ch,
                   this.options.fgColor);
  }

  // =========================================================================
  // TEXT HANDLING
  // =========================================================================

  _stripAnsi(text) {
    return text.replace(/\x1b\[[0-9;]*m/g, '');
  }

  _getLineColor(text) {
    // Parse ANSI colors
    const cyanMatch = text.match(/\x1b\[36m/);
    const greenMatch = text.match(/\x1b\[32m/);
    const grayMatch = text.match(/\x1b\[90m/);
    const redMatch = text.match(/\x1b\[31m/);

    if (cyanMatch) return Color.CYAN;
    if (greenMatch) return Color.GREEN;
    if (grayMatch) return new Color(100, 100, 100);
    if (redMatch) return Color.RED;

    return this.options.fgColor;
  }

  write(text) {
    if (this.lines.length === 0) {
      this.lines.push('');
    }
    this.lines[this.lines.length - 1] += text;
  }

  writeLine(text = '') {
    this.write(text);
    this.lines.push('');
    this._scrollIfNeeded();
  }

  _scrollIfNeeded() {
    const maxLines = 1000; // Buffer limit
    if (this.lines.length > maxLines) {
      this.lines = this.lines.slice(-maxLines);
    }
  }

  clear() {
    this.lines = [''];
    this.inputBuffer = '';
  }

  // =========================================================================
  // INPUT HANDLING
  // =========================================================================

  handleKey(event) {
    if (!this.focused) return false;

    const key = event.key;

    if (key === 'Enter') {
      this._executeInput();
      return true;
    }

    if (key === 'Backspace') {
      this.inputBuffer = this.inputBuffer.slice(0, -1);
      return true;
    }

    if (key === 'ArrowUp') {
      this._historyPrev();
      return true;
    }

    if (key === 'ArrowDown') {
      this._historyNext();
      return true;
    }

    // Regular character
    if (key.length === 1 && !event.ctrlKey && !event.metaKey) {
      this.inputBuffer += key;
      return true;
    }

    return false;
  }

  _executeInput() {
    const input = this.inputBuffer.trim();
    if (!input) return;

    // Add to history
    this.history.push(input);
    this.historyIndex = this.history.length;

    // Echo input
    this.writeLine(`\x1b[32m>\x1b[0m ${input}`);
    this.inputBuffer = '';

    // Process command
    this._processCommand(input);
  }

  _historyPrev() {
    if (this.historyIndex > 0) {
      this.historyIndex--;
      this.inputBuffer = this.history[this.historyIndex] || '';
    }
  }

  _historyNext() {
    if (this.historyIndex < this.history.length - 1) {
      this.historyIndex++;
      this.inputBuffer = this.history[this.historyIndex] || '';
    } else {
      this.historyIndex = this.history.length;
      this.inputBuffer = '';
    }
  }

  // =========================================================================
  // COMMAND PROCESSING
  // =========================================================================

  async _processCommand(input) {
    const parts = input.split(' ');
    const cmd = parts[0].toLowerCase();

    // Built-in commands
    if (cmd === 'clear') {
      this.clear();
      this.write('\x1b[32m>\x1b[0m ');
      return;
    }

    if (cmd === 'help') {
      this.writeLine('Available commands:');
      this.writeLine('  clear    - Clear terminal');
      this.writeLine('  help     - Show this help');
      this.writeLine('  connect  - Connect to OpenClaw');
      this.writeLine('  status   - Show connection status');
      this.writeLine('  <prompt> - Send prompt to OpenClaw');
      this.write('\x1b[32m>\x1b[0m ');
      return;
    }

    if (cmd === 'connect') {
      await this._connectAPI();
      this.write('\x1b[32m>\x1b[0m ');
      return;
    }

    if (cmd === 'status') {
      this.writeLine(`API: ${this.options.apiEndpoint || 'not configured'}`);
      this.writeLine(`Connected: ${this.connected}`);
      this.write('\x1b[32m>\x1b[0m ');
      return;
    }

    // Send to API
    if (this.options.apiEndpoint) {
      await this._sendToAPI(input);
    } else {
      this.writeLine('\x1b[31mError: No API endpoint configured\x1b[0m');
      this.write('\x1b[32m>\x1b[0m ');
    }
  }

  // =========================================================================
  // API BRIDGE
  // =========================================================================

  async _connectAPI() {
    if (!this.options.apiEndpoint) {
      this.writeLine('\x1b[31mNo API endpoint configured\x1b[0m');
      return;
    }

    this.connecting = true;
    this.writeLine('Connecting to OpenClaw...');

    try {
      if (this.options.apiType === 'http') {
        // Test HTTP connection
        const response = await fetch(this.options.apiEndpoint + '/health', {
          method: 'GET',
          headers: { 'Content-Type': 'application/json' }
        });

        if (response.ok) {
          this.connected = true;
          this.writeLine('\x1b[32mConnected to OpenClaw\x1b[0m');
        } else {
          throw new Error(`HTTP ${response.status}`);
        }
      } else if (this.options.apiType === 'webrtc') {
        // WebRTC P2P connection (placeholder)
        this.writeLine('\x1b[33mWebRTC connection not yet implemented\x1b[0m');
      } else if (this.options.apiType === 'cloudflare') {
        // Cloudflare Worker proxy
        const response = await fetch(this.options.apiEndpoint, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ type: 'ping' })
        });

        if (response.ok) {
          this.connected = true;
          this.writeLine('\x1b[32mConnected via Cloudflare Worker\x1b[0m');
        } else {
          throw new Error(`HTTP ${response.status}`);
        }
      }
    } catch (error) {
      this.connected = false;
      this.writeLine(`\x1b[31mConnection failed: ${error.message}\x1b[0m`);
    }

    this.connecting = false;
  }

  async _sendToAPI(prompt) {
    if (!this.connected) {
      await this._connectAPI();
      if (!this.connected) return;
    }

    this.writeLine('Sending to OpenClaw...');

    try {
      const response = await fetch(this.options.apiEndpoint + '/prompt', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          prompt: prompt,
          context: 'terminal'
        })
      });

      if (!response.ok) {
        throw new Error(`HTTP ${response.status}`);
      }

      const data = await response.json();
      const result = data.response || data.message || JSON.stringify(data);

      // Word wrap response
      this._writeWrapped(result, this.options.width - 4);

    } catch (error) {
      this.writeLine(`\x1b[31mAPI Error: ${error.message}\x1b[0m`);
    }

    this.write('\x1b[32m>\x1b[0m ');
  }

  _writeWrapped(text, maxWidth) {
    const words = text.split(' ');
    let line = '';

    for (const word of words) {
      if (line.length + word.length + 1 > maxWidth) {
        this.writeLine(line);
        line = word;
      } else {
        line += (line ? ' ' : '') + word;
      }
    }

    if (line) {
      this.writeLine(line);
    }
  }

  // =========================================================================
  // HIT TESTING
  // =========================================================================

  /**
   * Check if point is inside terminal window
   */
  containsPoint(worldX, worldY) {
    return worldX >= this.x && worldX < this.x + this.pixelWidth &&
           worldY >= this.y && worldY < this.y + this.pixelHeight;
  }

  /**
   * Check if point is in title bar (for dragging)
   */
  isInTitleBar(worldX, worldY) {
    return worldX >= this.x && worldX < this.x + this.pixelWidth &&
           worldY >= this.y && worldY < this.y + this.options.titleBarHeight;
  }

  /**
   * Start dragging
   */
  startDrag(worldX, worldY) {
    this.dragging = true;
    this.dragOffset.x = worldX - this.x;
    this.dragOffset.y = worldY - this.y;
  }

  /**
   * Update position while dragging
   */
  updateDrag(worldX, worldY) {
    if (this.dragging) {
      this.x = worldX - this.dragOffset.x;
      this.y = worldY - this.dragOffset.y;
    }
  }

  /**
   * Stop dragging
   */
  stopDrag() {
    this.dragging = false;
  }
}


// =============================================================================
// TERMINAL MANAGER — Multiple Terminals
// =============================================================================

export class TerminalManager {
  constructor() {
    this.terminals = [];
    this.activeTerminal = null;
  }

  create(x, y, options = {}) {
    const terminal = new Terminal(x, y, options);
    this.terminals.push(terminal);
    this.activeTerminal = terminal;
    return terminal;
  }

  remove(terminal) {
    const idx = this.terminals.indexOf(terminal);
    if (idx !== -1) {
      this.terminals.splice(idx, 1);
    }
    if (this.activeTerminal === terminal) {
      this.activeTerminal = this.terminals[0] || null;
    }
  }

  /**
   * Find terminal at world coordinates
   */
  findAt(worldX, worldY) {
    // Search in reverse (top-most first)
    for (let i = this.terminals.length - 1; i >= 0; i--) {
      if (this.terminals[i].containsPoint(worldX, worldY)) {
        return this.terminals[i];
      }
    }
    return null;
  }

  /**
   * Handle keyboard input
   */
  handleKey(event) {
    if (this.activeTerminal) {
      return this.activeTerminal.handleKey(event);
    }
    return false;
  }

  /**
   * Handle mouse down
   */
  handleMouseDown(worldX, worldY) {
    const terminal = this.findAt(worldX, worldY);
    if (terminal) {
      // Focus this terminal
      this.terminals.forEach(t => t.focused = false);
      terminal.focused = true;
      this.activeTerminal = terminal;

      // Check for title bar drag
      if (terminal.isInTitleBar(worldX, worldY)) {
        terminal.startDrag(worldX, worldY);
      }

      return true;
    } else {
      // Click outside - unfocus all
      this.terminals.forEach(t => t.focused = false);
      this.activeTerminal = null;
      return false;
    }
  }

  /**
   * Handle mouse move
   */
  handleMouseMove(worldX, worldY) {
    for (const terminal of this.terminals) {
      if (terminal.dragging) {
        terminal.updateDrag(worldX, worldY);
        return true;
      }
    }
    return false;
  }

  /**
   * Handle mouse up
   */
  handleMouseUp() {
    for (const terminal of this.terminals) {
      terminal.stopDrag();
    }
  }

  /**
   * Render all terminals
   */
  render(pixels, bufferWidth, bufferHeight, offsetX, offsetY) {
    for (const terminal of this.terminals) {
      terminal.render(pixels, bufferWidth, bufferHeight, offsetX, offsetY);
    }
  }
}


// =============================================================================
// DEFAULT EXPORT
// =============================================================================

export default {
  Terminal,
  TerminalManager,
  TERMINAL_DEFAULTS
};
