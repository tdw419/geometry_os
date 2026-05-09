; DESCRIPTION: Draws a blue rectangle at (311, 147) with width 110 and height 14.
; PLAN: r0=311(x), r1=147(y), r2=110(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 147
LDI r2, 110
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
