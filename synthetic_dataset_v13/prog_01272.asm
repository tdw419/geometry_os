; DESCRIPTION: Draws a green rectangle at (324, 41) with width 104 and height 101.
; PLAN: r0=324(x), r1=41(y), r2=104(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 41
LDI r2, 104
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
