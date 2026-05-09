; DESCRIPTION: Renders a purple box of size 64x61 starting at (292, 155).
; PLAN: r0=292(x), r1=155(y), r2=64(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 155
LDI r2, 64
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
