; DESCRIPTION: Draws a magenta rectangle at (147, 35) with width 97 and height 108.
; PLAN: r0=147(x), r1=35(y), r2=97(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 35
LDI r2, 97
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
