; DESCRIPTION: Composite: Places a purple dot at position (483, 95) then Creates a magenta circular shape at (81, 80) with radius 76.
; PLAN: r0=483(x), r1=95(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=81(x), r6=80(y), r7=76(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 483
LDI r1, 95
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 81
LDI r6, 80
LDI r7, 76
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
