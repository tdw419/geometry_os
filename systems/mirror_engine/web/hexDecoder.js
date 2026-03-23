// =============================================================================
// MULTI-DIM HEX DECODER (#A1B2C3D4 FORMAT)
// =============================================================================
//
// Format: #AABBCCDD
//   AA = Alpha (opacity 0-255)
//   BB = Blue channel
//   CC = Green channel  
//   DD = Red channel + instruction bit
//
// Instruction bits (lower nibble of red):
//   0x8 = Spatial token trigger
//   0x4 = Security pulse enabled
//   0x2 = Agent signature marker
//   0x1 = Geometry command flag
//
// =============================================================================

export class HexDecoder {
  /**
   * Parse #AABBCCDD format into structured data.
   *
   * @param {string} hex - Hex string like "#80FF00AA"
   * @returns {Object} Parsed color + instruction data
   */
  static parse(hex) {
    if (!hex || typeof hex !== 'string') {
      return null;
    }

    // Remove # prefix if present
    const clean = hex.replace(/^#/, '');

    // Handle different formats
    let alpha, red, green, blue;

    if (clean.length === 8) {
      // Full format: #AABBCCDD
      alpha = parseInt(clean.substring(0, 2), 16);
      blue = parseInt(clean.substring(2, 4), 16);
      green = parseInt(clean.substring(4, 6), 16);
      red = parseInt(clean.substring(6, 8), 16);
    } else if (clean.length === 6) {
      // Standard RGBA: #RRGGBBAA
      red = parseInt(clean.substring(0, 2), 16);
      green = parseInt(clean.substring(2, 4), 16);
      blue = parseInt(clean.substring(4, 6), 16);
      alpha = 255;
    } else if (clean.length === 3) {
      // Short format: #RGB
      red = parseInt(clean[0] + clean[0], 16);
      green = parseInt(clean[1] + clean[1], 16);
      blue = parseInt(clean[2] + clean[2], 16);
      alpha = 255;
    } else {
      return null;
    }

    // Extract instruction bits from red channel (lower nibble)
    const instructionBits = red & 0x0F;
    const colorRed = red & 0xF0; // Upper nibble is actual color

    return {
      r: colorRed,
      g: green,
      b: blue,
      a: alpha,
      instructions: this._parseInstructions(instructionBits),
      raw: hex
    };
  }

  /**
   * Parse instruction bits into flags.
   */
  static _parseInstructions(bits) {
    return {
      spatialToken: !!(bits & 0x8),
      securityPulse: !!(bits & 0x4),
      agentSignature: !!(bits & 0x2),
      geometryCommand: !!(bits & 0x1)
    };
  }

  /**
   * Convert parsed data to CSS color string.
   */
  static toCSS(data) {
    if (!data) return 'transparent';
    const a = Math.round((data.a / 255) * 100);
    return `rgba(${data.r}, ${data.g}, ${data.b}, ${a / 100})`;
  }

  /**
   * Convert parsed data to canvas fillStyle.
   */
  static toFillStyle(data) {
    if (!data) return 'transparent';
    const a = data.a / 255;
    return `rgba(${data.r}, ${data.g}, ${data.b}, ${a})`;
  }

  /**
   * Encode color + instructions back to hex.
   */
  static encode(r, g, b, a = 255, instructions = {}) {
    // Build instruction bits
    let instrBits = 0;
    if (instructions.spatialToken) instrBits |= 0x8;
    if (instructions.securityPulse) instrBits |= 0x4;
    if (instructions.agentSignature) instrBits |= 0x2;
    if (instructions.geometryCommand) instrBits |= 0x1;

    // Combine color + instructions in red channel
    const red = r + instrBits;

    return `#${a.toString(16).padStart(2, '0')}${b.toString(16).padStart(2, '0')}${g.toString(16).padStart(2, '0')}${red.toString(16).padStart(2, '0')}`;
  }

  /**
   * Check if hex contains spatial token trigger.
   */
  static isSpatialToken(hex) {
    const data = this.parse(hex);
    return data && data.instructions.spatialToken;
  }

  /**
   * Check if hex has security pulse enabled.
   */
  static hasSecurityPulse(hex) {
    const data = this.parse(hex);
    return data && data.instructions.securityPulse;
  }
}

// =============================================================================
// SPATIAL TOKEN MAP (0x80-0x8F)
// =============================================================================

export const SPATIAL_TOKENS = {
  '0x80': { name: 'DOT', shape: 'point' },
  '0x81': { name: 'CIRCLE', shape: 'circle' },
  '0x82': { name: 'SQUARE', shape: 'square' },
  '0x83': { name: 'TRIANGLE', shape: 'triangle' },
  '0x84': { name: 'RECT', shape: 'rect' },
  '0x85': { name: 'ARROW_RIGHT', shape: 'arrow-right' },
  '0x86': { name: 'ARROW_LEFT', shape: 'arrow-left' },
  '0x87': { name: 'ARROW_UP', shape: 'arrow-up' },
  '0x88': { name: 'ARROW_DOWN', shape: 'arrow-down' },
  '0x89': { name: 'CROSS', shape: 'cross' },
  '0x8A': { name: 'PLUS', shape: 'plus' },
  '0x8B': { name: 'STAR', shape: 'star' },
  '0x8C': { name: 'HEART', shape: 'heart' },
  '0x8D': { name: 'LIGHTNING', shape: 'lightning' },
  '0x8E': { name: 'EYE', shape: 'eye' },
  '0x8F': { name: 'LOCK', shape: 'lock' }
};

// =============================================================================
// GEOMETRY COMMAND PARSER
// =============================================================================

export class GeometryCommandParser {
  /**
   * Parse geometry commands from hex stream.
   *
   * Commands are encoded as sequences:
   * - RECT: #80RRGGBB + width + height
   * - CIRC: #81RRGGBB + radius
   * - MOVE: #82XXYY (coordinates)
   */
  static parseStream(hexArray) {
    const commands = [];
    let i = 0;

    while (i < hexArray.length) {
      const hex = hexArray[i];
      const data = HexDecoder.parse(hex);

      if (!data || !data.instructions.geometryCommand) {
        i++;
        continue;
      }

      // Extract command type from green channel high nibble
      const cmdType = (data.g >> 4) & 0x0F;

      switch (cmdType) {
        case 0x8: // RECT
          if (i + 2 < hexArray.length) {
            const width = parseInt(hexArray[i + 1], 16);
            const height = parseInt(hexArray[i + 2], 16);
            commands.push({
              type: 'RECT',
              x: 0,
              y: 0,
              width: width * 8, // Scale factor
              height: height * 8,
              color: HexDecoder.toCSS(data)
            });
            i += 3;
          } else {
            i++;
          }
          break;

        case 0x9: // CIRCLE
          if (i + 1 < hexArray.length) {
            const radius = parseInt(hexArray[i + 1], 16);
            commands.push({
              type: 'CIRC',
              x: 0,
              y: 0,
              radius: radius * 2,
              color: HexDecoder.toCSS(data)
            });
            i += 2;
          } else {
            i++;
          }
          break;

        case 0xA: // MOVE
          if (i + 2 < hexArray.length) {
            const x = parseInt(hexArray[i + 1], 16);
            const y = parseInt(hexArray[i + 2], 16);
            commands.push({
              type: 'MOVE',
              x: x * 8,
              y: y * 8
            });
            i += 3;
          } else {
            i++;
          }
          break;

        default:
          i++;
      }
    }

    return commands;
  }
}

// =============================================================================
// DEMO / TESTS
// =============================================================================

if (typeof module !== 'undefined' && module.exports) {
  // Node.js testing
  const testHex = '#80FF00AA';
  console.log('Testing hex decoder...');
  console.log(HexDecoder.parse(testHex));

  const encoded = HexDecoder.encode(255, 0, 0, 170, { spatialToken: true });
  console.log('Encoded:', encoded);
}
