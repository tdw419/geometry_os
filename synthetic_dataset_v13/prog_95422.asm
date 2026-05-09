; DESCRIPTION: Draws a green rectangle at (13, 41) with width 49 and height 110.
; PLAN: r0=13(x), r1=41(y), r2=49(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 41
LDI r2, 49
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
