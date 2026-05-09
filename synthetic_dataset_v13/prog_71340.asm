; DESCRIPTION: Draws a yellow rectangle at (457, 7) with width 35 and height 83.
; PLAN: r0=457(x), r1=7(y), r2=35(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 7
LDI r2, 35
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
