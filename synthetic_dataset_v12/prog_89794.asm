; DESCRIPTION: Composite: Sets a single purple pixel at (8, 71) then Renders a white disk with center (375, 114) and radius 33.
; PLAN: r0=8(x), r1=71(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=375(x), r6=114(y), r7=33(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 8
LDI r1, 71
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 375
LDI r6, 114
LDI r7, 33
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
