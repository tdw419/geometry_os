; DESCRIPTION: Composite: Creates a black circular shape at (394, 76) with radius 21 then Sets a single green pixel at (8, 195).
; PLAN: r0=394(x), r1=76(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=8(x), r6=195(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 394
LDI r1, 76
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 8
LDI r6, 195
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
