import * as vscode from 'vscode';

export class GlyphPreviewProvider implements vscode.Disposable {
    private panel: vscode.WebviewPanel | undefined;
    private context: vscode.ExtensionContext;

    constructor(context: vscode.ExtensionContext) {
        this.context = context;
    }

    showPreview(document: vscode.TextDocument): void {
        if (this.panel) {
            this.panel.reveal(vscode.ViewColumn.Two);
        } else {
            this.panel = vscode.window.createWebviewPanel(
                'glyphPreview',
                'GlyphStratum Preview',
                vscode.ViewColumn.Two,
                {
                    enableScripts: true,
                    retainContextWhenHidden: true
                }
            );

            this.panel.onDidDispose(() => {
                this.panel = undefined;
            }, null, this.context.subscriptions);
        }

        this.updatePreview(document);
    }

    isVisible(): boolean {
        return this.panel !== undefined;
    }

    updatePreview(document: vscode.TextDocument): void {
        if (!this.panel) {
            return;
        }

        try {
            const content = document.getText();
            const program = JSON.parse(content);
            const html = this.generatePreviewHtml(program);
            this.panel.webview.html = html;
        } catch (error) {
            this.panel.webview.html = this.generateErrorHtml(String(error));
        }
    }

    private generateErrorHtml(error: string): string {
        return `<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: var(--vscode-font-family);
            padding: 20px;
            background: var(--vscode-editor-background);
            color: var(--vscode-editor-foreground);
        }
        .error {
            color: var(--vscode-errorForeground);
            background: var(--vscode-inputValidation-errorBackground);
            padding: 10px;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="error">Error parsing glyph program: ${error}</div>
</body>
</html>`;
    }

    // Embedded JS runtime for execution
    private getEmbeddedRuntime(): string {
        return `
class GlyphRuntime {
    constructor() {
        this.glyphs = {};
        this.values = {};
        this.memory = {};
        this.valueCount = 0;
        this.executionOrder = [];
        this.executedGlyphs = new Set();
    }

    makeValue(val) {
        let valueObj;
        if (typeof val === 'boolean') {
            valueObj = { type: 'bool', value: val };
        } else if (typeof val === 'number') {
            valueObj = Number.isInteger(val)
                ? { type: 'int', value: val }
                : { type: 'float', value: val };
        } else if (typeof val === 'string') {
            valueObj = { type: 'string', value: val };
        } else if (Array.isArray(val)) {
            valueObj = { type: 'array', value: [...val] };
        } else {
            valueObj = { type: 'int', value: 0 };
        }
        const idx = this.valueCount++;
        this.values[idx] = valueObj;
        return { ...valueObj, valueIdx: idx };
    }

    addGlyph(id, glyph) {
        this.glyphs[id] = { ...glyph, id };
    }

    getValue(glyphId) {
        const glyph = this.glyphs[glyphId];
        if (!glyph) return { type: 'int', value: 0 };
        if (glyph.valueIdx !== undefined) {
            return this.values[glyph.valueIdx];
        }
        return { type: 'int', value: 0 };
    }

    computeExecutionOrder() {
        const visited = new Set();
        const order = [];

        const visit = (id) => {
            if (visited.has(id)) return;
            visited.add(id);
            const glyph = this.glyphs[id];
            if (glyph && glyph.dependencies) {
                glyph.dependencies.forEach(dep => visit(String(dep)));
            }
            order.push(id);
        };

        Object.keys(this.glyphs).forEach(id => visit(id));
        this.executionOrder = order;
        return order;
    }

    execute() {
        this.computeExecutionOrder();
        this.executedGlyphs.clear();

        for (const id of this.executionOrder) {
            const glyph = this.glyphs[id];
            if (!glyph) continue;

            this.executedGlyphs.add(id);

            switch (glyph.opcode) {
                case 'DATA': {
                    const val = this.makeValue(glyph.invariants?.value ?? 0);
                    glyph.valueIdx = val.valueIdx;
                    break;
                }
                case 'LOAD': {
                    const name = glyph.invariants?.name;
                    const val = this.memory[name] ?? { type: 'int', value: 0 };
                    const newVal = this.makeValue(val.value);
                    glyph.valueIdx = newVal.valueIdx;
                    break;
                }
                case 'STORE': {
                    const name = glyph.invariants?.name;
                    const depId = String(glyph.dependencies[0]);
                    const depVal = this.getValue(depId);
                    this.memory[name] = depVal;
                    glyph.valueIdx = this.makeValue(depVal.value).valueIdx;
                    break;
                }
                case 'ADD': {
                    const a = this.getValue(String(glyph.dependencies[0]));
                    const b = this.getValue(String(glyph.dependencies[1]));
                    const result = (a.value || 0) + (b.value || 1);
                    const val = this.makeValue(result);
                    glyph.valueIdx = val.valueIdx;
                    break;
                }
                case 'SUB': {
                    const a = this.getValue(String(glyph.dependencies[0]));
                    const b = this.getValue(String(glyph.dependencies[1]));
                    const result = (a.value || 0) - (b.value || 1);
                    const val = this.makeValue(result);
                    glyph.valueIdx = val.valueIdx;
                    break;
                }
                case 'MUL': {
                    const a = this.getValue(String(glyph.dependencies[0]));
                    const b = this.getValue(String(glyph.dependencies[1]));
                    const result = (a.value || 0) * (b.value || 1);
                    const val = this.makeValue(result);
                    glyph.valueIdx = val.valueIdx;
                    break;
                }
                case 'DIV': {
                    const a = this.getValue(String(glyph.dependencies[0]));
                    const b = this.getValue(String(glyph.dependencies[1]));
                    const result = b.value !== 0 ? Math.floor((a.value || 0) / b.value) : 0;
                    const val = this.makeValue(result);
                    glyph.valueIdx = val.valueIdx;
                    break;
                }
                case 'GT': {
                    const a = this.getValue(String(glyph.dependencies[0]));
                    const b = this.getValue(String(glyph.dependencies[1]));
                    const result = a.value > b.value;
                    const val = this.makeValue(result);
                    glyph.valueIdx = val.valueIdx;
                    break;
                }
                case 'LT': {
                    const a = this.getValue(String(glyph.dependencies[0]));
                    const b = this.getValue(String(glyph.dependencies[1]));
                    const result = a.value < b.value;
                    const val = this.makeValue(result);
                    glyph.valueIdx = val.valueIdx;
                    break;
                }
                case 'EQ': {
                    const a = this.getValue(String(glyph.dependencies[0]));
                    const b = this.getValue(String(glyph.dependencies[1]));
                    const result = a.value === b.value;
                    const val = this.makeValue(result);
                    glyph.valueIdx = val.valueIdx;
                    break;
                }
                case 'BRANCH': {
                    const cond = this.getValue(String(glyph.dependencies[0]));
                    const trueVal = this.getValue(String(glyph.dependencies[1]));
                    const falseVal = this.getValue(String(glyph.dependencies[2]));
                    const result = cond.value ? trueVal.value : falseVal.value;
                    const val = this.makeValue(result);
                    glyph.valueIdx = val.valueIdx;
                    break;
                }
                case 'CONCAT': {
                    const a = this.getValue(String(glyph.dependencies[0]));
                    const b = this.getValue(String(glyph.dependencies[1]));
                    const result = String(a.value || '') + String(b.value || '');
                    const val = this.makeValue(result);
                    glyph.valueIdx = val.valueIdx;
                    break;
                }
                case 'LEN': {
                    const a = this.getValue(String(glyph.dependencies[0]));
                    const result = String(a.value || '').length;
                    const val = this.makeValue(result);
                    glyph.valueIdx = val.valueIdx;
                    break;
                }
                case 'PUSH': {
                    const arr = this.getValue(String(glyph.dependencies[0]));
                    const elem = this.getValue(String(glyph.dependencies[1]));
                    const result = [...(arr.value || []), elem.value];
                    const val = this.makeValue(result);
                    glyph.valueIdx = val.valueIdx;
                    break;
                }
                case 'ARRAYLEN': {
                    const arr = this.getValue(String(glyph.dependencies[0]));
                    const result = (arr.value || []).length;
                    const val = this.makeValue(result);
                    glyph.valueIdx = val.valueIdx;
                    break;
                }
                case 'GET': {
                    const arr = this.getValue(String(glyph.dependencies[0]));
                    const idx = this.getValue(String(glyph.dependencies[1]));
                    const result = (arr.value || [])[idx.value || 0];
                    const val = this.makeValue(result);
                    glyph.valueIdx = val.valueIdx;
                    break;
                }
                default:
                    glyph.valueIdx = this.makeValue(0).valueIdx;
            }
        }

        return this.executionOrder.map(id => ({
            id,
            opcode: this.glyphs[id].opcode,
            result: this.getValue(id)
        }));
    }

    getExecutionTrace() {
        return this.executionOrder.map(id => ({
            id,
            opcode: this.glyphs[id].opcode,
            result: this.getValue(id),
            dependencies: this.glyphs[id].dependencies || []
        }));
    }
}
`;
    }

    private generatePreviewHtml(program: any): string {
        const glyphs = program.glyphs || {};

        // Generate SVG for graph visualization
        let nodesHtml = '';
        let edgesHtml = '';

        interface GlyphPosition {
            x: number;
            y: number;
        }

        const positions: Record<string, GlyphPosition> = {};
        const nodeWidth = 100;
        const nodeHeight = 50;
        const padding = 20;

        // Stratum colors
        const stratumColors: Record<string, string> = {
            'SUBSTRATE': '#2196F3',
            'MEMORY': '#4CAF50',
            'LOGIC': '#FF9800',
            'SPEC': '#9C27B0',
            'INTENT': '#F44336'
        };

        // Calculate positions by stratum
        const stratumY: Record<string, number> = {
            'SUBSTRATE': 50,
            'MEMORY': 130,
            'LOGIC': 210,
            'SPEC': 290,
            'INTENT': 370
        };

        const stratumGlyphs: Record<string, string[]> = {
            'SUBSTRATE': [],
            'MEMORY': [],
            'LOGIC': [],
            'SPEC': [],
            'INTENT': []
        };

        // Group glyphs by stratum
        for (const [id, glyph] of Object.entries(glyphs)) {
            const stratum = glyph.stratum || 'SUBSTRATE';
            if (stratumGlyphs[stratum]) {
                stratumGlyphs[stratum].push(id);
            }
        }

        // Position nodes
        for (const [stratum, ids] of Object.entries(stratumGlyphs)) {
            const y = stratumY[stratum] || 50;
            const totalWidth = ids.length * (nodeWidth + padding);
            const startX = 50;

            ids.forEach((id, index) => {
                const x = startX + index * (nodeWidth + padding);
                positions[id] = { x, y };
            });
        }

        // Generate nodes
        for (const [id, glyph] of Object.entries(glyphs)) {
            const pos = positions[id];
            if (!pos) continue;

            const color = stratumColors[glyph.stratum] || '#666';
            const label = glyph.opcode || 'NOP';
            const value = glyph.invariants?.value !== undefined
                ? JSON.stringify(glyph.invariants.value).slice(0, 20)
                : '';

            nodesHtml += `
                <g class="node-group" data-id="${id}">
                    <rect class="node-bg" x="${pos.x}" y="${pos.y}" width="${nodeWidth}" height="${nodeHeight}" rx="4" ry="4"/>
                    <rect class="node" x="${pos.x}" y="${pos.y}" width="${nodeWidth}" height="${nodeHeight}" rx="4" ry="4" fill="${color}"/>
                    <text class="node-id" x="${pos.x + 5}" y="${pos.y + 15}" fill="white" font-size="10" font-weight="bold">${id}</text>
                    <text class="node-opcode" x="${pos.x + 5}" y="${pos.y + 30}" fill="white" font-size="11">${label}</text>
                    <text class="node-value" x="${pos.x + 5}" y="${pos.y + 43}" fill="rgba(255,255,255,0.7)" font-size="9">${value}</text>
                </g>
            `;
        }

        // Generate edges
        for (const [id, glyph] of Object.entries(glyphs)) {
            const targetPos = positions[id];
            if (!targetPos || !glyph.dependencies) continue;

            glyph.dependencies.forEach((dep: number) => {
                const sourcePos = positions[String(dep)];
                if (!sourcePos) return;

                const x1 = sourcePos.x + nodeWidth;
                const y1 = sourcePos.y + nodeHeight / 2;
                const x2 = targetPos.x;
                const y2 = targetPos.y + nodeHeight / 2;

                edgesHtml += `
                    <path class="edge" d="M ${x1} ${y1} L ${x2} ${y2}" data-from="${dep}" data-to="${id}"/>
                `;
            });
        }

        return `<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: var(--vscode-font-family);
            padding: 0;
            margin: 0;
            background: var(--vscode-editor-background);
            color: var(--vscode-editor-foreground);
            overflow: hidden;
        }

        .container {
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        .toolbar {
            display: flex;
            gap: 8px;
            padding: 8px 12px;
            background: var(--vscode-editorGroupHeader-tabsBackground);
            border-bottom: 1px solid var(--vscode-editorGroupHeader-tabsBorder);
        }

        .toolbar button {
            padding: 4px 12px;
            border: 1px solid var(--vscode-button-border);
            background: var(--vscode-button-secondaryBackground);
            color: var(--vscode-button-secondaryForeground);
            border-radius: 3px;
            cursor: pointer;
            font-size: 12px;
        }

        .toolbar button:hover {
            background: var(--vscode-button-secondaryHoverBackground);
        }

        .toolbar button.active {
            background: var(--vscode-button-background);
            color: var(--vscode-button-foreground);
        }

        .canvas-container {
            flex: 1;
            overflow: hidden;
            position: relative;
        }

        #svgCanvas {
            width: 100%;
            height: 100%;
            cursor: grab;
        }

        #svgCanvas:active {
            cursor: grabbing;
        }

        .node-bg {
            fill: transparent;
            stroke: transparent;
        }

        .node {
            opacity: 0.9;
            transition: opacity 0.2s, filter 0.2s;
            filter: drop-shadow(1px 1px 2px rgba(0,0,0,0.3));
        }

        .node-group:hover .node {
            opacity: 1;
            filter: drop-shadow(2px 2px 4px rgba(0,0,0,0.5));
        }

        .node-group.selected .node {
            stroke: white;
            stroke-width: 2;
        }

        .node-group.executed .node {
            stroke: #4CAF50;
            stroke-width: 3;
            filter: drop-shadow(0 0 8px rgba(76, 175, 80, 0.6));
        }

        .edge {
            stroke: rgba(255,255,255,0.3);
            stroke-width: 2;
            fill: none;
            transition: stroke 0.2s, stroke-width 0.2s;
        }

        .edge:hover {
            stroke: rgba(255,255,255,0.6);
            stroke-width: 3;
        }

        .edge.executed {
            stroke: rgba(76, 175, 80, 0.8);
            stroke-width: 3;
            animation: edgePulse 1s ease-in-out;
        }

        @keyframes edgePulse {
            0%, 100% { stroke-opacity: 0.8; }
            50% { stroke-opacity: 1; }
        }

        .node-id {
            pointer-events: none;
            font-family: monospace;
        }

        .node-opcode {
            pointer-events: none;
            font-family: monospace;
        }

        .node-value {
            pointer-events: none;
            font-family: monospace;
        }

        .legend {
            position: absolute;
            top: 10px;
            right: 10px;
            background: var(--vscode-editor-background);
            border: 1px solid var(--vscode-editorGroupHeader-tabsBorder);
            border-radius: 4px;
            padding: 8px 12px;
            font-size: 11px;
        }

        .legend-item {
            display: flex;
            align-items: center;
            gap: 6px;
            margin: 4px 0;
        }

        .legend-color {
            width: 12px;
            height: 12px;
            border-radius: 2px;
        }

        .info-panel {
            position: absolute;
            bottom: 10px;
            left: 10px;
            right: 10px;
            background: var(--vscode-editor-background);
            border: 1px solid var(--vscode-editorGroupHeader-tabsBorder);
            border-radius: 4px;
            padding: 12px;
            font-size: 12px;
            max-height: 200px;
            overflow-y: auto;
            display: none;
        }

        .info-panel.visible {
            display: block;
        }

        .info-panel h3 {
            margin: 0 0 8px 0;
            font-size: 13px;
            color: var(--vscode-textLink-foreground);
        }

        .info-panel table {
            width: 100%;
            border-collapse: collapse;
        }

        .info-panel td {
            padding: 4px 0;
            border-bottom: 1px solid var(--vscode-editorGroupHeader-tabsBorder);
        }

        .info-panel td:first-child {
            font-weight: 500;
            width: 100px;
        }

        .execution-trace {
            position: absolute;
            top: 50px;
            left: 10px;
            background: var(--vscode-editor-background);
            border: 1px solid var(--vscode-editorGroupHeader-tabsBorder);
            border-radius: 4px;
            padding: 8px 12px;
            font-size: 11px;
            font-family: monospace;
            max-height: 300px;
            overflow-y: auto;
            display: none;
        }

        .execution-trace.visible {
            display: block;
        }

        .trace-item {
            padding: 4px 0;
            border-bottom: 1px solid var(--vscode-editorGroupHeader-tabsBorder);
        }

        .trace-item:last-child {
            border-bottom: none;
        }

        .trace-id {
            color: var(--vscode-textLink-foreground);
            font-weight: bold;
        }

        .trace-result {
            color: var(--vscode-textPreformat-foreground);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="toolbar">
            <button id="runBtn" onclick="runProgram()">▶ Run</button>
            <button id="stepBtn" onclick="stepProgram()">⏭ Step</button>
            <button id="resetBtn" onclick="resetProgram()">↺ Reset</button>
            <button onclick="zoomIn()">+</button>
            <button onclick="zoomOut()">-</button>
            <button onclick="resetZoom()">Reset Zoom</button>
            <button id="autoLayoutBtn" onclick="autoLayout()">Auto Layout</button>
        </div>

        <div class="canvas-container">
            <svg id="svgCanvas" viewBox="0 0 1200 600">
                <defs>
                    <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="9" refY="3.5" orient="auto">
                        <polygon points="0 0, 10 3.5, 0 7" fill="rgba(255,255,255,0.4)" />
                    </marker>
                </defs>
                <g id="edges">${edgesHtml}</g>
                <g id="nodes">${nodesHtml}</g>
            </svg>

            <div class="legend">
                <div class="legend-item"><div class="legend-color" style="background: #2196F3"></div>SUBSTRATE</div>
                <div class="legend-item"><div class="legend-color" style="background: #4CAF50"></div>MEMORY</div>
                <div class="legend-item"><div class="legend-color" style="background: #FF9800"></div>LOGIC</div>
                <div class="legend-item"><div class="legend-color" style="background: #9C27B0"></div>SPEC</div>
                <div class="legend-item"><div class="legend-color" style="background: #F44336"></div>INTENT</div>
            </div>

            <div class="execution-trace" id="executionTrace"></div>

            <div class="info-panel" id="infoPanel">
                <h3>Glyph <span id="infoGlyphId"></span></h3>
                <table>
                    <tr><td>Stratum</td><td id="infoStratum"></td></tr>
                    <tr><td>Opcode</td><td id="infoOpcode"></td></tr>
                    <tr><td>Dependencies</td><td id="infoDeps"></td></tr>
                    <tr><td>Result</td><td id="infoResult"></td></tr>
                </table>
            </div>
        </div>
    </div>

    <script>
        ${this.getEmbeddedRuntime()}

        const program = ${JSON.stringify(program)};
        const runtime = new GlyphRuntime();

        // Load program
        for (const [id, glyph] of Object.entries(program.glyphs || {})) {
            runtime.addGlyph(id, glyph);
        }

        let currentStep = 0;
        let trace = [];
        let isRunning = false;

        // Pan and zoom state
        let scale = 1;
        let translateX = 0;
        let translateY = 0;
        let isDragging = false;
        let startX = 0;
        let startY = 0;

        const svg = document.getElementById('svgCanvas');
        const edges = document.querySelectorAll('.edge');
        const nodeGroups = document.querySelectorAll('.node-group');

        // Node click handler
        nodeGroups.forEach(node => {
            node.addEventListener('click', (e) => {
                const id = node.dataset.id;
                const glyph = program.glyphs[id];
                const value = runtime.getValue(id);

                document.querySelectorAll('.node-group').forEach(n => n.classList.remove('selected'));
                node.classList.add('selected');

                document.getElementById('infoGlyphId').textContent = id;
                document.getElementById('infoStratum').textContent = glyph?.stratum || 'N/A';
                document.getElementById('infoOpcode').textContent = glyph?.opcode || 'N/A';
                document.getElementById('infoDeps').textContent = JSON.stringify(glyph?.dependencies || []);
                document.getElementById('infoResult').textContent = JSON.stringify(value);
                document.getElementById('infoPanel').classList.add('visible');
                e.stopPropagation();
            });
        });

        // Edge hover highlighting
        edges.forEach(edge => {
            edge.addEventListener('mouseenter', () => {
                const from = edge.dataset.from;
                const to = edge.dataset.to;
                document.querySelectorAll(\`.node-group[data-id="\${from}"], .node-group[data-id="\${to}"]\`).forEach(n => {
                    n.classList.add('selected');
                });
            });
            edge.addEventListener('mouseleave', () => {
                document.querySelectorAll('.node-group.selected').forEach(n => {
                    if (!n.classList.contains('executed')) {
                        n.classList.remove('selected');
                    }
                });
            });
        });

        // SVG pan and zoom
        svg.addEventListener('mousedown', (e) => {
            if (e.target.tagName === 'svg' || e.target.tagName === 'g') {
                isDragging = true;
                startX = e.clientX - translateX;
                startY = e.clientY - translateY;
                svg.style.cursor = 'grabbing';
            }
        });

        document.addEventListener('mousemove', (e) => {
            if (isDragging) {
                translateX = e.clientX - startX;
                translateY = e.clientY - startY;
                updateTransform();
            }
        });

        document.addEventListener('mouseup', () => {
            isDragging = false;
            svg.style.cursor = 'grab';
        });

        svg.addEventListener('wheel', (e) => {
            e.preventDefault();
            const delta = e.deltaY > 0 ? 0.9 : 1.1;
            scale *= delta;
            scale = Math.max(0.1, Math.min(3, scale));
            updateTransform();
        });

        function updateTransform() {
            const g = document.getElementById('nodes');
            const edgesG = document.getElementById('edges');
            const transform = \`translate(\${translateX}px, \${translateY}px) scale(\${scale})\`;
            g.setAttribute('transform', transform);
            edgesG.setAttribute('transform', transform);
        }

        function zoomIn() {
            scale *= 1.2;
            updateTransform();
        }

        function zoomOut() {
            scale *= 0.8;
            updateTransform();
        }

        function resetZoom() {
            scale = 1;
            translateX = 0;
            translateY = 0;
            updateTransform();
        }

        function autoLayout() {
            scale = 1;
            translateX = 0;
            translateY = 0;
            updateTransform();
        }

        function runProgram() {
            resetHighlights();
            trace = runtime.execute();
            currentStep = trace.length;
            highlightAll();
            showTrace();
            document.getElementById('runBtn').classList.add('active');
        }

        function stepProgram() {
            if (currentStep === 0) {
                runtime.computeExecutionOrder();
                trace = runtime.getExecutionTrace();
            }

            if (currentStep < trace.length) {
                const step = trace[currentStep];
                highlightGlyph(step.id);
                currentStep++;
                showTrace();
            }
        }

        function resetProgram() {
            currentStep = 0;
            trace = [];
            isRunning = false;
            resetHighlights();
            document.getElementById('runBtn').classList.remove('active');
            document.getElementById('executionTrace').classList.remove('visible');
        }

        function resetHighlights() {
            document.querySelectorAll('.node-group').forEach(n => n.classList.remove('executed', 'selected'));
            document.querySelectorAll('.edge').forEach(e => e.classList.remove('executed'));
        }

        function highlightGlyph(id) {
            const node = document.querySelector(\`.node-group[data-id="\${id}"]\`);
            if (node) {
                node.classList.add('executed');
            }

            // Highlight incoming edges
            const glyph = program.glyphs[id];
            if (glyph?.dependencies) {
                glyph.dependencies.forEach(dep => {
                    const edge = document.querySelector(\`.edge[data-from="\${dep}"][data-to="\${id}"]\`);
                    if (edge) {
                        edge.classList.add('executed');
                    }
                });
            }
        }

        function highlightAll() {
            trace.forEach(step => {
                highlightGlyph(step.id);
            });
        }

        function showTrace() {
            const traceEl = document.getElementById('executionTrace');
            let html = '';
            trace.forEach((step, i) => {
                const highlight = i < currentStep ? 'executed' : '';
                html += \`<div class="trace-item \${highlight}"><span class="trace-id">\${step.id}</span> \${step.opcode} → <span class="trace-result">\${JSON.stringify(step.result.value)}</span></div>\`;
            });
            traceEl.innerHTML = html;
            traceEl.classList.add('visible');
        }
    </script>
</body>
</html>`;
    }

    dispose(): void {
        if (this.panel) {
            this.panel.dispose();
            this.panel = undefined;
        }
    }
}
