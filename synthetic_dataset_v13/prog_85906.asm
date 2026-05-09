; DESCRIPTION: Composite: Places a black circle of radius 49 at center (399, 65) then Places a yellow dot at position (281, 156).
; PLAN: r0=399(x), r1=65(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=281(x), r6=156(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 399
LDI r1, 65
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 281
LDI r6, 156
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
