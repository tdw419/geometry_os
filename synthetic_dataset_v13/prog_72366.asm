; DESCRIPTION: Composite: Places a yellow dot at position (225, 134) then Creates a yellow circular shape at (217, 89) with radius 75.
; PLAN: r0=225(x), r1=134(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=217(x), r6=89(y), r7=75(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 225
LDI r1, 134
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 217
LDI r6, 89
LDI r7, 75
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
