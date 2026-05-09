; DESCRIPTION: Renders a magenta box of size 116x54 starting at (382, 122).
; PLAN: r0=382(x), r1=122(y), r2=116(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 122
LDI r2, 116
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
