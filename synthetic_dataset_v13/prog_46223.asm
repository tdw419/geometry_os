; DESCRIPTION: Draws a purple rectangle at (389, 34) with width 22 and height 60.
; PLAN: r0=389(x), r1=34(y), r2=22(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 34
LDI r2, 22
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
