; DESCRIPTION: Draws a purple rectangle at (142, 208) with width 101 and height 34.
; PLAN: r0=142(x), r1=208(y), r2=101(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 208
LDI r2, 101
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
