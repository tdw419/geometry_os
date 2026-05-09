; DESCRIPTION: Composite: Creates a white circular shape at (328, 136) with radius 78 then Sets a single cyan pixel at (151, 161).
; PLAN: r0=328(x), r1=136(y), r2=78(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x), r6=161(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 328
LDI r1, 136
LDI r2, 78
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 161
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
