; DESCRIPTION: Composite: Renders a purple disk with center (441, 107) and radius 36 then Sets a single yellow pixel at (17, 152).
; PLAN: r0=441(x), r1=107(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=17(x), r6=152(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 441
LDI r1, 107
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 17
LDI r6, 152
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
