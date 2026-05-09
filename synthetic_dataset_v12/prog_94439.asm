; DESCRIPTION: Draws a green rectangle at (170, 162) with width 73 and height 19.
; PLAN: r0=170(x), r1=162(y), r2=73(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 162
LDI r2, 73
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
