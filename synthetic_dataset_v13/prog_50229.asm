; DESCRIPTION: Draws a magenta rectangle at (147, 94) with width 82 and height 110.
; PLAN: r0=147(x), r1=94(y), r2=82(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 94
LDI r2, 82
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
