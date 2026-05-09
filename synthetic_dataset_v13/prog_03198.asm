; DESCRIPTION: Draws a magenta rectangle at (85, 123) with width 31 and height 37.
; PLAN: r0=85(x), r1=123(y), r2=31(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 123
LDI r2, 31
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
