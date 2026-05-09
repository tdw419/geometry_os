; DESCRIPTION: Draws a black rectangle at (266, 216) with width 111 and height 26.
; PLAN: r0=266(x), r1=216(y), r2=111(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 216
LDI r2, 111
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
