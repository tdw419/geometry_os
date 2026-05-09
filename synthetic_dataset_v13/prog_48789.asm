; DESCRIPTION: Composite: Places a white dot at position (293, 2) then Creates a green circular shape at (359, 158) with radius 23.
; PLAN: r0=293(x), r1=2(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=158(y), r7=23(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 293
LDI r1, 2
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 359
LDI r6, 158
LDI r7, 23
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
