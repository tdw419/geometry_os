; DESCRIPTION: Draws a green rectangle at (227, 95) with width 17 and height 44.
; PLAN: r0=227(x), r1=95(y), r2=17(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 95
LDI r2, 17
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
