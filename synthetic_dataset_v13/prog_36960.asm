; DESCRIPTION: Composite: Sets a single green pixel at (407, 101) then Creates a magenta circular shape at (434, 75) with radius 40.
; PLAN: r0=407(x), r1=101(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=434(x), r6=75(y), r7=40(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 407
LDI r1, 101
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 434
LDI r6, 75
LDI r7, 40
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
