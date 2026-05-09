; DESCRIPTION: Composite: Renders a purple disk with center (371, 109) and radius 62 then Sets a single red pixel at (425, 211).
; PLAN: r0=371(x), r1=109(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=425(x), r6=211(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 371
LDI r1, 109
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 425
LDI r6, 211
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
