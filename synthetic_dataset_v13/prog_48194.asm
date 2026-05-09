; DESCRIPTION: Composite: Creates a purple circular shape at (321, 180) with radius 58 then Sets a single green pixel at (245, 87).
; PLAN: r0=321(x), r1=180(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=245(x), r6=87(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 321
LDI r1, 180
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 245
LDI r6, 87
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
