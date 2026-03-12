"""
Training Harness for PixelBrain Visual Training.
Trains a small Transformer on Hilbert-aligned Atlas sequences.
Using raw PyTorch for the training loop to avoid dependency issues.
"""

import os
import torch
import torch.nn as nn
from torch.utils.data import Dataset, DataLoader
from transformers import GPT2Config, GPT2LMHeadModel
from pathlib import Path
import numpy as np

# Local imports
import sys
PROJECT_ROOT = "/home/jericho/zion/projects/geometry_os/geometry_os"
sys.path.append(PROJECT_ROOT)
from systems.pixel_brain.constants import *

# Configuration
DATASET_DIR = Path(PROJECT_ROOT) / "data" / "pixel_brain_training"
SEQUENCES_DIR = DATASET_DIR / "sequences"
CHECKPOINT_DIR = Path(PROJECT_ROOT) / "checkpoints" / "pixel_brain_v1"

# Ensure directories exist
CHECKPOINT_DIR.mkdir(parents=True, exist_ok=True)

class PixelBrainDataset(Dataset):
    """
    Loads Hilbert-ordered sequences of Atlas Indices.
    """
    def __init__(self, sequences_dir):
        self.files = sorted(list(sequences_dir.glob("*.npy")))
        print(f"📂 Found {len(self.files)} training sequences.")

    def __len__(self):
        return len(self.files)

    def __getitem__(self, idx):
        seq = np.load(self.files[idx]).astype(np.int64)
        
        # Take causal slices
        q0_slice = seq[PROMPT_STEPS[0] + 100 : PROMPT_STEPS[0] + 300]
        q1_slice = seq[INTENT_STEPS[0] + 100 : INTENT_STEPS[0] + 200]
        q2_slice = seq[CODE_STEPS[0] + 100 : CODE_STEPS[0] + 300]
        
        input_ids = np.concatenate([q0_slice, q1_slice, q2_slice])
        return torch.tensor(input_ids)

def train():
    # 1. Setup Dataset
    dataset = PixelBrainDataset(SEQUENCES_DIR)
    dataloader = DataLoader(dataset, batch_size=8, shuffle=True)
    
    # 2. Setup Model (Tiny GPT-2)
    config = GPT2Config(
        vocab_size=1024,
        n_positions=1024,
        n_ctx=1024,
        n_embd=256,
        n_layer=4,
        n_head=4,
        bos_token_id=OPCODE_NOP,
        eos_token_id=OPCODE_HALT,
    )
    model = GPT2LMHeadModel(config)
    
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model.to(device)
    
    print(f"🤖 Initializing PixelBrain (125M-style TinyStories transformer)")
    print(f"   - Layers: {config.n_layer}, Heads: {config.n_head}, Embedding: {config.n_embd}")
    print(f"   - Device: {device}")

    # 3. Optimizer
    optimizer = torch.optim.AdamW(model.parameters(), lr=5e-4)

    # 4. Mock Training Loop (1 step to verify architecture)
    print("🔥 Starting training...")
    model.train()
    
    for batch in dataloader:
        batch = batch.to(device)
        outputs = model(batch, labels=batch)
        loss = outputs.loss
        
        optimizer.zero_grad()
        loss.backward()
        optimizer.step()
        
        print(f"  - Initial Loss: {loss.item():.4f}")
        break # Just one step for prototype validation
        
    print("✅ Training step complete.")
    
    # Save model
    model.save_pretrained(CHECKPOINT_DIR)
    print(f"💾 Model saved to {CHECKPOINT_DIR}")

if __name__ == "__main__":
    train()
