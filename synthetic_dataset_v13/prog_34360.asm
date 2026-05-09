; DESCRIPTION: Composite: Sets a single white pixel at (87, 58) then Creates a yellow circular shape at (167, 66) with radius 63.
; PLAN: r0=87(x), r1=58(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=167(x), r6=66(y), r7=63(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 87
LDI r1, 58
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 167
LDI r6, 66
LDI r7, 63
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
