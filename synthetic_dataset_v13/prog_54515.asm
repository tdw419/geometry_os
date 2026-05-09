; DESCRIPTION: Composite: Creates a purple circular shape at (46, 41) with radius 17 then Sets a single red pixel at (83, 140).
; PLAN: r0=46(x), r1=41(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=83(x), r6=140(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 46
LDI r1, 41
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 83
LDI r6, 140
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
