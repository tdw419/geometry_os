; DESCRIPTION: Draws a magenta rectangle at (127, 75) with width 33 and height 59.
; PLAN: r0=127(x), r1=75(y), r2=33(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 75
LDI r2, 33
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
