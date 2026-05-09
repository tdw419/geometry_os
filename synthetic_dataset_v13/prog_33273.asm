; DESCRIPTION: Draws a purple rectangle at (26, 155) with width 16 and height 73.
; PLAN: r0=26(x), r1=155(y), r2=16(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 155
LDI r2, 16
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
