"""
Geometry OS Memory Bridge
MCP tools for reading and writing structured data to GPU-backed Dev Memory.
"""

import json
import requests
import base64
from typing import Dict, List, Any, Optional

DAEMON_URL = "http://127.0.0.1:8769"

# Memory Map (4096x4096 substrate = 16,777,216 addresses)
# 0x000000 - 0x0FFFFF: System Reserved (1M pixels)
# 0x100000 - 0x1FFFFF: Dev Memory / Context Store (1M pixels)
# 0x200000 - 0xFFFFFF: Glyph Programs / Runtime
DEV_MEM_START = 0x100000
DEV_MEM_SIZE  = 0x100000  # 1M pixels (4MB)

def mem_write(addr_offset: int, data: str) -> Dict:
    """
    Write data to Dev Memory.
    addr_offset: offset from 0x100000
    data: string to store
    """
    if addr_offset >= DEV_MEM_SIZE:
        return {"error": "Offset exceeds Dev Memory size"}
    
    abs_addr = DEV_MEM_START + addr_offset
    # Convert string to hex words (32-bit LE)
    encoded = data.encode('utf-8')
    hex_words = ""
    for i in range(0, len(encoded), 4):
        chunk = encoded[i:i+4]
        # Pad with zeros if less than 4 bytes
        if len(chunk) < 4:
            chunk = chunk + b'\x00' * (4 - len(chunk))
        val = int.from_bytes(chunk, 'little')
        hex_words += f"{val:08x}"
    
    try:
        url = f"{DAEMON_URL}/write?addr=0x{abs_addr:08x}"
        resp = requests.post(url, data=hex_words, timeout=2)
        return {"status": "success", "response": resp.text.strip()}
    except Exception as e:
        return {"error": str(e)}

def mem_read(addr_offset: int, size_pixels: int) -> Dict:
    """
    Read data from Dev Memory.
    addr_offset: offset from 0x100000
    size_pixels: number of 32-bit words to read
    """
    abs_addr = DEV_MEM_START + addr_offset
    try:
        url = f"{DAEMON_URL}/peek?addr=0x{abs_addr:08x}&size={size_pixels}"
        resp = requests.get(url, timeout=2)
        hex_words = resp.text.strip().split()
        
        raw_bytes = bytearray()
        for word in hex_words:
            val = int(word, 16)
            raw_bytes.extend(val.to_bytes(4, 'little'))
            
        # Try to decode as utf-8, ignore errors for binary data
        content = raw_bytes.decode('utf-8', errors='replace').rstrip('\x00')
        
        return {
            "status": "success",
            "hex": hex_words,
            "content": content
        }
    except Exception as e:
        return {"error": str(e)}

def store_context(key: str, value: Any) -> Dict:
    """Store a JSON object in a named slot."""
    data = json.dumps({"key": key, "val": value})
    # For now, we just write to offset 0. 
    # In a real system, we'd have an allocation table at 0x100000.
    return mem_write(0, data)

def retrieve_context() -> Dict:
    """Retrieve the JSON object from offset 0."""
    res = mem_read(0, 256) # Read 1KB
    if "error" in res:
        return res
    try:
        return json.loads(res["content"])
    except Exception as e:
        return {"error": "Failed to parse context", "raw": res["content"]}
