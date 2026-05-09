; DESCRIPTION: Draws a purple rectangle at (119, 143) with width 100 and height 20.
; PLAN: r0=119(x), r1=143(y), r2=100(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 143
LDI r2, 100
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
