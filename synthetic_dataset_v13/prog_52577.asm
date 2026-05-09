; DESCRIPTION: Composite: Sets a single red pixel at (3, 42) then Creates a red circular shape at (206, 106) with radius 75.
; PLAN: r0=3(x), r1=42(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=206(x), r6=106(y), r7=75(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 3
LDI r1, 42
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 206
LDI r6, 106
LDI r7, 75
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
