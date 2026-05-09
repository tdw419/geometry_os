; DESCRIPTION: Composite: Renders a yellow disk with center (195, 156) and radius 79 then Places a yellow dot at position (15, 177).
; PLAN: r0=195(x), r1=156(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=177(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 195
LDI r1, 156
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 177
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
