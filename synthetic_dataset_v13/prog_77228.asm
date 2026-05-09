; DESCRIPTION: Draws a yellow rectangle at (266, 41) with width 30 and height 35.
; PLAN: r0=266(x), r1=41(y), r2=30(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 41
LDI r2, 30
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
