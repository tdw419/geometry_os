; DESCRIPTION: Composite: Places a yellow dot at position (9, 101) then Creates a white circular shape at (275, 133) with radius 31.
; PLAN: r0=9(x), r1=101(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=275(x), r6=133(y), r7=31(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 9
LDI r1, 101
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 275
LDI r6, 133
LDI r7, 31
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
