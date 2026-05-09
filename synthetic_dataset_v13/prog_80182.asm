; DESCRIPTION: Draws a purple rectangle at (273, 46) with width 66 and height 115.
; PLAN: r0=273(x), r1=46(y), r2=66(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 46
LDI r2, 66
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
