; DESCRIPTION: Draws a magenta rectangle at (369, 179) with width 19 and height 56.
; PLAN: r0=369(x), r1=179(y), r2=19(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 179
LDI r2, 19
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
