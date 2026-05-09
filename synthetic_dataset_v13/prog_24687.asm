; DESCRIPTION: Draws a purple rectangle at (407, 176) with width 35 and height 79.
; PLAN: r0=407(x), r1=176(y), r2=35(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 176
LDI r2, 35
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
