; DESCRIPTION: Draws a yellow rectangle at (233, 162) with width 41 and height 73.
; PLAN: r0=233(x), r1=162(y), r2=41(width), r3=73(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 162
LDI r2, 41
LDI r3, 73
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
