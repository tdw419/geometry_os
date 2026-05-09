; DESCRIPTION: Draws a magenta rectangle at (163, 126) with width 70 and height 88.
; PLAN: r0=163(x), r1=126(y), r2=70(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 126
LDI r2, 70
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
