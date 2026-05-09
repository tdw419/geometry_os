; DESCRIPTION: Composite: Sets a single green pixel at (312, 233) then Places a black circle of radius 72 at center (212, 143).
; PLAN: r0=312(x), r1=233(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=212(x), r6=143(y), r7=72(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 312
LDI r1, 233
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 212
LDI r6, 143
LDI r7, 72
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
