; DESCRIPTION: Draws a purple rectangle at (190, 84) with width 74 and height 96.
; PLAN: r0=190(x), r1=84(y), r2=74(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 84
LDI r2, 74
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
