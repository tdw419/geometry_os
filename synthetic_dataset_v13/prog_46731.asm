; DESCRIPTION: Draws a blue rectangle at (114, 119) with width 48 and height 100.
; PLAN: r0=114(x), r1=119(y), r2=48(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 119
LDI r2, 48
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
