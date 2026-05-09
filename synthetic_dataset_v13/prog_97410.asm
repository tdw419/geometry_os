; DESCRIPTION: Draws a purple rectangle at (41, 37) with width 76 and height 11.
; PLAN: r0=41(x), r1=37(y), r2=76(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 37
LDI r2, 76
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
