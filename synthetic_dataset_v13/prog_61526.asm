; DESCRIPTION: Draws a purple rectangle at (159, 191) with width 84 and height 53.
; PLAN: r0=159(x), r1=191(y), r2=84(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 191
LDI r2, 84
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
