"""
Prompt templates for PixelBrain LLM inference.

These templates guide the LLM in making tectonic decisions.
"""

from typing import Tuple, List, Dict, Any

# System prompt for tectonic agent decision making
TECTONIC_AGENT_SYSTEM_PROMPT = """You are an intelligent spatial negotiation agent in a distributed computing system.

Your role is to help agents make optimal decisions about claiming and bidding on
spatial tiles in a tectonic grid. You analyze situations and provide reasoned
recommendations for:

1. Claim Analysis: Determining optimal bid amounts for tiles
2. Counter-Bid Decisions: Deciding whether to compete for tiles
3. District Purpose: Inferring collective purposes of agent clusters
4. District Naming: Generating meaningful names for spatial regions

Always respond in the requested format. Be concise but thorough in your reasoning.
Focus on practical, numerical decisions rather than abstract explanations."""

# Template for analyzing a tile claim
CLAIM_ANALYSIS_PROMPT = """Analyze the following tile claim and recommend an optimal bid amount.

**Tile Coordinates:** ({x}, {y})
**Distance from Origin:** {distance:.2f} units
**Claim Purpose:** "{purpose}"
**Available Budget:** {budget:.2f}
**Budget Already Reserved:** {reserved:.2f}
**Budget Already Consumed:** {consumed:.2f}

**Context:**
- Tiles closer to origin (0,0) are generally more valuable
- Higher purposes like "critical infrastructure" may warrant higher bids
- You should reserve at least 20% of budget for future opportunities
- Consider the distance decay factor

**Response Format:**
Provide your recommendation in this exact JSON format:
```json
{{
    "recommended_bid": <float>,
    "confidence": <float between 0 and 1>,
    "reasoning": "<brief explanation of the bid strategy>"
}}
```

Respond with ONLY the JSON, no additional text."""

# Template for counter-bid decision
COUNTER_BID_PROMPT = """Decide whether to submit a counter-bid on an existing claim.

**Original Claim Details:**
- Tile: ({x}, {y})
- Original Bid: {original_bid:.2f}
- Purpose: "{purpose}"
- Original Agent ID: {original_agent_id}

**Your Situation:**
- Your Budget: {my_budget:.2f}
- Your Reserved Budget: {my_reserved:.2f}
- Your Already Won Claims: {won_claims_count}

**Strategic Considerations:**
- Counter-bids compete against the original claimant
- Winning requires a bid higher than the original
- The tile's value depends on distance and purpose alignment
- Aggressive counter-bidding can deplete budget quickly

**Response Format:**
Provide your decision in this exact JSON format:
```json
{{
    "should_counter": <true or false>,
    "suggested_counter_bid": <float or null if not countering>,
    "confidence": <float between 0 and 1>,
    "reasoning": "<brief explanation of the decision>"
}}
```

Respond with ONLY the JSON, no additional text."""

# Template for inferring district purpose
DISTRICT_PURPOSE_PROMPT = """Analyze a cluster of agents and infer their collective purpose.

**Agent Cluster Information:**
{agents_info}

**Spatial Context:**
- Cluster Center: ({center_x}, {center_y})
- Cluster Radius: {radius:.2f} tiles
- Total Agents in Cluster: {total_agents}

**Individual Agent Data:**
{agent_details}

**Task:**
Based on the agents' purposes, strategies, and spatial arrangement, infer what
this district/cluster is collectively trying to accomplish. Consider:
- Common themes in agent purposes
- Spatial clustering patterns
- Strategic alignment between agents

**Response Format:**
Provide your inference in this exact JSON format:
```json
{{
    "inferred_purpose": "<one of: infrastructure, residential, commercial, industrial, transportation, research, mixed, unknown>",
    "purpose_description": "<detailed description of the district's purpose>",
    "cohesion_score": <float between 0 and 1>,
    "key_activities": ["<activity1>", "<activity2>", ...]
}}
```

Respond with ONLY the JSON, no additional text."""

# Template for generating district names
DISTRICT_NAMING_PROMPT = """Generate a meaningful name for a spatial district based on its characteristics.

**District Characteristics:**
- Primary Purpose: {primary_purpose}
- Cohesion Score: {cohesion:.2f}
- Tile Count: {tile_count}
- Center Position: ({center_x}, {center_y})

**Agent Purposes in District:**
{purpose_list}

**Naming Guidelines:**
- Names should reflect the district's primary function
- Consider geographic or thematic naming conventions
- Names should be memorable and evocative
- 1-3 words is ideal length
- Avoid generic names like "District 1" or "Zone A"

**Examples:**
- A cluster of research agents: "Nexus Labs", "Innovation Hub", "Discovery Ridge"
- A cluster of infrastructure agents: "Foundry Quarter", "Power Grid", "Core Systems"
- A mixed-purpose cluster: "Harmony Commons", "Unity Plaza", "Fusion District"

**Response Format:**
Provide your name suggestions in this exact JSON format:
```json
{{
    "primary_name": "<the best name for the district>",
    "alternative_names": ["<alternative 1>", "<alternative 2>"],
    "reasoning": "<brief explanation of the naming choice>"
}}
```

Respond with ONLY the JSON, no additional text."""


def format_agents_info(agents: List[Dict[str, Any]]) -> str:
    """Format agent information for district purpose prompt."""
    lines = []
    for i, agent in enumerate(agents):
        lines.append(
            f"  Agent {i+1}: ID={agent.get('agent_id', 'unknown')}, "
            f"Purpose='{agent.get('purpose', 'unknown')}', "
            f"Strategy={agent.get('strategy_type', 'unknown')}"
        )
    return "\n".join(lines)


def format_purpose_list(purposes: List[str]) -> str:
    """Format purpose list for district naming prompt."""
    # Count occurrences
    purpose_counts = {}
    for purpose in purposes:
        purpose_counts[purpose] = purpose_counts.get(purpose, 0) + 1

    # Sort by count
    sorted_purposes = sorted(purpose_counts.items(), key=lambda x: -x[1])

    lines = []
    for purpose, count in sorted_purposes:
        lines.append(f"  - {purpose} ({count} agents)")

    return "\n".join(lines)
