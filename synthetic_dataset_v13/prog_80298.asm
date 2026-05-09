; DESCRIPTION: Draws a blue rectangle at (149, 157) with width 114 and height 29.
; PLAN: r0=149(x), r1=157(y), r2=114(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 157
LDI r2, 114
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
