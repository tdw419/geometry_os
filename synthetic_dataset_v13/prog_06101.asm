; DESCRIPTION: Composite: Places a white dot at position (15, 16) then Creates a purple circular shape at (337, 77) with radius 16.
; PLAN: r0=15(x), r1=16(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=337(x), r6=77(y), r7=16(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 15
LDI r1, 16
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 337
LDI r6, 77
LDI r7, 16
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
