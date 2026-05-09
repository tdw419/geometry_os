; DESCRIPTION: Composite: Sets a single orange pixel at (174, 62) then Creates a magenta circular shape at (183, 30) with radius 30.
; PLAN: r0=174(x), r1=62(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=30(y), r7=30(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 174
LDI r1, 62
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 183
LDI r6, 30
LDI r7, 30
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
