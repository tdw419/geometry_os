; DESCRIPTION: Composite: Creates a green circular shape at (478, 171) with radius 33 then Sets a single orange pixel at (231, 131).
; PLAN: r0=478(x), r1=171(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=231(x), r6=131(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 478
LDI r1, 171
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 231
LDI r6, 131
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
