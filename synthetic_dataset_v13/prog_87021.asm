; DESCRIPTION: Draws a blue rectangle at (142, 11) with width 100 and height 44.
; PLAN: r0=142(x), r1=11(y), r2=100(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 11
LDI r2, 100
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
