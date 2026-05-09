; DESCRIPTION: Composite: Places a blue dot at position (480, 105) then Creates a purple circular shape at (83, 110) with radius 29.
; PLAN: r0=480(x), r1=105(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=83(x), r6=110(y), r7=29(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 480
LDI r1, 105
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 83
LDI r6, 110
LDI r7, 29
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
