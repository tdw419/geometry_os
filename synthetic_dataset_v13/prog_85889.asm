; DESCRIPTION: Draws a magenta rectangle at (385, 12) with width 115 and height 106.
; PLAN: r0=385(x), r1=12(y), r2=115(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 12
LDI r2, 115
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
