; DESCRIPTION: Draws a purple rectangle at (379, 119) with width 102 and height 76.
; PLAN: r0=379(x), r1=119(y), r2=102(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 119
LDI r2, 102
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
