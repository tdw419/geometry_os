; DESCRIPTION: Draws a purple rectangle at (147, 41) with width 29 and height 89.
; PLAN: r0=147(x), r1=41(y), r2=29(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 41
LDI r2, 29
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
