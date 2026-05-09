; DESCRIPTION: Draws a purple rectangle at (19, 182) with width 37 and height 51.
; PLAN: r0=19(x), r1=182(y), r2=37(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 182
LDI r2, 37
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
