; DESCRIPTION: Draws a yellow rectangle at (129, 162) with width 35 and height 30.
; PLAN: r0=129(x), r1=162(y), r2=35(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 162
LDI r2, 35
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
