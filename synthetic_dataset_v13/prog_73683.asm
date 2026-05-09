; DESCRIPTION: Composite: Sets a single yellow pixel at (91, 26) then Creates a red circular shape at (94, 87) with radius 76.
; PLAN: r0=91(x), r1=26(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=94(x), r6=87(y), r7=76(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 91
LDI r1, 26
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 94
LDI r6, 87
LDI r7, 76
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
