; DESCRIPTION: Composite: Sets a single red pixel at (195, 150) then Creates a red circular shape at (176, 176) with radius 30.
; PLAN: r0=195(x), r1=150(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=176(x), r6=176(y), r7=30(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 195
LDI r1, 150
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 176
LDI r6, 176
LDI r7, 30
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
