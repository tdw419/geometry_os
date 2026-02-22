# LLM-Powered Content Expansion

Intelligent content expansion for WordPress Evolution Daemon using ZAI Bridge (GLM-4).

## Overview

The LLM expansion system replaces template-based content expansion with intelligent LLM-generated improvements. It integrates seamlessly with the existing WordPress Evolution pipeline while providing robust safety mechanisms.

## Quick Start

### Template Mode (Default)

```bash
# Run with template-based expansion (no API key required)
python3 -m systems.evolution_daemon.wordpress.bridge_service --single-cycle
```

### LLM Mode

```bash
# Set your API key
export ZAI_API_KEY="your-api-key-here"

# Run with LLM-powered expansion
python3 -m systems.evolution_daemon.wordpress.bridge_service --llm --single-cycle
```

## CLI Flags

| Flag | Default | Description |
|------|---------|-------------|
| `--llm` | `False` | Enable LLM-powered content expansion |
| `--llm-model` | `glm-4-plus` | LLM model to use for expansion |
| `--llm-temperature` | `0.7` | Temperature for content generation (0.0-1.0) |
| `--no-backup` | `False` | Disable content backups before modification |

### Examples

```bash
# Run with LLM and custom model
python3 -m systems.evolution_daemon.wordpress.bridge_service --llm --llm-model glm-4

# Run with LLM and lower temperature (more deterministic)
python3 -m systems.evolution_daemon.wordpress.bridge_service --llm --llm-temperature 0.3

# Run without backups (not recommended for production)
python3 -m systems.evolution_daemon.wordpress.bridge_service --llm --no-backup

# Continuous service with LLM
python3 -m systems.evolution_daemon.wordpress.bridge_service --llm --interval 300
```

## Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `ZAI_API_KEY` | Yes* | API key for ZAI Bridge (*required when `--llm` is enabled) |

## Mode Comparison

| Feature | Template Mode | LLM Mode |
|---------|---------------|----------|
| **API Key Required** | No | Yes |
| **Content Quality** | Basic | High |
| **Confidence Score** | Fixed 0.3 | 0.5-0.95 (calculated) |
| **Expansion Ratio** | ~1.5x | 2-3x (target) |
| **Structure** | Static template | Dynamic headings/bullets |
| **Context Awareness** | None | Full post context |
| **Cost** | Free | API usage fees |
| **Fallback on Error** | N/A | Automatic to template |
| **Speed** | Instant | ~2-5 seconds |

## Safety Features

### Content Backup

By default, all content modifications create a backup before execution:

- **Location**: `/tmp/wp_evolution_backups/`
- **Format**: `post_{id}_{timestamp}.json`
- **Contents**: `post_id`, `content`, `timestamp`, `restored`, `metadata`

```python
# Backup file structure
{
  "post_id": 123,
  "content": "Original content here...",
  "timestamp": 1708500000,
  "restored": false,
  "metadata": {
    "improvement_type": "expansion",
    "confidence": 0.85
  }
}
```

### Confidence Threshold

Proposals below the minimum confidence threshold are automatically rejected:

- **Default threshold**: 0.7 (configurable via `SafetyConfig`)
- **Minimum content length**: 50 characters
- **Maximum content length**: 100KB

### Automatic Fallback

When LLM expansion fails, the system automatically falls back to template mode:

- **Triggers**: API timeout, API error, empty response, mock response
- **Fallback confidence**: 0.3 (fixed)
- **Result flag**: `fallback_used=True` in `ExpansionResult`

## Confidence Score Calculation

The confidence score for LLM-generated content is calculated using a multi-factor formula:

```
confidence = base + length_bonus + structure_bonus
```

### Components

| Component | Range | Condition |
|-----------|-------|-----------|
| **Base** | 0.5 | Always (LLM generated) |
| **Length Bonus** | 0.0 - 0.3 | Based on expansion ratio |
| **Structure Bonus** | 0.0 - 0.2 | Based on headings and bullets |
| **Maximum Cap** | 0.95 | Final score ceiling |

### Length Bonus

```python
if 2.0 <= expansion_ratio <= 3.0:
    length_bonus = 0.3  # Perfect ratio
elif 1.5 <= expansion_ratio <= 4.0:
    length_bonus = 0.15  # Acceptable ratio
else:
    length_bonus = 0.0  # Poor ratio
```

### Structure Bonus

```python
# Headings bonus (## or ###)
heading_count = count of '##' or '###' markers
if heading_count >= 2:
    structure_bonus += 0.1

# Bullets bonus (- or *)
bullet_count = count of bullet points
if bullet_count >= 3:
    structure_bonus += 0.1
```

## Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    Bridge Service                        │
│  ┌─────────────────────────────────────────────────┐    │
│  │              CLI Argument Parser                 │    │
│  │  --llm, --llm-model, --llm-temperature, etc.   │    │
│  └─────────────────────────────────────────────────┘    │
│                          │                               │
│                          ▼                               │
│  ┌─────────────────────────────────────────────────┐    │
│  │           BridgeServiceConfig                    │    │
│  │  llm_enabled, llm_model, safety_config          │    │
│  └─────────────────────────────────────────────────┘    │
│                          │                               │
│                          ▼                               │
│  ┌─────────────────────────────────────────────────┐    │
│  │          WordPressContentAnalyzer               │    │
│  │  llm_enabled flag, lazy-loaded LLM service      │    │
│  └─────────────────────────────────────────────────┘    │
│                          │                               │
│            ┌─────────────┴─────────────┐                │
│            │                           │                 │
│            ▼                           ▼                 │
│  ┌──────────────────┐      ┌──────────────────┐        │
│  │ Template Mode    │      │ LLM Mode         │        │
│  │ (fallback)       │      │ (ZAIBridge)      │        │
│  │ Confidence: 0.3  │      │ Confidence: 0.5+ │        │
│  └──────────────────┘      └──────────────────┘        │
│                                        │                 │
│                                        ▼                 │
│                          ┌──────────────────┐           │
│                          │ Safety Validation│           │
│                          │ + Backup         │           │
│                          └──────────────────┘           │
└─────────────────────────────────────────────────────────┘
```

## Components

### LLMExpansionService

Main service for content expansion via ZAI Bridge.

```python
from systems.evolution_daemon.wordpress.llm_expansion_service import (
    LLMExpansionService,
    LLMExpansionConfig,
    ExpansionResult
)

# Create service with LLM enabled
config = LLMExpansionConfig(
    model="glm-4-plus",
    temperature=0.7,
    llm_enabled=True
)
service = LLMExpansionService(config)

# Expand content
result = service.expand(
    post_id=123,
    title="My Post Title",
    content="Original content...",
    context="Optional additional context"
)

print(f"Confidence: {result.confidence}")
print(f"Fallback used: {result.fallback_used}")
print(f"Expansion ratio: {result.expansion_ratio:.2f}x")
```

### SafetyConfig

Configuration for safety controls.

```python
from systems.evolution_daemon.wordpress.safety_config import (
    SafetyConfig,
    ContentBackup,
    validate_proposal_safety
)

# Conservative defaults
config = SafetyConfig(
    require_backup=True,
    min_confidence=0.7,
    backup_dir="/tmp/wp_evolution_backups",
    max_modifications_per_hour=10
)

# Validate a proposal
proposal = {
    "confidence": 0.85,
    "content": "Generated content..."
}
is_safe, reason = validate_proposal_safety(proposal, config)
```

### ContentBackup

Backup management for safe modifications.

```python
from systems.evolution_daemon.wordpress.safety_config import ContentBackup

backup = ContentBackup(config)

# Save backup before modification
path = backup.save(
    post_id=123,
    content="Original content",
    metadata={"improvement_type": "expansion", "confidence": 0.85}
)

# Load most recent backup
data = backup.load(post_id=123)

# Mark as restored
backup.mark_restored(post_id=123, timestamp=data["timestamp"])

# Cleanup old backups (default: 1 week)
removed = backup.cleanup_old_backups(max_age_hours=24 * 7)
```

## Testing

### Run All LLM Expansion Tests

```bash
# Unit tests
pytest tests/test_llm_expansion_service.py -v
pytest tests/test_safety_config.py -v
pytest tests/test_bridge_cli.py -v

# Integration tests
pytest tests/test_llm_expansion_integration.py -v

# All tests with coverage
pytest tests/test_llm_*.py tests/test_safety_config.py tests/test_bridge_cli.py \
    --cov=systems.evolution_daemon.wordpress.llm_expansion_service \
    --cov=systems.evolution_daemon.wordpress.safety_config \
    --cov-report=term-missing
```

### Mock Mode (No API Key Required)

The system supports testing without an API key using ZAI Bridge's built-in mock mode:

```python
# When ZAIBridge has no API key, it returns mock responses
# LLMExpansionService detects these and falls back to template
# This enables CI/CD testing without API credentials
```

## Troubleshooting

### Common Issues

1. **"ZAIBridge not available"**
   - Ensure `zai_bridge` module is in Python path
   - Check `ZAI_API_KEY` environment variable

2. **"Safety validation failed: Confidence X below minimum Y"**
   - Increase `--min-confidence` threshold
   - Check LLM output quality

3. **"Backup creation failed"**
   - Check disk space in `/tmp/wp_evolution_backups/`
   - Verify write permissions

4. **LLM returns empty content**
   - Check API rate limits
   - Verify model availability
   - System will auto-fallback to template

### Debug Mode

```bash
# Enable verbose logging
python3 -m systems.evolution_daemon.wordpress.bridge_service --llm --verbose
```

## Related Documentation

- [ZAI Bridge Documentation](../../../zai_bridge/README.md)
- [WordPress Evolution Daemon](../README.md)
- [Content Analyzer](./content_analyzer.py)
- [Safety Config](./safety_config.py)
