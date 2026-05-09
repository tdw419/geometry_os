; DESCRIPTION: Composite: Renders a white disk with center (189, 182) and radius 62 then Sets a single blue pixel at (156, 56).
; PLAN: r0=189(x), r1=182(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=156(x), r6=56(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 189
LDI r1, 182
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 156
LDI r6, 56
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
