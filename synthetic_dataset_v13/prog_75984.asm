; DESCRIPTION: Draws a yellow rectangle at (347, 33) with width 110 and height 58.
; PLAN: r0=347(x), r1=33(y), r2=110(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 33
LDI r2, 110
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
