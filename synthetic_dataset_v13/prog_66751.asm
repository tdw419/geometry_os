; DESCRIPTION: Draws a magenta rectangle at (323, 84) with width 110 and height 37.
; PLAN: r0=323(x), r1=84(y), r2=110(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 84
LDI r2, 110
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
