; DESCRIPTION: Draws a black rectangle at (35, 104) with width 110 and height 84.
; PLAN: r0=35(x), r1=104(y), r2=110(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 104
LDI r2, 110
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
