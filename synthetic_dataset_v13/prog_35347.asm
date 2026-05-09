; DESCRIPTION: Composite: Draws a purple rectangle at (377, 101) with width 25 and height 114 then Sets a single purple pixel at (314, 10).
; PLAN: r0=377(x), r1=101(y), r2=25(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=314(x), r6=10(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 377
LDI r1, 101
LDI r2, 25
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 10
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
