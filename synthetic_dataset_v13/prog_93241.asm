; DESCRIPTION: Draws a purple rectangle at (250, 195) with width 38 and height 43.
; PLAN: r0=250(x), r1=195(y), r2=38(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 195
LDI r2, 38
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
