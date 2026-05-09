; DESCRIPTION: Draws a purple rectangle at (222, 79) with width 89 and height 107.
; PLAN: r0=222(x), r1=79(y), r2=89(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 79
LDI r2, 89
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
