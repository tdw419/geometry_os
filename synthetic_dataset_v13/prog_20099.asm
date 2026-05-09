; DESCRIPTION: Draws a purple rectangle at (248, 100) with width 106 and height 63.
; PLAN: r0=248(x), r1=100(y), r2=106(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 100
LDI r2, 106
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
