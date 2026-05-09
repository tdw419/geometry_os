; DESCRIPTION: Draws a blue rectangle at (466, 60) with width 22 and height 84.
; PLAN: r0=466(x), r1=60(y), r2=22(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 60
LDI r2, 22
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
