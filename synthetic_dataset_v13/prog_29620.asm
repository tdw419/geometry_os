; DESCRIPTION: Composite: Sets a single red pixel at (114, 238) then Renders a red disk with center (195, 24) and radius 18.
; PLAN: r0=114(x), r1=238(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=195(x), r6=24(y), r7=18(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 114
LDI r1, 238
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 195
LDI r6, 24
LDI r7, 18
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
