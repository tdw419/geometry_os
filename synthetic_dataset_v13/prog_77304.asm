; DESCRIPTION: Draws a magenta rectangle at (145, 10) with width 77 and height 117.
; PLAN: r0=145(x), r1=10(y), r2=77(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 10
LDI r2, 77
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
