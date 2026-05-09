; DESCRIPTION: Draws a magenta rectangle at (40, 157) with width 84 and height 29.
; PLAN: r0=40(x), r1=157(y), r2=84(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 157
LDI r2, 84
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
