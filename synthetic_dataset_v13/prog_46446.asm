; DESCRIPTION: Composite: Creates a white circular shape at (282, 189) with radius 26 then Sets a single green pixel at (400, 117).
; PLAN: r0=282(x), r1=189(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x), r6=117(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 282
LDI r1, 189
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 117
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
