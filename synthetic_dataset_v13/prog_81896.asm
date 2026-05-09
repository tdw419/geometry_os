; DESCRIPTION: Composite: Sets a single yellow pixel at (251, 231) then Draws a black circle centered at (36, 104) with radius 34.
; PLAN: r0=251(x), r1=231(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=36(x), r6=104(y), r7=34(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 251
LDI r1, 231
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 36
LDI r6, 104
LDI r7, 34
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
