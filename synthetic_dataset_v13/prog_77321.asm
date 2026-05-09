; DESCRIPTION: Composite: Creates a blue circular shape at (148, 80) with radius 43 then Sets a single orange pixel at (289, 19).
; PLAN: r0=148(x), r1=80(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=289(x), r6=19(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 148
LDI r1, 80
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 289
LDI r6, 19
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
