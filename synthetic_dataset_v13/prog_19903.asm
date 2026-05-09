; DESCRIPTION: Composite: Renders a red disk with center (362, 157) and radius 80 then Sets a single blue pixel at (477, 88).
; PLAN: r0=362(x), r1=157(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=477(x), r6=88(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 362
LDI r1, 157
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 477
LDI r6, 88
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
