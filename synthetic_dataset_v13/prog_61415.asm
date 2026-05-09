; DESCRIPTION: Renders a magenta box of size 86x12 starting at (382, 217).
; PLAN: r0=382(x), r1=217(y), r2=86(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 217
LDI r2, 86
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
