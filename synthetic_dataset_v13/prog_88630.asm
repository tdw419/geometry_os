; DESCRIPTION: Draws a magenta rectangle at (347, 135) with width 13 and height 77.
; PLAN: r0=347(x), r1=135(y), r2=13(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 135
LDI r2, 13
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
