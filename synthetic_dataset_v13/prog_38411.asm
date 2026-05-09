; DESCRIPTION: Draws a magenta rectangle at (375, 119) with width 29 and height 64.
; PLAN: r0=375(x), r1=119(y), r2=29(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 119
LDI r2, 29
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
