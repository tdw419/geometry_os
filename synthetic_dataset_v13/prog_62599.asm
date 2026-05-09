; DESCRIPTION: Draws a green rectangle at (147, 97) with width 110 and height 92.
; PLAN: r0=147(x), r1=97(y), r2=110(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 97
LDI r2, 110
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
