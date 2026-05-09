; DESCRIPTION: Draws a green rectangle at (211, 88) with width 84 and height 19.
; PLAN: r0=211(x), r1=88(y), r2=84(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 88
LDI r2, 84
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
