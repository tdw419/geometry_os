; DESCRIPTION: Draws a purple rectangle at (149, 100) with width 90 and height 12.
; PLAN: r0=149(x), r1=100(y), r2=90(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 100
LDI r2, 90
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
