; DESCRIPTION: Draws a magenta rectangle at (190, 62) with width 37 and height 114.
; PLAN: r0=190(x), r1=62(y), r2=37(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 62
LDI r2, 37
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
