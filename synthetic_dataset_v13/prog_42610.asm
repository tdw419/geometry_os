; DESCRIPTION: Draws a magenta rectangle at (158, 155) with width 86 and height 19.
; PLAN: r0=158(x), r1=155(y), r2=86(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 155
LDI r2, 86
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
