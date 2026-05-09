; DESCRIPTION: Draws a magenta rectangle at (297, 75) with width 114 and height 46.
; PLAN: r0=297(x), r1=75(y), r2=114(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 75
LDI r2, 114
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
