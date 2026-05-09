; DESCRIPTION: Draws a purple rectangle at (334, 76) with width 75 and height 115.
; PLAN: r0=334(x), r1=76(y), r2=75(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 76
LDI r2, 75
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
