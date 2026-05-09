; DESCRIPTION: Composite: Sets a single green pixel at (96, 182) then Renders a green disk with center (458, 153) and radius 11.
; PLAN: r0=96(x), r1=182(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=458(x), r6=153(y), r7=11(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 96
LDI r1, 182
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 458
LDI r6, 153
LDI r7, 11
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
