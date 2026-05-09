; DESCRIPTION: Composite: Renders a magenta disk with center (341, 156) and radius 77 then Places a magenta dot at position (79, 159).
; PLAN: r0=341(x), r1=156(y), r2=77(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=79(x), r6=159(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 341
LDI r1, 156
LDI r2, 77
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 79
LDI r6, 159
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
