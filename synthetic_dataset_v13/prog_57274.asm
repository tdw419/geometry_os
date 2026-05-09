; DESCRIPTION: Composite: Sets a single red pixel at (497, 21) then Creates a magenta circular shape at (60, 210) with radius 31.
; PLAN: r0=497(x), r1=21(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=60(x), r6=210(y), r7=31(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 497
LDI r1, 21
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 60
LDI r6, 210
LDI r7, 31
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
