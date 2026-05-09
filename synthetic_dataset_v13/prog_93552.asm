; DESCRIPTION: Draws a purple rectangle at (341, 139) with width 118 and height 107.
; PLAN: r0=341(x), r1=139(y), r2=118(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 139
LDI r2, 118
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
