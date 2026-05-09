; DESCRIPTION: Composite: Places a purple dot at position (494, 237) then Renders a purple disk with center (157, 160) and radius 80.
; PLAN: r0=494(x), r1=237(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=157(x), r6=160(y), r7=80(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 494
LDI r1, 237
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 157
LDI r6, 160
LDI r7, 80
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
