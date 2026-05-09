; DESCRIPTION: Composite: Draws a yellow circle centered at (253, 89) with radius 79 then Places a green dot at position (159, 139).
; PLAN: r0=253(x), r1=89(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=159(x), r6=139(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 253
LDI r1, 89
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 159
LDI r6, 139
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
