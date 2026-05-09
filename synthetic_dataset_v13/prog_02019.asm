; DESCRIPTION: Draws a purple rectangle at (10, 94) with width 51 and height 71.
; PLAN: r0=10(x), r1=94(y), r2=51(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 94
LDI r2, 51
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
