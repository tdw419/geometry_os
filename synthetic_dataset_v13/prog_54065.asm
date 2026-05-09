; DESCRIPTION: Composite: Creates a black circular shape at (108, 179) with radius 65 then Sets a single green pixel at (418, 132).
; PLAN: r0=108(x), r1=179(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=418(x), r6=132(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 108
LDI r1, 179
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 418
LDI r6, 132
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
