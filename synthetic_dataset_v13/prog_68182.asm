; DESCRIPTION: Composite: Places a red circle of radius 29 at center (75, 83) then Sets a single yellow pixel at (312, 176).
; PLAN: r0=75(x), r1=83(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x), r6=176(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 75
LDI r1, 83
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 176
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
