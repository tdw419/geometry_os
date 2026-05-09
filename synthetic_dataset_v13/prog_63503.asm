; DESCRIPTION: Draws a purple rectangle at (7, 83) with width 93 and height 115.
; PLAN: r0=7(x), r1=83(y), r2=93(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 83
LDI r2, 93
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
