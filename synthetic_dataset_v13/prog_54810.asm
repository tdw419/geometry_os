; DESCRIPTION: Draws a purple rectangle at (393, 112) with width 79 and height 62.
; PLAN: r0=393(x), r1=112(y), r2=79(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 112
LDI r2, 79
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
