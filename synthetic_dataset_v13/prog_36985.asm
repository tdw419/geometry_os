; DESCRIPTION: Draws a magenta rectangle at (148, 192) with width 78 and height 24.
; PLAN: r0=148(x), r1=192(y), r2=78(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 192
LDI r2, 78
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
