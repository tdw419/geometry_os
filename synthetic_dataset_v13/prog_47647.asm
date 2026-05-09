; DESCRIPTION: Composite: Places a blue dot at position (347, 134) then Renders a cyan disk with center (289, 90) and radius 71.
; PLAN: r0=347(x), r1=134(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=289(x), r6=90(y), r7=71(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 347
LDI r1, 134
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 289
LDI r6, 90
LDI r7, 71
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
