; DESCRIPTION: Composite: Renders a red disk with center (84, 66) and radius 24 then Sets a single blue pixel at (382, 48).
; PLAN: r0=84(x), r1=66(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=382(x), r6=48(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 84
LDI r1, 66
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 382
LDI r6, 48
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
