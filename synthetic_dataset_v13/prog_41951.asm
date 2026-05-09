; DESCRIPTION: Draws a magenta rectangle at (184, 139) with width 37 and height 78.
; PLAN: r0=184(x), r1=139(y), r2=37(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 139
LDI r2, 37
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
