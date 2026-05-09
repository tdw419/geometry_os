; DESCRIPTION: Composite: Places a red dot at position (477, 23) then Creates a orange circular shape at (138, 138) with radius 56.
; PLAN: r0=477(x), r1=23(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=138(x), r6=138(y), r7=56(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 477
LDI r1, 23
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 138
LDI r6, 138
LDI r7, 56
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
