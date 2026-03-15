import numpy as np
import requests
import argparse
import time

# Geometry OS Substrate API
API_URL = "http://127.0.0.1:8769"

def init_weights(v, d):
    """Initialize weights using Xavier/Glorot scaling."""
    scale = np.sqrt(2.0 / (v + d))
    weights = np.random.randn(v, d) * scale
    # Convert to u32 bits (fixed point or raw bits?)
    # For Geometry OS substrate, we use RGBA8, so 4 bytes per weight.
    # We'll map float weights to u32 space. 0.0 -> 0x80000000
    # Let's use a simpler mapping for now: (w + 1.0) / 2.0 * 2^32
    weights_clamped = np.clip(weights, -1.0, 1.0)
    weights_u32 = ((weights_clamped + 1.0) / 2.0 * (2**32 - 1)).astype(np.uint32)
    return weights_u32

def upload_weights(addr, weights):
    """Upload weight matrix to substrate via API."""
    data_hex = "".join([f"{w:08x}" for w in weights.flatten()])
    print(f"Uploading {len(weights.flatten())} weights to 0x{addr:08x}...")
    
    # We might need to chunk this if it's too large for a single POST
    chunk_size = 1024 # larger chunks
    for i in range(0, len(weights.flatten()), chunk_size):
        chunk = weights.flatten()[i:i+chunk_size]
        chunk_hex = "".join([f"{w:08x}" for w in chunk])
        
        # Retry mechanism
        max_retries = 3
        for attempt in range(max_retries):
            try:
                r = requests.post(f"{API_URL}/write?addr=0x{addr+i:08x}", data=chunk_hex, headers={"Expect": ""}, timeout=5)
                if r.status_code == 200:
                    break
                print(f"Error uploading chunk {i}, attempt {attempt+1}: {r.text}")
            except Exception as e:
                print(f"Connection error uploading chunk {i}, attempt {attempt+1}: {e}")
            
            if attempt < max_retries - 1:
                time.sleep(0.5)
        else:
            print(f"Failed to upload chunk {i} after {max_retries} attempts.")
            return False
            
        time.sleep(0.01) # Small sleep to prevent overwhelming the daemon
    return True

def main():
    parser = argparse.ArgumentParser(description="Initialize Self-Modifying Transformer weights on Geometry OS Substrate")
    parser.add_argument("--dim", type=int, default=128, help="Model dimension (D)")
    parser.add_argument("--vocab", type=int, default=256, help="Vocab size (V)")
    args = parser.parse_args()

    v, d = args.vocab, args.dim
    print(f"Initializing Transformer Substrate (V={v}, D={d})...")
    layout = {
        "embedding": 0x0000,   # V x D
        "w_q": 0x1000,         # D x D
        "w_k": 0x1800,         # D x D
        "w_v": 0x2000,         # D x D
        "ffn1": 0x3000,        # D x 4D
        "ffn2": 0x3800,        # 4D x D
    }

    # Initialize and Upload
    for name, addr in layout.items():
        if name == "embedding": shape = (v, d)
        elif name == "ffn1": shape = (d, d*4)
        elif name == "ffn2": shape = (d*4, d)
        else: shape = (d, d)
        
        weights = init_weights(*shape)
        if not upload_weights(addr, weights):
            print(f"Failed to upload {name}")
            return

    print("Substrate initialized successfully.")

if __name__ == "__main__":
    main()
