; DESCRIPTION: Draws a purple rectangle at (437, 49) with width 37 and height 115.
; PLAN: r0=437(x), r1=49(y), r2=37(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 49
LDI r2, 37
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
