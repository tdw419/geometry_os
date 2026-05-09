; DESCRIPTION: Draws a purple rectangle at (190, 100) with width 45 and height 112.
; PLAN: r0=190(x), r1=100(y), r2=45(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 100
LDI r2, 45
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
