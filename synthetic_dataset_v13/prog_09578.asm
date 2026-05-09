; DESCRIPTION: Draws a magenta rectangle at (76, 76) with width 89 and height 110.
; PLAN: r0=76(x), r1=76(y), r2=89(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 76
LDI r2, 89
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
