; DESCRIPTION: Composite: Draws a black circle centered at (227, 89) with radius 63 then Places a black dot at position (99, 91).
; PLAN: r0=227(x), r1=89(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=99(x), r6=91(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 227
LDI r1, 89
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 99
LDI r6, 91
LDI r7, 0x000000
PSET r5, r6, r7
HALT
