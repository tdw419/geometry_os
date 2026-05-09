; DESCRIPTION: Composite: Renders a orange disk with center (249, 120) and radius 75 then Sets a single yellow pixel at (248, 99).
; PLAN: r0=249(x), r1=120(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x), r6=99(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 249
LDI r1, 120
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 99
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
