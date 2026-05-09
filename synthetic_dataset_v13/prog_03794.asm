; DESCRIPTION: Composite: Creates a purple circular shape at (256, 128) with radius 77 then Sets a single blue pixel at (273, 211).
; PLAN: r0=256(x), r1=128(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=273(x), r6=211(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 256
LDI r1, 128
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 273
LDI r6, 211
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
