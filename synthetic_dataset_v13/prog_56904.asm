; DESCRIPTION: Draws a magenta rectangle at (62, 166) with width 98 and height 33.
; PLAN: r0=62(x), r1=166(y), r2=98(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 166
LDI r2, 98
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
