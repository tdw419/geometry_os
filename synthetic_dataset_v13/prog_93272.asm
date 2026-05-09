; DESCRIPTION: Draws a purple rectangle at (330, 22) with width 20 and height 104.
; PLAN: r0=330(x), r1=22(y), r2=20(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 22
LDI r2, 20
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
