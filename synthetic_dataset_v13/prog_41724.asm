; DESCRIPTION: Composite: Places a white dot at position (183, 53) then Renders a yellow disk with center (249, 91) and radius 73.
; PLAN: r0=183(x), r1=53(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=249(x), r6=91(y), r7=73(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 183
LDI r1, 53
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 249
LDI r6, 91
LDI r7, 73
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
