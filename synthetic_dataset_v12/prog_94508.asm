; DESCRIPTION: Draws a magenta rectangle at (139, 65) with width 44 and height 67.
; PLAN: r0=139(x), r1=65(y), r2=44(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 65
LDI r2, 44
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
