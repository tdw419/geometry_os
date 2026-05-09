; DESCRIPTION: Composite: Renders a blue disk with center (342, 118) and radius 68 then Sets a single orange pixel at (106, 84).
; PLAN: r0=342(x), r1=118(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=106(x), r6=84(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 342
LDI r1, 118
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 106
LDI r6, 84
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
