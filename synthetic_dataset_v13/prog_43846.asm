; DESCRIPTION: Draws a purple rectangle at (340, 143) with width 119 and height 36.
; PLAN: r0=340(x), r1=143(y), r2=119(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 143
LDI r2, 119
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
