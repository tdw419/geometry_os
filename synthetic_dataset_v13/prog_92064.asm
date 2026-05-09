; DESCRIPTION: Renders a magenta box of size 19x101 starting at (382, 122).
; PLAN: r0=382(x), r1=122(y), r2=19(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 122
LDI r2, 19
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
