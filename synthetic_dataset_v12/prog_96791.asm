; DESCRIPTION: Draws a magenta rectangle at (26, 119) with width 109 and height 37.
; PLAN: r0=26(x), r1=119(y), r2=109(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 119
LDI r2, 109
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
