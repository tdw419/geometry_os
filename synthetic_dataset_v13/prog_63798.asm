; DESCRIPTION: Draws a magenta rectangle at (249, 172) with width 62 and height 78.
; PLAN: r0=249(x), r1=172(y), r2=62(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 172
LDI r2, 62
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
