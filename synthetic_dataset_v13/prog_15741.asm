; DESCRIPTION: Draws a blue rectangle at (356, 4) with width 43 and height 73.
; PLAN: r0=356(x), r1=4(y), r2=43(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 4
LDI r2, 43
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
