; DESCRIPTION: Composite: Sets a single red pixel at (129, 145) then Places a white circle of radius 73 at center (414, 89).
; PLAN: r0=129(x), r1=145(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=414(x), r6=89(y), r7=73(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 129
LDI r1, 145
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 414
LDI r6, 89
LDI r7, 73
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
