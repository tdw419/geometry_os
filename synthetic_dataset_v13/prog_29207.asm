; DESCRIPTION: Draws a magenta rectangle at (366, 136) with width 94 and height 87.
; PLAN: r0=366(x), r1=136(y), r2=94(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 136
LDI r2, 94
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
