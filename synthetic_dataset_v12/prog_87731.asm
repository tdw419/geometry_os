; DESCRIPTION: Composite: Draws a black circle centered at (46, 51) with radius 33 then Places a yellow dot at position (351, 31).
; PLAN: r0=46(x), r1=51(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=351(x), r6=31(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 46
LDI r1, 51
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 351
LDI r6, 31
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
