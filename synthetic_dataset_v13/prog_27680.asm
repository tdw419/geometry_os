; DESCRIPTION: Composite: Renders a blue disk with center (160, 116) and radius 51 then Sets a single blue pixel at (223, 207).
; PLAN: r0=160(x), r1=116(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=223(x), r6=207(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 160
LDI r1, 116
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 223
LDI r6, 207
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
