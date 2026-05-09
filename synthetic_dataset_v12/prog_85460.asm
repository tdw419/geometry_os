; DESCRIPTION: Draws a purple rectangle at (325, 47) with width 49 and height 34.
; PLAN: r0=325(x), r1=47(y), r2=49(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 47
LDI r2, 49
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
