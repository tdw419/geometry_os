; DESCRIPTION: Draws a blue rectangle at (119, 79) with width 105 and height 48.
; PLAN: r0=119(x), r1=79(y), r2=105(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 79
LDI r2, 105
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
