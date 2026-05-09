; DESCRIPTION: Draws a purple rectangle at (79, 204) with width 35 and height 14.
; PLAN: r0=79(x), r1=204(y), r2=35(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 204
LDI r2, 35
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
