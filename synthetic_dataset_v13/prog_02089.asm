; DESCRIPTION: Composite: Sets a single red pixel at (204, 167) then Renders a red disk with center (379, 93) and radius 66.
; PLAN: r0=204(x), r1=167(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=379(x), r6=93(y), r7=66(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 204
LDI r1, 167
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 379
LDI r6, 93
LDI r7, 66
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
