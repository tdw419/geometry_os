; DESCRIPTION: Draws a magenta rectangle at (188, 127) with width 30 and height 77.
; PLAN: r0=188(x), r1=127(y), r2=30(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 127
LDI r2, 30
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
