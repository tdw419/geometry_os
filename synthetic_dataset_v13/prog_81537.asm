; DESCRIPTION: Draws a yellow rectangle at (127, 110) with width 87 and height 83.
; PLAN: r0=127(x), r1=110(y), r2=87(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 110
LDI r2, 87
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
