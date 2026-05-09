; DESCRIPTION: Draws a purple rectangle at (190, 214) with width 75 and height 37.
; PLAN: r0=190(x), r1=214(y), r2=75(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 214
LDI r2, 75
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
