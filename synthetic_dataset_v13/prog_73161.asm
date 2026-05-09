; DESCRIPTION: Draws a magenta rectangle at (123, 94) with width 31 and height 118.
; PLAN: r0=123(x), r1=94(y), r2=31(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 94
LDI r2, 31
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
