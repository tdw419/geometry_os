; DESCRIPTION: Draws a purple rectangle at (204, 133) with width 55 and height 76.
; PLAN: r0=204(x), r1=133(y), r2=55(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 133
LDI r2, 55
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
