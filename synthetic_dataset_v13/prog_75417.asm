; DESCRIPTION: Draws a purple rectangle at (349, 133) with width 77 and height 89.
; PLAN: r0=349(x), r1=133(y), r2=77(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 133
LDI r2, 77
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
