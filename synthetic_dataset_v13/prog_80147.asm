; DESCRIPTION: Draws a magenta rectangle at (192, 5) with width 114 and height 62.
; PLAN: r0=192(x), r1=5(y), r2=114(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 5
LDI r2, 114
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
