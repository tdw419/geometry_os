; DESCRIPTION: Draws a black rectangle at (3, 104) with width 118 and height 94.
; PLAN: r0=3(x), r1=104(y), r2=118(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 104
LDI r2, 118
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
