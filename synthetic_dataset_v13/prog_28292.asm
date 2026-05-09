; DESCRIPTION: Draws a magenta rectangle at (106, 54) with width 55 and height 21.
; PLAN: r0=106(x), r1=54(y), r2=55(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 54
LDI r2, 55
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
