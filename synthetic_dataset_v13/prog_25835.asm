; DESCRIPTION: Draws a magenta rectangle at (127, 40) with width 55 and height 84.
; PLAN: r0=127(x), r1=40(y), r2=55(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 40
LDI r2, 55
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
