; DESCRIPTION: Composite: Places a white circle of radius 31 at center (438, 147) then Sets a single black pixel at (351, 142).
; PLAN: r0=438(x), r1=147(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=351(x), r6=142(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 438
LDI r1, 147
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 351
LDI r6, 142
LDI r7, 0x000000
PSET r5, r6, r7
HALT
