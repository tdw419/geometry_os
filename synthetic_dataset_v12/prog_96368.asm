; DESCRIPTION: Draws a purple rectangle at (93, 31) with width 79 and height 102.
; PLAN: r0=93(x), r1=31(y), r2=79(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 31
LDI r2, 79
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
