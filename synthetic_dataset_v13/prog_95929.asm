; DESCRIPTION: Draws a purple rectangle at (423, 23) with width 25 and height 38.
; PLAN: r0=423(x), r1=23(y), r2=25(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 23
LDI r2, 25
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
