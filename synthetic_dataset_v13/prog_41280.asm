; DESCRIPTION: Composite: Creates a black circular shape at (301, 106) with radius 58 then Sets a single orange pixel at (418, 222).
; PLAN: r0=301(x), r1=106(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=418(x), r6=222(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 301
LDI r1, 106
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 418
LDI r6, 222
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
