; DESCRIPTION: Renders a magenta box of size 36x112 starting at (42, 3).
; PLAN: r0=42(x), r1=3(y), r2=36(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 3
LDI r2, 36
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
