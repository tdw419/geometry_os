; DESCRIPTION: Draws a green rectangle at (163, 137) with width 66 and height 41.
; PLAN: r0=163(x), r1=137(y), r2=66(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 137
LDI r2, 66
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
