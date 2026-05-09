; DESCRIPTION: Draws a purple rectangle at (367, 51) with width 94 and height 118.
; PLAN: r0=367(x), r1=51(y), r2=94(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 51
LDI r2, 94
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
