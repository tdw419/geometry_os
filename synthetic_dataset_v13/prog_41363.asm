; DESCRIPTION: Draws a white rectangle at (490, 128) with width 22 and height 119.
; PLAN: r0=490(x), r1=128(y), r2=22(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 128
LDI r2, 22
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
