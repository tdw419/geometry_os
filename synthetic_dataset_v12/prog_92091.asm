; DESCRIPTION: Draws a purple rectangle at (85, 2) with width 15 and height 38.
; PLAN: r0=85(x), r1=2(y), r2=15(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 2
LDI r2, 15
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
