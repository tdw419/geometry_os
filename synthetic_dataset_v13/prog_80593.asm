; DESCRIPTION: Composite: Renders a black disk with center (454, 45) and radius 40 then Sets a single cyan pixel at (192, 137).
; PLAN: r0=454(x), r1=45(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x), r6=137(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 454
LDI r1, 45
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 137
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
