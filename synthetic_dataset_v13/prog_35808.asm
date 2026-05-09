; DESCRIPTION: Composite: Renders a white disk with center (98, 99) and radius 39 then Sets a single yellow pixel at (115, 52).
; PLAN: r0=98(x), r1=99(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=115(x), r6=52(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 98
LDI r1, 99
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 115
LDI r6, 52
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
