; DESCRIPTION: Draws a purple rectangle at (63, 41) with width 20 and height 119.
; PLAN: r0=63(x), r1=41(y), r2=20(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 41
LDI r2, 20
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
