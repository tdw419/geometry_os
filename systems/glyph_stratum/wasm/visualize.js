/**
 * GlyphStratum Graph Visualizer
 * Generates ASCII and SVG visualizations of glyph programs
 */

const fs = require('fs');
const path = require('path');

// Stratum colors for visualization
const STRATUM_COLORS = {
    'SUBSTRATE': { ascii: '🔵', hex: '#2196F3', name: 'Substrate' },
    'MEMORY': { ascii: '🟢', hex: '#4CAF50', name: 'Memory' },
    'LOGIC': { ascii: '🟠', hex: '#FF9800', name: 'Logic' },
    'SPEC': { ascii: '🟣', hex: '#9C27B0', name: 'Spec' },
    'INTENT': { ascii: '🔴', hex: '#F44336', name: 'Intent' }
};

/**
 * Generate ASCII visualization of a glyph program
 */
function renderASCII(program, options = {}) {
    const { maxWidth = 80, showValues = true } = {};
    const glyphs = program.glyphs || {};
    const lines = [];

    // Header
    lines.push('╔' + '═'.repeat(maxWidth - 2) + '╗');
    lines.push('║' + ' GlyphStratum Program Visualization '.padEnd(maxWidth - 2) + '║');
    lines.push('╠' + '═'.repeat(maxWidth - 2) + '╗');
    lines.push('');

    // Legend
    lines.push('Strata Legend:');
    for (const [stratum, info] of Object.entries(STRATUM_COLORS)) {
        lines.push(`  ${info.ascii} ${stratum}`);
    }
    lines.push('');

    // Group glyphs by stratum
    const byStratum = {};
    for (const [id, glyph] of Object.entries(glyphs)) {
        const stratum = glyph.stratum || 'SUBSTRATE';
        if (!byStratum[stratum]) byStratum[stratum] = [];
        byStratum[stratum].push({ id, ...glyph });
    }

    // Render each stratum
    const stratumOrder = ['INTENT', 'SPEC', 'LOGIC', 'MEMORY', 'SUBSTRATE'];
    for (const stratum of stratumOrder) {
        const glyphsInStratum = byStratum[stratum] || [];
        if (glyphsInStratum.length === 0) continue;

        const info = STRATUM_COLORS[stratum] || STRATUM_COLORS['LOGIC'];
        lines.push(`${info.ascii} ${stratum} ${'─'.repeat(maxWidth - stratum.length - 4)}`);

        lines.push('');

        for (const g of glyphsInStratum) {
            const opcode = g.opcode || 'NOP';
            const valueStr = showValues && g.invariants?.value !== undefined
                ? ` = ${JSON.stringify(g.invariants.value).slice(0, 30)}`
                : '';
            const depsStr = g.dependencies?.length > 0
                ? ` → [${g.dependencies.join(', ')}]`
                : '';

            lines.push(`    [${g.id}] ${opcode}${valueStr}${depsStr}`);
        }
        lines.push('');
    }

    // Footer
    lines.push('╔' + '═'.repeat(maxWidth - 2) + '╗');
    lines.push(`  Total: ${Object.keys(glyphs).length} glyphs`);
    lines.push('╚' + '═'.repeat(maxWidth - 2) + '╝');

    return lines.join('\n');
}

/**
 * Generate SVG visualization of a glyph program
 */
function renderSVG(program, options = {}) {
    const { width = 800, height = 600, nodeRadius = 30 } = options;
    const glyphs = program.glyphs || {};

    const nodeWidth = 100;
    const nodeHeight = 80;
    const padding = 50;

    // Calculate positions
    const positions = {};
    const stratumY = {
        'SUBSTRATE': height - 100,
        'MEMORY': height - 200,
        'LOGIC': height - 300,
        'SPEC': height - 400,
        'INTENT': height - 500
    };

    // Group by stratum
    const byStratum = {};
    for (const [id, glyph] of Object.entries(glyphs)) {
        const stratum = glyph.stratum || 'SUBSTRATE';
        if (!byStratum[stratum]) byStratum[stratum] = [];
        byStratum[stratum].push({ id, ...glyph });
    }

    // Position nodes
    for (const [stratum, glyphList] of Object.entries(byStratum)) {
        const y = stratumY[stratum] || height - 300;
        const totalWidth = glyphList.length * (nodeWidth + padding);
        const startX = Math.max(padding, (width - totalWidth) / 2);

        glyphList.forEach((g, idx) => {
            positions[g.id] = {
                x: startX + idx * (nodeWidth + padding),
                y
            };
        });
    }

    // Build SVG
    let svg = `<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="${width}" height="${height}" viewBox="0 0 ${width} ${height}">
  <style>
    .node { cursor: pointer; }
    .node:hover { filter: brightness(1.2); }
    .node-text { font-family: monospace; font-size: 12px; }
    .edge { stroke: #666; stroke-width: 2; fill: none; }
    .edge:hover { stroke: #999; stroke-width: 3; }
    text { font-family: sans-serif; }
  </style>
`;

    // Add title
    svg += `  <text x="${width/2}" y="30" text-anchor="middle" font-size="18" font-weight="bold">GlyphStratum Program</text>\n`;

    // Add edges
    for (const [id, glyph] of Object.entries(glyphs)) {
        const targetPos = positions[id];
        if (!targetPos || !glyph.dependencies) continue;

        for (const dep of glyph.dependencies) {
            const sourcePos = positions[dep];
            if (!sourcePos) continue;

            svg += `  <path class="edge" d="M ${sourcePos.x + nodeRadius} ${sourcePos.y} L ${targetPos.x - nodeRadius} ${targetPos.y}"/>\n`;
        }
    }

    // Add nodes
    for (const [id, glyph] of Object.entries(glyphs)) {
        const pos = positions[id];
        if (!pos) continue;

        const stratum = glyph.stratum || 'SUBSTRATE';
        const color = STRATUM_COLORS[stratum]?.hex || '#666';
        const opcode = glyph.opcode || 'NOP';

        svg += `  <g class="node">
    <circle cx="${pos.x}" cy="${pos.y}" r="${nodeRadius}" fill="${color}" opacity="0.9"/>
    <text x="${pos.x}" y="${pos.y - 5}" text-anchor="middle" class="node-text" fill="white" font-weight="bold">${id}</text>
    <text x="${pos.x}" y="${pos.y + 10}" text-anchor="middle" class="node-text" fill="white">${opcode}</text>
  </g>\n`;
    }

    // Add legend
    let legendY = 30;
    svg += `  <g transform="translate(${width - 120}, ${legendY})">\n`;
    for (const [stratum, info] of Object.entries(STRATUM_COLORS)) {
        svg += `    <rect x="0" y="${legendY}" width="15" height="15" fill="${info.hex}"/>\n`;
        svg += `    <text x="20" y="${legendY + 12}" font-size="11">${stratum}</text>\n`;
        legendY += 20;
    }
    svg += `  </g>\n`;

    svg += `</svg>`;

    return svg;
}

/**
 * Generate Mermaid diagram
 */
function renderMermaid(program) {
    const glyphs = program.glyphs || {};
    let mermaid = '```mermaid\ngraph TD\n';

    for (const [id, glyph] of Object.entries(glyphs)) {
        const opcode = glyph.opcode || 'NOP';
        const stratum = glyph.stratum || 'SUBSTRATE';
        const color = STRATUM_COLORS[stratum]?.hex || '#666';
        const label = `${id}:${opcode}`;

        mermaid += `    ${id}["${label}"]:::${stratum}\n`;

        if (glyph.dependencies) {
            for (const dep of glyph.dependencies) {
                mermaid += `    ${dep} --> ${id}\n`;
            }
        }
    }

    mermaid += '```';
    return mermaid;
}

/**
 * Generate DOT (Graphviz) diagram
 */
function renderDOT(program) {
    const glyphs = program.glyphs || {};
    let dot = 'digraph GlyphStratum {\n';
    dot += '  rankdir=TB;\n';
    dot += '  node [shape=box, style=filled];\n\n';

    // Group by stratum
    const strata = ['SUBSTRATE', 'MEMORY', 'LOGIC', 'SPEC', 'INTENT'];
    for (const stratum of strata) {
        const color = STRATUM_COLORS[stratum]?.hex || '#666';
        dot += `  subgraph cluster_${stratum} {\n`;
        dot += `    label="${stratum}";\n`;
        dot += `    style=filled;\n`;
        dot += `    color="${color}";\n`;
        dot += `    fillcolor="${color}20";\n`;

        for (const [id, glyph] of Object.entries(glyphs)) {
            if ((glyph.stratum || 'SUBSTRATE') === stratum) {
                const opcode = glyph.opcode || 'NOP';
                dot += `    ${id} [label="${id}: ${opcode}"];\n`;
            }
        }
        dot += `  }\n\n`;
    }

    // Add edges
    for (const [id, glyph] of Object.entries(glyphs)) {
        if (glyph.dependencies) {
            for (const dep of glyph.dependencies) {
                dot += `  ${dep} -> ${id};\n`;
            }
        }
    }

    dot += '}\n';
    return dot;
}

/**
 * Render program to file
 */
function renderToFile(program, outputPath, format = 'svg') {
    let content;
    switch (format) {
        case 'ascii':
            content = renderASCII(program);
            break;
        case 'svg':
            content = renderSVG(program);
            break;
        case 'mermaid':
            content = renderMermaid(program);
            break;
        case 'dot':
            content = renderDOT(program);
            break;
        default:
            throw new Error(`Unknown format: ${format}`);
    }

    fs.writeFileSync(outputPath, content);
    return outputPath;
}

/**
 * Print ASCII visualization to console
 */
function printVisualization(program) {
    console.log(renderASCII(program));
}

module.exports = {
    renderASCII,
    renderSVG
    renderMermaid,
    renderDOT
    renderToFile,
    printVisualization,
    STRATUM_COLORS
};
