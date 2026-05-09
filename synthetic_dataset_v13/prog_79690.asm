; DESCRIPTION: Composite: Renders a black disk with center (339, 55) and radius 55 then Sets a single cyan pixel at (250, 163).
; PLAN: r0=339(x), r1=55(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x), r6=163(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 339
LDI r1, 55
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 163
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
