; DESCRIPTION: Draws a magenta rectangle at (20, 105) with width 63 and height 83.
; PLAN: r0=20(x), r1=105(y), r2=63(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 105
LDI r2, 63
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
