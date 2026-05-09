; DESCRIPTION: Draws a purple rectangle at (104, 186) with width 106 and height 34.
; PLAN: r0=104(x), r1=186(y), r2=106(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 186
LDI r2, 106
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
