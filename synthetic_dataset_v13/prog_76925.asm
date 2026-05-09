; DESCRIPTION: Draws a purple rectangle at (101, 2) with width 108 and height 101.
; PLAN: r0=101(x), r1=2(y), r2=108(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 2
LDI r2, 108
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
