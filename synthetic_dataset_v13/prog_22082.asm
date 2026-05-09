; DESCRIPTION: Composite: Creates a green circular shape at (329, 68) with radius 58 then Sets a single green pixel at (73, 121).
; PLAN: r0=329(x), r1=68(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=73(x), r6=121(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 329
LDI r1, 68
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 73
LDI r6, 121
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
