; DESCRIPTION: Draws a purple rectangle at (141, 100) with width 53 and height 80.
; PLAN: r0=141(x), r1=100(y), r2=53(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 100
LDI r2, 53
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
