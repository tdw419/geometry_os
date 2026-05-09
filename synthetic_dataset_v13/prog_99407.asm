; DESCRIPTION: Draws a magenta rectangle at (59, 201) with width 20 and height 31.
; PLAN: r0=59(x), r1=201(y), r2=20(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 201
LDI r2, 20
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
