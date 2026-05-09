; DESCRIPTION: Draws a magenta rectangle at (232, 35) with width 92 and height 89.
; PLAN: r0=232(x), r1=35(y), r2=92(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 35
LDI r2, 92
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
