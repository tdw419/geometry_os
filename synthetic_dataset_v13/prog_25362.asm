; DESCRIPTION: Draws a purple rectangle at (49, 1) with width 107 and height 89.
; PLAN: r0=49(x), r1=1(y), r2=107(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 1
LDI r2, 107
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
