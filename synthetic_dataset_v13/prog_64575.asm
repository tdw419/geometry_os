; DESCRIPTION: Draws a blue rectangle at (138, 136) with width 38 and height 99.
; PLAN: r0=138(x), r1=136(y), r2=38(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 136
LDI r2, 38
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
