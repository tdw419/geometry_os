; DESCRIPTION: Draws a purple rectangle at (190, 145) with width 56 and height 111.
; PLAN: r0=190(x), r1=145(y), r2=56(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 145
LDI r2, 56
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
