#!/usr/bin/env python3
"""Test glyph_editor.html validation logic"""
import json

STRATUM_ORDER = {"SUBSTRATE": 0, "MEMORY": 1, "LOGIC": 2, "SPEC": 3, "INTENT": 4}

def validate_glyphs(glyphs):
    """Validate a glyph program - same logic as the editor."""
    errors = []
    glyphs_dict = {g["id"]: g for g in glyphs}

    # Check coherence
    for g in glyphs:
        for dep_id in g.get("dependencies", []):
            dep = glyphs_dict.get(dep_id)
            if not dep:
                errors.append(f"Glyph #{g['id']} depends on missing glyph #{dep_id}")
            elif STRATUM_ORDER[dep["stratum"]] > STRATUM_ORDER[g["stratum"]]:
                errors.append(
                    f"Invalid: #{g['id']} ({g['stratum']}) depends on "
                    f"higher stratum #{dep_id} ({dep['stratum']})"
                )

    # Check for INTENT
    has_intent = any(g["stratum"] == "INTENT" for g in glyphs)
    if not has_intent and len(glyphs) > 0:
        errors.append("No INTENT glyph found")

    return errors


def test_valid_program():
    """Test a valid program."""
    glyphs = [
        {"id": 0, "stratum": "SUBSTRATE", "opcode": "DATA", "rationale": "a", "dependencies": []},
        {"id": 1, "stratum": "SUBSTRATE", "opcode": "DATA", "rationale": "b", "dependencies": []},
        {"id": 2, "stratum": "LOGIC", "opcode": "CALL", "rationale": "add", "dependencies": [0, 1]},
        {"id": 3, "stratum": "INTENT", "opcode": "MODULE", "rationale": "add", "dependencies": [2]},
    ]
    errors = validate_glyphs(glyphs)
    assert len(errors) == 0, f"Valid program should pass: got: {errors}"
    print("PASS: Valid program accepted")


    # Calculate coherence
    valid = 0
    total = 0
    for g in glyphs:
        for dep_id in g["dependencies"]:
            total += 1
            dep = next(d for d in glyphs if d["id"] == dep_id)
            if dep and STRATUM_ORDER[dep["stratum"]] <= STRATUM_ORDER[g["stratum"]]:
                valid += 1
    coherence = valid / total * 100 if total > 0 else 100
    print(f"PASS: Coherence = {coherence}%")


def test_invalid_stratum_order():
    """Test invalid stratum order detection."""
    # LOGIC depending on INTENT (invalid) - glyph 1 (LOGIC) depends on glyph 0 (INTENT)
    glyphs = [
        {"id": 0, "stratum": "INTENT", "opcode": "MODULE", "rationale": "intent", "dependencies": []},
        {"id": 1, "stratum": "LOGIC", "opcode": "CALL", "rationale": "logic", "dependencies": [0]},
    ]
    errors = validate_glyphs(glyphs)
    assert len(errors) > 0, f"Should detect invalid order, got: {errors}"
    assert "higher stratum" in errors[0]
    print("PASS: Invalid stratum order detected")


def test_missing_dependency():
    """Test missing dependency detection."""
    glyphs = [
        {"id": 0, "stratum": "LOGIC", "opcode": "CALL", "rationale": "orphan", "dependencies": [99]},
        {"id": 1, "stratum": "INTENT", "opcode": "MODULE", "rationale": "intent", "dependencies": [0]},
    ]
    errors = validate_glyphs(glyphs)
    assert len(errors) > 0, f"Should detect missing dependency, got: {errors}"
    assert "missing" in errors[0].lower()
    print("PASS: Missing dependency detected")


def test_missing_intent():
    """Test missing INTENT glyph detection."""
    glyphs = [
        {"id": 0, "stratum": "SUBSTRATE", "opcode": "DATA", "rationale": "data", "dependencies": []},
        {"id": 1, "stratum": "LOGIC", "opcode": "CALL", "rationale": "logic", "dependencies": [0]},
    ]
    errors = validate_glyphs(glyphs)
    assert len(errors) > 0, f"Should detect missing INTENT, got: {errors}"
    assert "INTENT" in errors[0]
    print("PASS: Missing INTENT detected")


if __name__ == "__main__":
    print("=" * 50)
    print("Glyph Editor Validation Tests")
    print("=" * 50)
    test_valid_program()
    test_invalid_stratum_order()
    test_missing_dependency()
    test_missing_intent()
    print("=" * 50)
    print("All tests passed!")
    print("=" * 50)
