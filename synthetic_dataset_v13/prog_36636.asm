; DESCRIPTION: Composite: Places a red dot at position (423, 124) then Creates a black circular shape at (249, 170) with radius 12.
; PLAN: r0=423(x), r1=124(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=249(x), r6=170(y), r7=12(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 423
LDI r1, 124
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 249
LDI r6, 170
LDI r7, 12
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
