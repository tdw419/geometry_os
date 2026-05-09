; DESCRIPTION: Composite: Sets a single black pixel at (187, 181) then Renders a black disk with center (457, 82) and radius 43.
; PLAN: r0=187(x), r1=181(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=457(x), r6=82(y), r7=43(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 187
LDI r1, 181
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 457
LDI r6, 82
LDI r7, 43
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
