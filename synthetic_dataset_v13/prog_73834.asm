; DESCRIPTION: Draws a purple rectangle at (133, 159) with width 32 and height 51.
; PLAN: r0=133(x), r1=159(y), r2=32(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 159
LDI r2, 32
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
