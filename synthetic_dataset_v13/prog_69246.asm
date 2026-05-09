; DESCRIPTION: Composite: Sets a single purple pixel at (244, 84) then Renders a white disk with center (130, 182) and radius 41.
; PLAN: r0=244(x), r1=84(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=130(x), r6=182(y), r7=41(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 244
LDI r1, 84
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 130
LDI r6, 182
LDI r7, 41
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
