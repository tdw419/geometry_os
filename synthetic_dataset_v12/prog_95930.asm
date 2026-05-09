; DESCRIPTION: Draws a purple rectangle at (419, 133) with width 83 and height 47.
; PLAN: r0=419(x), r1=133(y), r2=83(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 133
LDI r2, 83
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
