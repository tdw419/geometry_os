; DESCRIPTION: Composite: Sets a single white pixel at (451, 163) then Creates a yellow circular shape at (131, 136) with radius 63.
; PLAN: r0=451(x), r1=163(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=131(x), r6=136(y), r7=63(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 451
LDI r1, 163
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 131
LDI r6, 136
LDI r7, 63
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
