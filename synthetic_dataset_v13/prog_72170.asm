; DESCRIPTION: Draws a magenta rectangle at (343, 7) with width 83 and height 101.
; PLAN: r0=343(x), r1=7(y), r2=83(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 7
LDI r2, 83
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
