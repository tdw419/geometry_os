; DESCRIPTION: Draws a purple rectangle at (101, 21) with width 76 and height 34.
; PLAN: r0=101(x), r1=21(y), r2=76(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 21
LDI r2, 76
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
