; DESCRIPTION: Draws a magenta rectangle at (315, 136) with width 100 and height 14.
; PLAN: r0=315(x), r1=136(y), r2=100(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 136
LDI r2, 100
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
