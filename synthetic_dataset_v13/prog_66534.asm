; DESCRIPTION: Draws a magenta rectangle at (145, 124) with width 16 and height 110.
; PLAN: r0=145(x), r1=124(y), r2=16(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 124
LDI r2, 16
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
