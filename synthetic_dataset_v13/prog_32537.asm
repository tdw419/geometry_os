; DESCRIPTION: Composite: Renders a green disk with center (182, 181) and radius 37 then Sets a single orange pixel at (418, 238).
; PLAN: r0=182(x), r1=181(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=418(x), r6=238(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 182
LDI r1, 181
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 418
LDI r6, 238
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
