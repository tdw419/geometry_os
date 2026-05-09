; DESCRIPTION: Draws a purple rectangle at (313, 118) with width 94 and height 95.
; PLAN: r0=313(x), r1=118(y), r2=94(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 118
LDI r2, 94
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
