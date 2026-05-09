; DESCRIPTION: Composite: Renders a blue disk with center (107, 107) and radius 44 then Sets a single magenta pixel at (56, 10).
; PLAN: r0=107(x), r1=107(y), r2=44(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=56(x), r6=10(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 107
LDI r1, 107
LDI r2, 44
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 56
LDI r6, 10
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
