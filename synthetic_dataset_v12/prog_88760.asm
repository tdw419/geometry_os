; DESCRIPTION: Draws a magenta rectangle at (124, 43) with width 110 and height 48.
; PLAN: r0=124(x), r1=43(y), r2=110(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 43
LDI r2, 110
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
