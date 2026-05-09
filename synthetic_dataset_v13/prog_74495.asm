; DESCRIPTION: Draws a magenta rectangle at (204, 118) with width 29 and height 37.
; PLAN: r0=204(x), r1=118(y), r2=29(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 118
LDI r2, 29
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
