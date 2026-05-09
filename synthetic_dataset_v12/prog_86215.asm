; DESCRIPTION: Draws a yellow rectangle at (239, 145) with width 110 and height 33.
; PLAN: r0=239(x), r1=145(y), r2=110(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 145
LDI r2, 110
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
