; DESCRIPTION: Draws a purple rectangle at (25, 19) with width 83 and height 79.
; PLAN: r0=25(x), r1=19(y), r2=83(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 19
LDI r2, 83
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
