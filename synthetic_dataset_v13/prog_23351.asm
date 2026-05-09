; DESCRIPTION: Draws a yellow rectangle at (110, 132) with width 115 and height 84.
; PLAN: r0=110(x), r1=132(y), r2=115(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 132
LDI r2, 115
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
