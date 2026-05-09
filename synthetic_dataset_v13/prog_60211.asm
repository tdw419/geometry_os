; DESCRIPTION: Draws a magenta rectangle at (110, 169) with width 35 and height 46.
; PLAN: r0=110(x), r1=169(y), r2=35(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 169
LDI r2, 35
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
