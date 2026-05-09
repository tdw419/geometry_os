; DESCRIPTION: Draws a purple rectangle at (321, 9) with width 79 and height 34.
; PLAN: r0=321(x), r1=9(y), r2=79(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 9
LDI r2, 79
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
