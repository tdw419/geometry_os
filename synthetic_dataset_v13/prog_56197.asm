; DESCRIPTION: Renders a magenta box of size 100x24 starting at (381, 73).
; PLAN: r0=381(x), r1=73(y), r2=100(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 73
LDI r2, 100
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
