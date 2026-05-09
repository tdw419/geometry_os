; DESCRIPTION: Draws a purple rectangle at (315, 185) with width 100 and height 30.
; PLAN: r0=315(x), r1=185(y), r2=100(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 185
LDI r2, 100
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
