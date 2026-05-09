; DESCRIPTION: Composite: Sets a single green pixel at (189, 123) then Renders a purple disk with center (338, 98) and radius 71.
; PLAN: r0=189(x), r1=123(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=338(x), r6=98(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 189
LDI r1, 123
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 338
LDI r6, 98
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
