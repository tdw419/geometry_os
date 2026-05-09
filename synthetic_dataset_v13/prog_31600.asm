; DESCRIPTION: Draws a purple rectangle at (227, 177) with width 107 and height 79.
; PLAN: r0=227(x), r1=177(y), r2=107(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 177
LDI r2, 107
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
