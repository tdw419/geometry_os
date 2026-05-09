; DESCRIPTION: Draws a purple rectangle at (67, 44) with width 104 and height 89.
; PLAN: r0=67(x), r1=44(y), r2=104(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 44
LDI r2, 104
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
