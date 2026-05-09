; DESCRIPTION: Draws a purple rectangle at (100, 96) with width 53 and height 36.
; PLAN: r0=100(x), r1=96(y), r2=53(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 96
LDI r2, 53
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
