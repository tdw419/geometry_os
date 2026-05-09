; DESCRIPTION: Composite: Renders a black disk with center (140, 128) and radius 56 then Sets a single blue pixel at (175, 20).
; PLAN: r0=140(x), r1=128(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=175(x), r6=20(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 140
LDI r1, 128
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 175
LDI r6, 20
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
