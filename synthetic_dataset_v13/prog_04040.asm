; DESCRIPTION: Composite: Creates a yellow circular shape at (66, 100) with radius 50 then Sets a single orange pixel at (4, 114).
; PLAN: r0=66(x), r1=100(y), r2=50(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=4(x), r6=114(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 66
LDI r1, 100
LDI r2, 50
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 4
LDI r6, 114
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
