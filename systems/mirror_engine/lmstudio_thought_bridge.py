#!/usr/bin/env python3
"""
LM Studio → Thought Gateway Bridge

Connects LM Studio token stream to the Thought Gateway API.
Each token becomes a logged thought visible in the Mirror App overlay.

Architecture:
  LM Studio (localhost:1234) → Token Stream → Thought Gateway (8765) → Mirror App

Usage:
    python3 lmstudio_thought_bridge.py --prompt "Explain geometry"
    python3 lmstudio_thought_bridge.py --stream  # Interactive mode
"""

import os
import sys
import json
import time
import argparse
import requests
from pathlib import Path
from datetime import datetime

# Configuration
LM_STUDIO_URL = "http://localhost:1234/v1/chat/completions"
THOUGHT_GATEWAY_URL = "http://localhost:8765"
DEFAULT_MODEL = "local-model"


class LMStudioThoughtBridge:
    """
    Bridges LM Studio token stream to Thought Gateway.

    Flow:
    1. Send prompt to LM Studio
    2. Receive streaming tokens
    3. Log each token as a thought to Thought Gateway
    4. Frontend overlay displays thoughts in real-time
    """

    def __init__(self, gateway_url: str = THOUGHT_GATEWAY_URL):
        self.gateway_url = gateway_url
        self.token_count = 0
        self.buffer = ""  # Buffer for accumulating words
        self.position = {"x": 10, "y": 10}  # Track position for spatial logging

    def test_lm_studio(self) -> bool:
        """Test connection to LM Studio"""
        try:
            response = requests.get("http://localhost:1234/v1/models", timeout=5)
            if response.status_code == 200:
                models = response.json().get("data", [])
                print(f"✓ LM Studio connected - {len(models)} model(s) available")
                for m in models:
                    print(f"  - {m.get('id', 'unknown')}")
                return True
        except:
            pass
        print("✗ LM Studio not reachable at localhost:1234")
        return False

    def test_gateway(self) -> bool:
        """Test connection to Thought Gateway"""
        try:
            response = requests.get(f"{self.gateway_url}/stats", timeout=5)
            if response.status_code == 200:
                data = response.json()
                print(f"✓ Thought Gateway connected (active: {data.get('logger_active', False)})")
                return True
        except:
            pass
        print(f"✗ Thought Gateway not reachable at {self.gateway_url}")
        print("  Start with: python3 thought_gateway.py")
        return False

    def log_thought(self, content: str, thought_type: str = "llm_token"):
        """Log a thought to the Thought Gateway"""
        try:
            payload = {
                "content": content,
                "x": self.position["x"],
                "y": self.position["y"],
                "thought_type": thought_type,
            }
            requests.post(f"{self.gateway_url}/thought", json=payload, timeout=5)
            # Advance position for next thought
            self.position["y"] += 20
            if self.position["y"] > 1000:
                self.position["y"] = 10
                self.position["x"] += 200
        except Exception as e:
            print(f"  (Gateway log failed: {e})")

    def stream(self, prompt: str, model: str = DEFAULT_MODEL):
        """
        Stream LM Studio response and log each chunk as a thought.
        """
        print("=" * 60)
        print("LM STUDIO → THOUGHT GATEWAY BRIDGE")
        print("=" * 60)
        print(f"Model: {model}")
        print(f"Prompt: {prompt[:60]}...")
        print()

        payload = {
            "model": model,
            "messages": [{"role": "user", "content": prompt}],
            "stream": True,
        }

        try:
            response = requests.post(LM_STUDIO_URL, json=payload, stream=True, timeout=120)

            if response.status_code != 200:
                print(f"Error: LM Studio returned {response.status_code}")
                return

            print("--- STREAMING (Ctrl+C to stop) ---")
            print()

            for line in response.iter_lines():
                if not line:
                    continue

                chunk = line.decode("utf-8")
                if chunk.startswith("data: "):
                    chunk = chunk[6:]

                if chunk.strip() == "[DONE]":
                    break

                try:
                    data = json.loads(chunk)
                    delta = data.get("choices", [{}])[0].get("delta", {})
                    token = delta.get("content", "")

                    if token:
                        self.token_count += 1
                        self.buffer += token

                        # Log complete words/phrases
                        if token in [" ", "\n", ".", ",", "!", "?"] or len(self.buffer) > 30:
                            if self.buffer.strip():
                                # Truncate for display
                                display = self.buffer[:100]
                                if len(self.buffer) > 100:
                                    display += "..."

                                print(f"[{self.token_count}] {display}")
                                self.log_thought(display, "llm_stream")

                            self.buffer = ""

                except json.JSONDecodeError:
                    continue
                except Exception as e:
                    print(f"  (parse error: {e})")
                    continue

            # Log any remaining buffer
            if self.buffer.strip():
                print(f"[{self.token_count}] {self.buffer[:100]}")
                self.log_thought(self.buffer[:100], "llm_stream")

            print()
            print("--- STREAM COMPLETE ---")
            print(f"Total tokens: {self.token_count}")

        except requests.exceptions.ConnectionError:
            print(f"Cannot connect to LM Studio at {LM_STUDIO_URL}")
            print("Make sure LM Studio is running with local server enabled")
        except KeyboardInterrupt:
            print("\n\n--- STREAM INTERRUPTED ---")
            print(f"Total tokens so far: {self.token_count}")
        except Exception as e:
            print(f"Error: {e}")

    def demo_mode(self, prompt: str = "Hello from LM Studio demo"):
        """
        Demo mode - simulates LM Studio streaming without requiring actual LM Studio.
        """
        print("=" * 60)
        print("LM STUDIO → THOUGHT GATEWAY BRIDGE (DEMO MODE)")
        print("=" * 60)
        print(f"Prompt: {prompt}")
        print()

        # Simulated tokens
        simulated_response = f"""
Based on the geometry of the problem, I can see that {prompt.lower()} involves 
spatial reasoning. The key insight is that every point in the Hilbert curve 
maintains locality - nearby points in 1D remain nearby in 2D space.

This property is crucial for GPU cache efficiency. When the Glyph VM reads 
instructions sequentially, they're physically close in VRAM, minimizing 
cache misses.

Let me trace through the logic:
1. Map input coordinates using d2xy()
2. Fetch neighboring glyphs from texture
3. Execute microcode (LOAD, STORE, ADD)
4. Write results back to substrate

The beautiful thing is: the program IS the machine. No separation between 
code and data. Every pixel is simultaneously instruction and visualization.
""".split()

        print("--- SIMULATED STREAMING ---")
        print()

        for i, word in enumerate(simulated_response):
            self.token_count += 1
            print(f"[{self.token_count}] {word}")
            self.log_thought(word, "llm_demo")
            time.sleep(0.1)  # Simulate streaming delay

        print()
        print("--- DEMO COMPLETE ---")
        print(f"Total tokens: {self.token_count}")


def main():
    parser = argparse.ArgumentParser(
        description="LM Studio → Thought Gateway Bridge",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Test connections
  python3 lmstudio_thought_bridge.py --test
  
  # Run demo (no LM Studio required)
  python3 lmstudio_thought_bridge.py --demo
  
  # Stream from LM Studio
  python3 lmstudio_thought_bridge.py --prompt "Explain Hilbert curves"
  
  # Interactive mode
  python3 lmstudio_thought_bridge.py --stream
        """,
    )
    parser.add_argument("--prompt", "-p", type=str, help="Prompt to send to LM Studio")
    parser.add_argument("--stream", "-s", action="store_true", help="Interactive streaming mode")
    parser.add_argument("--demo", "-d", action="store_true", help="Demo mode (no LM Studio)")
    parser.add_argument("--test", "-t", action="store_true", help="Test connections")
    parser.add_argument("--model", "-m", type=str, default=DEFAULT_MODEL, help="Model name")
    parser.add_argument(
        "--gateway", "-g", type=str, default=THOUGHT_GATEWAY_URL, help="Gateway URL"
    )

    args = parser.parse_args()

    bridge = LMStudioThoughtBridge(gateway_url=args.gateway)

    if args.test:
        print("Testing connections...")
        lm_ok = bridge.test_lm_studio()
        gw_ok = bridge.test_gateway()
        print()
        if lm_ok and gw_ok:
            print("✓ All systems ready")
        else:
            print("✗ Some systems unavailable")

    elif args.demo:
        bridge.demo_mode(args.prompt or "Hello from LM Studio demo")

    elif args.prompt:
        if bridge.test_gateway():
            bridge.stream(args.prompt, args.model)

    elif args.stream:
        print("Interactive mode - type prompts (Ctrl+C to exit)")
        print()

        if bridge.test_gateway():
            try:
                while True:
                    prompt = input("\nPrompt: ").strip()
                    if prompt:
                        bridge.stream(prompt, args.model)
            except KeyboardInterrupt:
                print("\nGoodbye!")

    else:
        parser.print_help()


if __name__ == "__main__":
    main()
