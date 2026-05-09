; DESCRIPTION: Composite: Sets a single green pixel at (53, 169) then Places a green circle of radius 77 at center (190, 89).
; PLAN: r0=53(x), r1=169(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=190(x), r6=89(y), r7=77(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 53
LDI r1, 169
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 190
LDI r6, 89
LDI r7, 77
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
