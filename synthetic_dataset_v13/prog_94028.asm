; DESCRIPTION: Composite: Sets a single yellow pixel at (415, 127) then Creates a white circular shape at (427, 97) with radius 58.
; PLAN: r0=415(x), r1=127(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=427(x), r6=97(y), r7=58(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 415
LDI r1, 127
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 427
LDI r6, 97
LDI r7, 58
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
