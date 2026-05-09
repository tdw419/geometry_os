; DESCRIPTION: Draws a magenta rectangle at (33, 184) with width 94 and height 20.
; PLAN: r0=33(x), r1=184(y), r2=94(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 184
LDI r2, 94
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
