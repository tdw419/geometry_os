; DESCRIPTION: Composite: Sets a single green pixel at (444, 241) then Draws a red circle centered at (181, 89) with radius 73.
; PLAN: r0=444(x), r1=241(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=181(x), r6=89(y), r7=73(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 444
LDI r1, 241
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 181
LDI r6, 89
LDI r7, 73
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
