; DESCRIPTION: Draws a magenta rectangle at (110, 121) with width 36 and height 37.
; PLAN: r0=110(x), r1=121(y), r2=36(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 121
LDI r2, 36
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
