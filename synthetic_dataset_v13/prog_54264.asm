; DESCRIPTION: Renders a magenta box of size 25x101 starting at (379, 66).
; PLAN: r0=379(x), r1=66(y), r2=25(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 66
LDI r2, 25
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
