; DESCRIPTION: Composite: Places a black dot at position (496, 188) then Renders a magenta disk with center (306, 154) and radius 77.
; PLAN: r0=496(x), r1=188(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=306(x), r6=154(y), r7=77(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 496
LDI r1, 188
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 306
LDI r6, 154
LDI r7, 77
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
