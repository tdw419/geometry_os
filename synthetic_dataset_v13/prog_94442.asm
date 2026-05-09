; DESCRIPTION: Composite: Draws a purple rectangle at (56, 92) with width 85 and height 74 then Places a yellow dot at position (151, 69).
; PLAN: r0=56(x), r1=92(y), r2=85(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x), r6=69(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 56
LDI r1, 92
LDI r2, 85
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 69
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
