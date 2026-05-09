; DESCRIPTION: Draws a purple rectangle at (361, 64) with width 84 and height 78.
; PLAN: r0=361(x), r1=64(y), r2=84(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 64
LDI r2, 84
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
