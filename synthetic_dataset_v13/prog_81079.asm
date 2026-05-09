; DESCRIPTION: Composite: Creates a green circular shape at (417, 138) with radius 62 then Places a yellow dot at position (310, 156).
; PLAN: r0=417(x), r1=138(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=310(x), r6=156(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 417
LDI r1, 138
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 310
LDI r6, 156
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
