; DESCRIPTION: Composite: Sets a single orange pixel at (71, 107) then Creates a purple circular shape at (20, 195) with radius 18.
; PLAN: r0=71(x), r1=107(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=20(x), r6=195(y), r7=18(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 71
LDI r1, 107
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 20
LDI r6, 195
LDI r7, 18
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
