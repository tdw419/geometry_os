; DESCRIPTION: Draws a purple rectangle at (140, 32) with width 112 and height 17.
; PLAN: r0=140(x), r1=32(y), r2=112(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 32
LDI r2, 112
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
