; DESCRIPTION: Draws a purple rectangle at (302, 133) with width 19 and height 85.
; PLAN: r0=302(x), r1=133(y), r2=19(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 133
LDI r2, 19
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
