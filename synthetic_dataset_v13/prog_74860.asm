; DESCRIPTION: Renders a magenta box of size 24x34 starting at (42, 154).
; PLAN: r0=42(x), r1=154(y), r2=24(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 154
LDI r2, 24
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
