; DESCRIPTION: Composite: Draws a purple circle centered at (71, 55) with radius 47 then Sets a single blue pixel at (124, 96).
; PLAN: r0=71(x), r1=55(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x), r6=96(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 71
LDI r1, 55
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 96
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
