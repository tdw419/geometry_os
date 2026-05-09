; DESCRIPTION: Draws a magenta rectangle at (100, 139) with width 24 and height 58.
; PLAN: r0=100(x), r1=139(y), r2=24(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 139
LDI r2, 24
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
