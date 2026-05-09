; DESCRIPTION: Composite: Sets a single green pixel at (448, 156) then Renders a green disk with center (201, 99) and radius 54.
; PLAN: r0=448(x), r1=156(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=201(x), r6=99(y), r7=54(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 448
LDI r1, 156
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 201
LDI r6, 99
LDI r7, 54
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
