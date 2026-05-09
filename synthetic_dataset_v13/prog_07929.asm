; DESCRIPTION: Draws a magenta rectangle at (179, 102) with width 34 and height 26.
; PLAN: r0=179(x), r1=102(y), r2=34(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 102
LDI r2, 34
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
