; DESCRIPTION: Composite: Creates a green circular shape at (110, 119) with radius 78 then Sets a single red pixel at (437, 46).
; PLAN: r0=110(x), r1=119(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=437(x), r6=46(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 110
LDI r1, 119
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 437
LDI r6, 46
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
