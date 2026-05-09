; DESCRIPTION: Composite: Draws a blue circle centered at (322, 148) with radius 67 then Sets a single blue pixel at (289, 129).
; PLAN: r0=322(x), r1=148(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=289(x), r6=129(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 322
LDI r1, 148
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 289
LDI r6, 129
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
