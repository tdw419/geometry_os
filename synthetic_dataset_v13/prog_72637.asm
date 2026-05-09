; DESCRIPTION: Draws a purple rectangle at (54, 104) with width 19 and height 72.
; PLAN: r0=54(x), r1=104(y), r2=19(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 104
LDI r2, 19
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
