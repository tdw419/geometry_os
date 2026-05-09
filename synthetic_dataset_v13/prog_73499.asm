; DESCRIPTION: Composite: Creates a purple circular shape at (136, 86) with radius 76 then Sets a single orange pixel at (469, 249).
; PLAN: r0=136(x), r1=86(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=469(x), r6=249(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 136
LDI r1, 86
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 469
LDI r6, 249
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
