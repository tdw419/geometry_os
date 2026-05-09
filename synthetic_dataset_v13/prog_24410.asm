; DESCRIPTION: Draws a magenta rectangle at (78, 57) with width 85 and height 11.
; PLAN: r0=78(x), r1=57(y), r2=85(width), r3=11(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 57
LDI r2, 85
LDI r3, 11
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
