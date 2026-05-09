; DESCRIPTION: Composite: Renders a yellow disk with center (399, 118) and radius 78 then Sets a single purple pixel at (481, 232).
; PLAN: r0=399(x), r1=118(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=481(x), r6=232(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 399
LDI r1, 118
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 481
LDI r6, 232
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
