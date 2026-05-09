; DESCRIPTION: Draws a magenta rectangle at (139, 22) with width 83 and height 60.
; PLAN: r0=139(x), r1=22(y), r2=83(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 22
LDI r2, 83
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
