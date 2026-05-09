; DESCRIPTION: Renders a magenta box of size 62x100 starting at (226, 42).
; PLAN: r0=226(x), r1=42(y), r2=62(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 42
LDI r2, 62
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
