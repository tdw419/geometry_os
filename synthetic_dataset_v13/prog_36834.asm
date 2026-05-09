; DESCRIPTION: Composite: Places a blue dot at position (162, 70) then Creates a orange circular shape at (312, 201) with radius 11.
; PLAN: r0=162(x), r1=70(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=312(x), r6=201(y), r7=11(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 162
LDI r1, 70
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 312
LDI r6, 201
LDI r7, 11
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
