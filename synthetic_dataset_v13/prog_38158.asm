; DESCRIPTION: Draws a purple rectangle at (155, 193) with width 72 and height 16.
; PLAN: r0=155(x), r1=193(y), r2=72(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 193
LDI r2, 72
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
