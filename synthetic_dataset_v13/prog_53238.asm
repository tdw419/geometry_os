; DESCRIPTION: Draws a magenta rectangle at (461, 139) with width 48 and height 29.
; PLAN: r0=461(x), r1=139(y), r2=48(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 139
LDI r2, 48
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
