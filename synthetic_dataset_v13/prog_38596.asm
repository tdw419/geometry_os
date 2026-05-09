; DESCRIPTION: Draws a black rectangle at (416, 19) with width 54 and height 114.
; PLAN: r0=416(x), r1=19(y), r2=54(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 19
LDI r2, 54
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
