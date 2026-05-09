; DESCRIPTION: Composite: Places a black circle of radius 31 at center (223, 171) then Sets a single green pixel at (402, 112).
; PLAN: r0=223(x), r1=171(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=402(x), r6=112(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 223
LDI r1, 171
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 402
LDI r6, 112
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
