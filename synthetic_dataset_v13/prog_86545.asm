; DESCRIPTION: Draws a magenta rectangle at (424, 84) with width 10 and height 77.
; PLAN: r0=424(x), r1=84(y), r2=10(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 84
LDI r2, 10
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
