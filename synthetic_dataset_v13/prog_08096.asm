; DESCRIPTION: Draws a blue rectangle at (81, 156) with width 94 and height 38.
; PLAN: r0=81(x), r1=156(y), r2=94(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 156
LDI r2, 94
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
