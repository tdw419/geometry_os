; DESCRIPTION: Draws a purple rectangle at (287, 66) with width 83 and height 81.
; PLAN: r0=287(x), r1=66(y), r2=83(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 66
LDI r2, 83
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
