; DESCRIPTION: Draws a purple rectangle at (197, 118) with width 49 and height 75.
; PLAN: r0=197(x), r1=118(y), r2=49(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 118
LDI r2, 49
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
