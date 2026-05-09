; DESCRIPTION: Draws a magenta rectangle at (163, 33) with width 109 and height 84.
; PLAN: r0=163(x), r1=33(y), r2=109(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 33
LDI r2, 109
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
