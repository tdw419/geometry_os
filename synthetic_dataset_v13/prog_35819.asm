; DESCRIPTION: Composite: Renders a yellow disk with center (366, 93) and radius 75 then Sets a single red pixel at (44, 66).
; PLAN: r0=366(x), r1=93(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x), r6=66(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 366
LDI r1, 93
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 66
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
