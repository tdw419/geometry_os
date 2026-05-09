; DESCRIPTION: Composite: Sets a single red pixel at (185, 102) then Creates a green circular shape at (90, 108) with radius 33.
; PLAN: r0=185(x), r1=102(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=90(x), r6=108(y), r7=33(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 185
LDI r1, 102
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 90
LDI r6, 108
LDI r7, 33
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
