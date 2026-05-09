; DESCRIPTION: Composite: Sets a single orange pixel at (143, 53) then Creates a red circular shape at (149, 72) with radius 53.
; PLAN: r0=143(x), r1=53(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=149(x), r6=72(y), r7=53(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 143
LDI r1, 53
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 149
LDI r6, 72
LDI r7, 53
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
