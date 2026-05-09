; DESCRIPTION: Draws a blue rectangle at (147, 159) with width 66 and height 54.
; PLAN: r0=147(x), r1=159(y), r2=66(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 159
LDI r2, 66
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
