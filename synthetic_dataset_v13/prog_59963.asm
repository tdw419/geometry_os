; DESCRIPTION: Draws a green rectangle at (364, 131) with width 41 and height 119.
; PLAN: r0=364(x), r1=131(y), r2=41(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 131
LDI r2, 41
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
