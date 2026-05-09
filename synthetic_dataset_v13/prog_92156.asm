; DESCRIPTION: Draws a magenta rectangle at (270, 136) with width 69 and height 119.
; PLAN: r0=270(x), r1=136(y), r2=69(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 136
LDI r2, 69
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
