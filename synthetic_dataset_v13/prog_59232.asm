; DESCRIPTION: Composite: Renders a purple disk with center (441, 72) and radius 48 then Sets a single red pixel at (498, 77).
; PLAN: r0=441(x), r1=72(y), r2=48(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=498(x), r6=77(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 441
LDI r1, 72
LDI r2, 48
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 498
LDI r6, 77
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
