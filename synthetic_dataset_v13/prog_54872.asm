; DESCRIPTION: Composite: Creates a orange circular shape at (282, 151) with radius 49 then Sets a single green pixel at (504, 203).
; PLAN: r0=282(x), r1=151(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=504(x), r6=203(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 282
LDI r1, 151
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 504
LDI r6, 203
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
