; DESCRIPTION: Draws a blue rectangle at (22, 153) with width 104 and height 34.
; PLAN: r0=22(x), r1=153(y), r2=104(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 153
LDI r2, 104
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
