; DESCRIPTION: Draws a blue rectangle at (415, 232) with width 73 and height 22.
; PLAN: r0=415(x), r1=232(y), r2=73(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 232
LDI r2, 73
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
