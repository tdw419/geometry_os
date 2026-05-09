; DESCRIPTION: Draws a magenta rectangle at (139, 86) with width 84 and height 102.
; PLAN: r0=139(x), r1=86(y), r2=84(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 86
LDI r2, 84
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
