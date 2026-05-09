; DESCRIPTION: Composite: Creates a orange circular shape at (228, 48) with radius 34 then Sets a single orange pixel at (379, 114).
; PLAN: r0=228(x), r1=48(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x), r6=114(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 228
LDI r1, 48
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 114
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
