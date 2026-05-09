; DESCRIPTION: Draws a green rectangle at (222, 219) with width 55 and height 19.
; PLAN: r0=222(x), r1=219(y), r2=55(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 219
LDI r2, 55
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
