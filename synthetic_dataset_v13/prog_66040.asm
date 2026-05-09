; DESCRIPTION: Draws a green rectangle at (136, 29) with width 96 and height 73.
; PLAN: r0=136(x), r1=29(y), r2=96(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 29
LDI r2, 96
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
