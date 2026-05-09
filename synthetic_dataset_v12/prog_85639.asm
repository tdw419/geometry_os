; DESCRIPTION: Draws a magenta rectangle at (163, 40) with width 34 and height 106.
; PLAN: r0=163(x), r1=40(y), r2=34(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 40
LDI r2, 34
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
