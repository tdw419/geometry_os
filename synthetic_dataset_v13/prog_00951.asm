; DESCRIPTION: Composite: Creates a white circular shape at (394, 145) with radius 48 then Sets a single green pixel at (160, 40).
; PLAN: r0=394(x), r1=145(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=160(x), r6=40(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 394
LDI r1, 145
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 160
LDI r6, 40
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
