; DESCRIPTION: Draws a magenta rectangle at (37, 124) with width 15 and height 118.
; PLAN: r0=37(x), r1=124(y), r2=15(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 124
LDI r2, 15
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
