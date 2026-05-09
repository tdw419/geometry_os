; DESCRIPTION: Draws a yellow rectangle at (195, 121) with width 110 and height 99.
; PLAN: r0=195(x), r1=121(y), r2=110(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 121
LDI r2, 110
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
