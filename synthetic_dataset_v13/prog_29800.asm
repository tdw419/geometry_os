; DESCRIPTION: Composite: Draws a purple rectangle at (162, 15) with width 56 and height 33 then Sets a single magenta pixel at (302, 78).
; PLAN: r0=162(x), r1=15(y), r2=56(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=302(x), r6=78(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 162
LDI r1, 15
LDI r2, 56
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 78
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
