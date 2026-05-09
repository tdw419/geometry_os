; DESCRIPTION: Draws a magenta rectangle at (269, 118) with width 95 and height 78.
; PLAN: r0=269(x), r1=118(y), r2=95(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 118
LDI r2, 95
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
