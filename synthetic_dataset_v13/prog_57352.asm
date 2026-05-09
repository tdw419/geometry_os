; DESCRIPTION: Draws a blue rectangle at (356, 184) with width 105 and height 47.
; PLAN: r0=356(x), r1=184(y), r2=105(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 184
LDI r2, 105
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
