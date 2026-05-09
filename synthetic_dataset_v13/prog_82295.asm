; DESCRIPTION: Draws a green rectangle at (121, 136) with width 110 and height 85.
; PLAN: r0=121(x), r1=136(y), r2=110(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 136
LDI r2, 110
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
