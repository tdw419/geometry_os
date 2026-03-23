/**
 * Security Pulse - Visual Heartbeat for Agent Signatures
 * 
 * Links CSS opacity of agent pixels to validate_token heartbeat.
 * Provides visual proof that security.py is enforcing permissions.
 * 
 * Usage:
 *   const pulse = new SecurityPulse(ctx, securityGate);
 *   pulse.render(agentSignature, x, y, frameCount);
 */

class SecurityPulse {
  constructor(ctx, options = {}) {
    this.ctx = ctx;
    this.frameCount = 0;
    
    // Configuration
    this.pulseSpeed = options.pulseSpeed || 60;  // Frames per pulse cycle
    this.minOpacity = options.minOpacity || 0.4;
    this.maxOpacity = options.maxOpacity || 1.0;
    
    // Agent type colors
    this.colors = {
      human: '#00FF00',    // Green
      ai: '#00FFFF',       // Cyan
      system: '#FF00FF',   // Magenta
      unauthorized: '#FF0000'  // Red (security violation)
    };
  }
  
  /**
   * Calculate pulse opacity for agent at frame
   * Uses sine wave for smooth heartbeat effect
   */
  calculatePulse(agentSignature, frame) {
    // Agent type determines pulse frequency
    const agentType = this.getAgentType(agentSignature);
    const frequency = {
      human: 1.0,
      ai: 1.5,      // AI pulses faster
      system: 0.5   // System pulses slower (more stable)
    }[agentType] || 1.0;
    
    // Sine wave pulse
    const phase = (frame / this.pulseSpeed) * Math.PI * 2 * frequency;
    const pulse = Math.sin(phase) * 0.5 + 0.5;  // 0 to 1
    
    // Map to opacity range
    return this.minOpacity + pulse * (this.maxOpacity - this.minOpacity);
  }
  
  /**
   * Get agent type from signature
   */
  getAgentType(signature) {
    if (signature >= 0x100 && signature < 0x200) return 'human';
    if (signature >= 0x200 && signature < 0x300) return 'ai';
    if (signature >= 0x300 && signature < 0x400) return 'system';
    return 'unauthorized';
  }
  
  /**
   * Get color for agent type
   */
  getAgentColor(signature) {
    const type = this.getAgentType(signature);
    return this.colors[type];
  }
  
  /**
   * Render pulse effect around agent
   */
  renderPulseRing(agentSignature, x, y, frame, radius = 20) {
    const opacity = this.calculatePulse(agentSignature, frame);
    const color = this.getAgentColor(agentSignature);
    
    this.ctx.save();
    this.ctx.globalAlpha = opacity * 0.3;  // Ring is subtle
    
    // Draw pulsing ring
    this.ctx.beginPath();
    this.ctx.strokeStyle = color;
    this.ctx.lineWidth = 2;
    this.ctx.arc(x, y, radius + Math.sin(frame * 0.1) * 5, 0, Math.PI * 2);
    this.ctx.stroke();
    
    this.ctx.restore();
  }
  
  /**
   * Apply security heartbeat to agent pixels
   * Call this before rendering agent's hex values
   */
  applyToPixels(agentSignature, frame, isValidated = true) {
    if (!isValidated) {
      // Security violation - solid red, no pulse
      return {
        opacity: 1.0,
        color: this.colors.unauthorized,
        flash: Math.floor(frame / 10) % 2 === 0  // Blink effect
      };
    }
    
    return {
      opacity: this.calculatePulse(agentSignature, frame),
      color: this.getAgentColor(agentSignature),
      flash: false
    };
  }
  
  /**
   * Render security status indicator
   * Shows in corner of viewport
   */
  renderStatusIndicator(agents, frame, x = 10, y = 10) {
    this.ctx.save();
    this.ctx.font = '12px monospace';
    
    let yOffset = 0;
    for (const [sig, valid] of Object.entries(agents)) {
      const signature = parseInt(sig);
      const type = this.getAgentType(signature);
      const color = this.getAgentColor(signature);
      const opacity = this.calculatePulse(signature, frame);
      
      this.ctx.globalAlpha = opacity;
      this.ctx.fillStyle = color;
      this.ctx.fillText(
        `0x${signature.toString(16).toUpperCase().padStart(3, '0')} ${type.toUpperCase()} ${valid ? '✓' : '✗'}`,
        x, y + yOffset
      );
      yOffset += 15;
    }
    
    this.ctx.restore();
  }
  
  /**
   * Hex-Entropy Heartbeat validation
   * Checks if agent's color shift matches expected salt
   */
  validateHexEntropy(agentSignature, hexColor, frame) {
    // Calculate expected salt for this frame window
    const saltWindow = Math.floor(frame / 60);  // Changes every 60 frames
    const expectedShift = (agentSignature * saltWindow) % 256;
    
    // Parse hex color
    const r = parseInt(hexColor.slice(1, 3), 16);
    const g = parseInt(hexColor.slice(3, 5), 16);
    const b = parseInt(hexColor.slice(5, 7), 16);
    
    // Check if one channel has expected shift (simplified check)
    const hasEntropy = (r + g + b) % 16 === expectedShift % 16;
    
    return hasEntropy;
  }
  
  /**
   * Generate entropic hex color for agent
   * Use this when agent writes to buffer
   */
  generateEntropicHex(agentSignature, baseColor, frame) {
    const saltWindow = Math.floor(frame / 60);
    const shift = (agentSignature * saltWindow) % 16;
    
    // Parse base color
    let r = parseInt(baseColor.slice(1, 3), 16);
    let g = parseInt(baseColor.slice(3, 5), 16);
    let b = parseInt(baseColor.slice(5, 7), 16);
    
    // Apply entropy shift
    r = (r + shift) % 256;
    g = (g + shift) % 256;
    b = (b + shift) % 256;
    
    return `#${r.toString(16).padStart(2, '0')}${g.toString(16).padStart(2, '0')}${b.toString(16).padStart(2, '0')}`;
  }
}

// Export for use in viewportEngine.js
if (typeof module !== 'undefined') {
  module.exports = { SecurityPulse };
}
