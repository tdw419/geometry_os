; DESCRIPTION: Composite: Places a orange dot at position (77, 97) then Creates a blue circular shape at (419, 72) with radius 44.
; PLAN: r0=77(x), r1=97(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=419(x), r6=72(y), r7=44(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 77
LDI r1, 97
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 419
LDI r6, 72
LDI r7, 44
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
