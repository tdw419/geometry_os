; DESCRIPTION: Composite: Sets a single purple pixel at (32, 77) then Renders a white disk with center (119, 190) and radius 41.
; PLAN: r0=32(x), r1=77(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=119(x), r6=190(y), r7=41(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 32
LDI r1, 77
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 119
LDI r6, 190
LDI r7, 41
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
