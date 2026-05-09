; DESCRIPTION: Draws a magenta rectangle at (221, 158) with width 20 and height 21.
; PLAN: r0=221(x), r1=158(y), r2=20(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 158
LDI r2, 20
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
