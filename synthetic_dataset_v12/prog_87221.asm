; DESCRIPTION: Draws a purple rectangle at (358, 84) with width 77 and height 10.
; PLAN: r0=358(x), r1=84(y), r2=77(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 84
LDI r2, 77
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
