; DESCRIPTION: Composite: Places a magenta dot at position (407, 169) then Renders a purple disk with center (189, 102) and radius 19.
; PLAN: r0=407(x), r1=169(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=189(x), r6=102(y), r7=19(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 407
LDI r1, 169
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 189
LDI r6, 102
LDI r7, 19
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
