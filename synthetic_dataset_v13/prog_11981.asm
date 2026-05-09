; DESCRIPTION: Composite: Places a yellow dot at position (309, 244) then Creates a green circular shape at (438, 89) with radius 45.
; PLAN: r0=309(x), r1=244(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=438(x), r6=89(y), r7=45(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 309
LDI r1, 244
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 438
LDI r6, 89
LDI r7, 45
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
