; DESCRIPTION: Composite: Places a blue dot at position (106, 218) then Creates a yellow circular shape at (273, 87) with radius 78.
; PLAN: r0=106(x), r1=218(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=273(x), r6=87(y), r7=78(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 106
LDI r1, 218
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 273
LDI r6, 87
LDI r7, 78
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
