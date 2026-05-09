; DESCRIPTION: Draws a magenta rectangle at (341, 68) with width 110 and height 108.
; PLAN: r0=341(x), r1=68(y), r2=110(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 68
LDI r2, 110
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
