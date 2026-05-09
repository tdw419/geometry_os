; DESCRIPTION: Composite: Places a black circle of radius 38 at center (402, 50) then Sets a single blue pixel at (511, 185).
; PLAN: r0=402(x), r1=50(y), r2=38(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=511(x), r6=185(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 402
LDI r1, 50
LDI r2, 38
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 511
LDI r6, 185
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
