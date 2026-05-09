; DESCRIPTION: Draws a purple rectangle at (0, 69) with width 99 and height 83.
; PLAN: r0=0(x), r1=69(y), r2=99(width), r3=83(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 69
LDI r2, 99
LDI r3, 83
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
