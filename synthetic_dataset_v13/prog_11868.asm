; DESCRIPTION: Composite: Renders a yellow disk with center (458, 30) and radius 15 then Sets a single magenta pixel at (24, 22).
; PLAN: r0=458(x), r1=30(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=24(x), r6=22(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 458
LDI r1, 30
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 24
LDI r6, 22
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
