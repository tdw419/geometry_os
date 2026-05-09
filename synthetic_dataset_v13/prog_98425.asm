; DESCRIPTION: Draws a purple rectangle at (328, 79) with width 83 and height 51.
; PLAN: r0=328(x), r1=79(y), r2=83(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 79
LDI r2, 83
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
