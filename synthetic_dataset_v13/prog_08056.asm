; DESCRIPTION: Draws a purple rectangle at (211, 43) with width 109 and height 64.
; PLAN: r0=211(x), r1=43(y), r2=109(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 43
LDI r2, 109
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
