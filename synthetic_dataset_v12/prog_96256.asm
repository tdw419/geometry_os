; DESCRIPTION: Draws a purple rectangle at (362, 162) with width 104 and height 31.
; PLAN: r0=362(x), r1=162(y), r2=104(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 162
LDI r2, 104
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
