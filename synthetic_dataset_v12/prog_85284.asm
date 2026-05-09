; DESCRIPTION: Draws a blue rectangle at (454, 104) with width 22 and height 11.
; PLAN: r0=454(x), r1=104(y), r2=22(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 104
LDI r2, 22
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
