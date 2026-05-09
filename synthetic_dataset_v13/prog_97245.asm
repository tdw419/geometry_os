; DESCRIPTION: Composite: Renders a green disk with center (275, 229) and radius 18 then Sets a single blue pixel at (480, 189).
; PLAN: r0=275(x), r1=229(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=480(x), r6=189(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 275
LDI r1, 229
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 480
LDI r6, 189
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
