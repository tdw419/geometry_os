; DESCRIPTION: Composite: Places a yellow dot at position (289, 164) then Renders a purple disk with center (341, 175) and radius 73.
; PLAN: r0=289(x), r1=164(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=341(x), r6=175(y), r7=73(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 289
LDI r1, 164
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 341
LDI r6, 175
LDI r7, 73
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
