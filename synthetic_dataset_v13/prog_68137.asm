; DESCRIPTION: Draws a yellow rectangle at (57, 216) with width 88 and height 35.
; PLAN: r0=57(x), r1=216(y), r2=88(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 216
LDI r2, 88
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
