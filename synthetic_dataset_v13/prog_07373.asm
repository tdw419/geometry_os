; DESCRIPTION: Draws a purple rectangle at (34, 132) with width 72 and height 119.
; PLAN: r0=34(x), r1=132(y), r2=72(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 132
LDI r2, 72
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
