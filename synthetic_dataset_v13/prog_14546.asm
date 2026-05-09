; DESCRIPTION: Draws a blue rectangle at (2, 69) with width 75 and height 119.
; PLAN: r0=2(x), r1=69(y), r2=75(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 69
LDI r2, 75
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
