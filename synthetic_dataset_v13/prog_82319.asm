; DESCRIPTION: Composite: Renders a blue disk with center (245, 151) and radius 61 then Sets a single purple pixel at (491, 178).
; PLAN: r0=245(x), r1=151(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=491(x), r6=178(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 245
LDI r1, 151
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 491
LDI r6, 178
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
