; DESCRIPTION: Draws a green rectangle at (136, 122) with width 18 and height 33.
; PLAN: r0=136(x), r1=122(y), r2=18(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 122
LDI r2, 18
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
