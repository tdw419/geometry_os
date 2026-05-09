; DESCRIPTION: Composite: Draws a blue circle centered at (153, 185) with radius 45 then Sets a single magenta pixel at (11, 183).
; PLAN: r0=153(x), r1=185(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x), r6=183(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 153
LDI r1, 185
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 183
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
