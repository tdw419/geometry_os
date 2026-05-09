; DESCRIPTION: Composite: Sets a single purple pixel at (44, 41) then Creates a red circular shape at (355, 124) with radius 66.
; PLAN: r0=44(x), r1=41(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=355(x), r6=124(y), r7=66(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 44
LDI r1, 41
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 355
LDI r6, 124
LDI r7, 66
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
