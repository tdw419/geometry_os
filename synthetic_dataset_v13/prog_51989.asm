; DESCRIPTION: Composite: Renders a yellow disk with center (91, 180) and radius 27 then Sets a single blue pixel at (438, 180).
; PLAN: r0=91(x), r1=180(y), r2=27(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=438(x), r6=180(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 91
LDI r1, 180
LDI r2, 27
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 438
LDI r6, 180
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
