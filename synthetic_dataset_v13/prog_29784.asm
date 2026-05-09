; DESCRIPTION: Draws a purple rectangle at (325, 70) with width 68 and height 58.
; PLAN: r0=325(x), r1=70(y), r2=68(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 70
LDI r2, 68
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
