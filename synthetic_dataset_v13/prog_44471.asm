; DESCRIPTION: Draws a magenta rectangle at (428, 19) with width 11 and height 101.
; PLAN: r0=428(x), r1=19(y), r2=11(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 19
LDI r2, 11
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
