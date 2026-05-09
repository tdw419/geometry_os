; DESCRIPTION: Composite: Draws a white circle centered at (328, 115) with radius 61 then Sets a single green pixel at (253, 195).
; PLAN: r0=328(x), r1=115(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=253(x), r6=195(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 328
LDI r1, 115
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 253
LDI r6, 195
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
