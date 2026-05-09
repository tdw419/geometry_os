; DESCRIPTION: Draws a purple rectangle at (143, 105) with width 36 and height 65.
; PLAN: r0=143(x), r1=105(y), r2=36(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 105
LDI r2, 36
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
