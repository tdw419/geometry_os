; DESCRIPTION: Composite: Creates a purple circular shape at (278, 99) with radius 23 then Sets a single orange pixel at (237, 239).
; PLAN: r0=278(x), r1=99(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x), r6=239(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 278
LDI r1, 99
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 239
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
