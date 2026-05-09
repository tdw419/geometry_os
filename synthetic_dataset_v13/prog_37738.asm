; DESCRIPTION: Draws a magenta rectangle at (432, 124) with width 52 and height 33.
; PLAN: r0=432(x), r1=124(y), r2=52(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 124
LDI r2, 52
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
