; DESCRIPTION: Draws a magenta rectangle at (6, 27) with width 62 and height 118.
; PLAN: r0=6(x), r1=27(y), r2=62(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 27
LDI r2, 62
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
