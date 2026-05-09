; DESCRIPTION: Composite: Creates a green circular shape at (470, 202) with radius 19 then Sets a single orange pixel at (483, 159).
; PLAN: r0=470(x), r1=202(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=483(x), r6=159(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 470
LDI r1, 202
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 483
LDI r6, 159
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
