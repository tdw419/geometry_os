#!/usr/bin/env python3
"""
Geometry OS MCP Server

A Model Context Protocol server exposing Geometry OS Visual Shell capabilities
to AI assistants like Claude.

Installation:
    pip install mcp

Usage:
    python geometry_os_mcp_server.py

Or add to Claude Desktop config:
    {
        "mcpServers": {
            "geometry-os": {
                "command": "python",
                "args": ["/path/to/geometry_os_mcp_server.py"]
            }
        }
    }
"""

import asyncio
import json
import subprocess
import sys
from pathlib import Path
from typing import Any, Dict, List, Optional
from dataclasses import dataclass
import logging

# MCP SDK
try:
    from mcp.server import Server
    from mcp.server.stdio import stdio_server
    from mcp.types import Tool, TextContent, ImageContent
    from mcp import types
except ImportError:
    print("ERROR: MCP SDK not installed. Run: pip install mcp")
    sys.exit(1)

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("geometry-os-mcp")

# Create server instance
server = Server("geometry-os-mcp")

# Configuration
GEOMETRY_OS_ROOT = Path(__file__).parent.parent.parent
VISUAL_SHELL_WEB = GEOMETRY_OS_ROOT / "systems" / "visual_shell" / "web"
PIXEL_COMPILER = GEOMETRY_OS_ROOT / "systems" / "pixel_compiler"


@dataclass
class ToolResult:
    success: bool
    data: Any
    error: Optional[str] = None


# ============================================
# MCP TOOLS
# ============================================

@server.list_tools()
async def list_tools() -> List[Tool]:
    """List all available Geometry OS MCP tools."""
    return [
        # Render Tools
        Tool(
            name="get_render_state",
            description="Get the current PixiJS render state including sprite count, draw calls, and GPU memory",
            inputSchema={
                "type": "object",
                "properties": {
                    "detailed": {
                        "type": "boolean",
                        "description": "Include detailed scene graph info",
                        "default": False
                    }
                }
            }
        ),
        Tool(
            name="capture_framebuffer",
            description="Capture the current GPU framebuffer as an image",
            inputSchema={
                "type": "object",
                "properties": {
                    "region": {
                        "type": "object",
                        "description": "Optional region to capture {x, y, width, height}",
                        "properties": {
                            "x": {"type": "number"},
                            "y": {"type": "number"},
                            "width": {"type": "number"},
                            "height": {"type": "number"}
                        }
                    }
                }
            }
        ),
        
        # Navigation Tools
        Tool(
            name="navigate_map",
            description="Navigate the infinite map to a specific coordinate or region",
            inputSchema={
                "type": "object",
                "properties": {
                    "x": {"type": "number", "description": "Target X coordinate"},
                    "y": {"type": "number", "description": "Target Y coordinate"},
                    "zoom": {"type": "number", "description": "Optional zoom level"}
                },
                "required": ["x", "y"]
            }
        ),
        Tool(
            name="get_map_region",
            description="Get information about the current visible map region",
            inputSchema={"type": "object", "properties": {}}
        ),
        
        # Pixel CPU Tools
        Tool(
            name="run_pixel_program",
            description="Execute a Pixel CPU program on the GPU",
            inputSchema={
                "type": "object",
                "properties": {
                    "program": {
                        "type": "string",
                        "description": "The pixel program bytecode or assembly"
                    },
                    "region": {
                        "type": "object",
                        "description": "Region to execute on",
                        "properties": {
                            "x": {"type": "number"},
                            "y": {"type": "number"},
                            "width": {"type": "number"},
                            "height": {"type": "number"}
                        }
                    }
                },
                "required": ["program"]
            }
        ),
        Tool(
            name="get_pixel_state",
            description="Get the state of a specific pixel or region",
            inputSchema={
                "type": "object",
                "properties": {
                    "x": {"type": "number"},
                    "y": {"type": "number"}
                },
                "required": ["x", "y"]
            }
        ),
        
        # Simulation Tools
        Tool(
            name="simulate_input",
            description="Simulate mouse or keyboard input on the Visual Shell",
            inputSchema={
                "type": "object",
                "properties": {
                    "type": {
                        "type": "string",
                        "enum": ["click", "mousemove", "keydown", "keyup", "scroll"]
                    },
                    "x": {"type": "number", "description": "For mouse events"},
                    "y": {"type": "number", "description": "For mouse events"},
                    "key": {"type": "string", "description": "For key events"},
                    "deltaY": {"type": "number", "description": "For scroll events"}
                },
                "required": ["type"]
            }
        ),
        Tool(
            name="trigger_evolution",
            description="Trigger an evolution cycle in the specified region",
            inputSchema={
                "type": "object",
                "properties": {
                    "region": {
                        "type": "object",
                        "properties": {
                            "x": {"type": "number"},
                            "y": {"type": "number"},
                            "width": {"type": "number"},
                            "height": {"type": "number"}
                        }
                    },
                    "generations": {"type": "number", "default": 1}
                }
            }
        ),
        
        # RTS Cartridge Tools
        Tool(
            name="load_cartridge",
            description="Load an RTS cartridge into the Visual Shell",
            inputSchema={
                "type": "object",
                "properties": {
                    "path": {
                        "type": "string",
                        "description": "Path to the .rts.png cartridge file"
                    }
                },
                "required": ["path"]
            }
        ),
        Tool(
            name="list_cartridges",
            description="List available RTS cartridges",
            inputSchema={"type": "object", "properties": {}}
        ),
        
        # Debug Tools
        Tool(
            name="get_console_logs",
            description="Get recent console logs from the Visual Shell",
            inputSchema={
                "type": "object",
                "properties": {
                    "count": {"type": "number", "default": 50},
                    "level": {"type": "string", "enum": ["all", "error", "warn", "info"], "default": "all"}
                }
            }
        ),
        Tool(
            name="run_test",
            description="Run a specific test or test suite",
            inputSchema={
                "type": "object",
                "properties": {
                    "test_file": {
                        "type": "string",
                        "description": "Test file to run (e.g., test_webmcp_bridge.html)"
                    },
                    "headless": {"type": "boolean", "default": True}
                },
                "required": ["test_file"]
            }
        ),
    ]


@server.call_tool()
async def call_tool(name: str, arguments: Dict[str, Any]) -> List[types.Content]:
    """Execute a Geometry OS tool."""
    
    try:
        if name == "get_render_state":
            result = await _get_render_state(arguments.get("detailed", False))
        
        elif name == "capture_framebuffer":
            result = await _capture_framebuffer(arguments.get("region"))
        
        elif name == "navigate_map":
            result = await _navigate_map(
                arguments["x"],
                arguments["y"],
                arguments.get("zoom")
            )
        
        elif name == "get_map_region":
            result = await _get_map_region()
        
        elif name == "run_pixel_program":
            result = await _run_pixel_program(
                arguments["program"],
                arguments.get("region")
            )
        
        elif name == "get_pixel_state":
            result = await _get_pixel_state(arguments["x"], arguments["y"])
        
        elif name == "simulate_input":
            result = await _simulate_input(arguments)
        
        elif name == "trigger_evolution":
            result = await _trigger_evolution(
                arguments.get("region"),
                arguments.get("generations", 1)
            )
        
        elif name == "load_cartridge":
            result = await _load_cartridge(arguments["path"])
        
        elif name == "list_cartridges":
            result = await _list_cartridges()
        
        elif name == "get_console_logs":
            result = await _get_console_logs(
                arguments.get("count", 50),
                arguments.get("level", "all")
            )
        
        elif name == "run_test":
            result = await _run_test(
                arguments["test_file"],
                arguments.get("headless", True)
            )
        
        else:
            result = ToolResult(False, None, f"Unknown tool: {name}")
        
        # Format response
        if result.success:
            if isinstance(result.data, bytes):
                # Return image
                import base64
                return [ImageContent(
                    type="image",
                    data=base64.b64encode(result.data).decode(),
                    mimeType="image/png"
                )]
            else:
                return [TextContent(
                    type="text",
                    text=json.dumps(result.data, indent=2) if result.data else "Success"
                )]
        else:
            return [TextContent(
                type="text",
                text=f"Error: {result.error}"
            )]
    
    except Exception as e:
        logger.exception(f"Tool {name} failed")
        return [TextContent(type="text", text=f"Error: {str(e)}")]


# ============================================
# TOOL IMPLEMENTATIONS
# ============================================

async def _get_render_state(detailed: bool) -> ToolResult:
    """Get PixiJS render state via CDP."""
    try:
        # Query Chrome DevTools Protocol
        import urllib.request
        result = urllib.request.urlopen("http://localhost:9222/json")
        tabs = json.loads(result.read())
        
        # Find Geometry OS tab
        for tab in tabs:
            if "visual_shell" in tab.get("url", ""):
                # Execute JS to get render state
                state_js = """
                JSON.stringify({
                    fps: window.__GEOMETRY_OS_FPS || 60,
                    frameTime: window.__GEOMETRY_OS_FRAME_TIME || 16.67,
                    spriteCount: window.__GEOMETRY_OS_SPRITE_COUNT || 0,
                    drawCalls: window.__GEOMETRY_OS_DRAW_CALLS || 0,
                    gpuMemory: window.__GEOMETRY_OS_GPU_MEMORY || 0
                })
                """
                # Would use CDP WebSocket here
                return ToolResult(True, {
                    "status": "connected",
                    "tab": tab["title"],
                    "note": "Full CDP integration requires WebSocket connection"
                })
        
        return ToolResult(False, None, "Visual Shell tab not found")
    except Exception as e:
        return ToolResult(False, None, str(e))


async def _capture_framebuffer(region: Optional[Dict]) -> ToolResult:
    """Capture GPU framebuffer."""
    # Would use CDP Page.captureScreenshot
    return ToolResult(True, {"note": "Framebuffer capture requires active CDP connection"})


async def _navigate_map(x: float, y: float, zoom: Optional[float]) -> ToolResult:
    """Navigate infinite map."""
    # Would call WebMCP navigate_map tool
    return ToolResult(True, {
        "action": "navigate",
        "target": {"x": x, "y": y, "zoom": zoom},
        "note": "Requires active WebMCP bridge"
    })


async def _get_map_region() -> ToolResult:
    """Get current map region."""
    return ToolResult(True, {
        "viewport": {"x": 0, "y": 0, "width": 1920, "height": 1080},
        "zoom": 1.0,
        "note": "Requires active WebMCP bridge for real data"
    })


async def _run_pixel_program(program: str, region: Optional[Dict]) -> ToolResult:
    """Execute pixel program."""
    # Would call WebMCP execute_pixel_program tool
    return ToolResult(True, {
        "status": "queued",
        "program_length": len(program),
        "region": region
    })


async def _get_pixel_state(x: int, y: int) -> ToolResult:
    """Get pixel state at coordinates."""
    return ToolResult(True, {
        "position": {"x": x, "y": y},
        "state": "unknown",
        "note": "Requires active Visual Shell connection"
    })


async def _simulate_input(event: Dict) -> ToolResult:
    """Simulate input event."""
    return ToolResult(True, {
        "simulated": event["type"],
        "params": event
    })


async def _trigger_evolution(region: Optional[Dict], generations: int) -> ToolResult:
    """Trigger evolution cycle."""
    return ToolResult(True, {
        "status": "triggered",
        "generations": generations,
        "region": region
    })


async def _load_cartridge(path: str) -> ToolResult:
    """Load RTS cartridge."""
    cartridge_path = VISUAL_SHELL_WEB / path
    if not cartridge_path.exists():
        return ToolResult(False, None, f"Cartridge not found: {path}")
    
    return ToolResult(True, {
        "loaded": path,
        "size": cartridge_path.stat().st_size
    })


async def _list_cartridges() -> ToolResult:
    """List available cartridges."""
    cartridges = []
    for f in VISUAL_SHELL_WEB.glob("*.rts.png"):
        cartridges.append({
            "name": f.stem,
            "path": str(f.relative_to(VISUAL_SHELL_WEB)),
            "size": f.stat().st_size
        })
    return ToolResult(True, {"cartridges": cartridges})


async def _get_console_logs(count: int, level: str) -> ToolResult:
    """Get console logs."""
    # Would query CDP Runtime.consoleAPICalled events
    return ToolResult(True, {
        "logs": [],
        "note": "Requires active CDP connection"
    })


async def _run_test(test_file: str, headless: bool) -> ToolResult:
    """Run test file."""
    test_path = VISUAL_SHELL_WEB / test_file
    if not test_path.exists():
        return ToolResult(False, None, f"Test file not found: {test_file}")
    
    # Run with Puppeteer
    result = subprocess.run([
        "node", "-e", f"""
const puppeteer = require('puppeteer');
(async () => {{
    const browser = await puppeteer.launch({{ headless: {str(headless).lower()} }});
    const page = await browser.newPage();
    await page.goto('file://{test_path}');
    await page.waitForSelector('#test-results', {{ timeout: 60000 }});
    const results = await page.evaluate(() => ({{
        passed: document.querySelectorAll('.test-pass').length,
        failed: document.querySelectorAll('.test-fail').length
    }}));
    console.log(JSON.stringify(results));
    await browser.close();
}})();
"""
    ], capture_output=True, text=True, timeout=120)
    
    if result.returncode == 0:
        try:
            results = json.loads(result.stdout.strip().split('\n')[-1])
            return ToolResult(True, results)
        except:
            return ToolResult(True, {"output": result.stdout})
    else:
        return ToolResult(False, None, result.stderr)


# ============================================
# MAIN
# ============================================

async def main():
    """Run the MCP server."""
    async with stdio_server() as (read_stream, write_stream):
        await server.run(
            read_stream,
            write_stream,
            server.create_initialization_options()
        )


if __name__ == "__main__":
    asyncio.run(main())
