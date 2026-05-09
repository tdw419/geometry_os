; DESCRIPTION: Draws a purple rectangle at (211, 89) with width 41 and height 119.
; PLAN: r0=211(x), r1=89(y), r2=41(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 89
LDI r2, 41
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
