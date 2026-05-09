; DESCRIPTION: Draws a magenta rectangle at (137, 124) with width 117 and height 114.
; PLAN: r0=137(x), r1=124(y), r2=117(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 124
LDI r2, 117
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
