; DESCRIPTION: Draws a purple rectangle at (418, 169) with width 76 and height 86.
; PLAN: r0=418(x), r1=169(y), r2=76(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 169
LDI r2, 76
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
