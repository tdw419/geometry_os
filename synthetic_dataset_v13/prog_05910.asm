; DESCRIPTION: Composite: Renders a white disk with center (138, 72) and radius 22 then Sets a single blue pixel at (190, 171).
; PLAN: r0=138(x), r1=72(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=190(x), r6=171(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 138
LDI r1, 72
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 190
LDI r6, 171
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
