; DESCRIPTION: Draws a magenta rectangle at (375, 84) with width 107 and height 88.
; PLAN: r0=375(x), r1=84(y), r2=107(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 84
LDI r2, 107
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
