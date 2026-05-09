; DESCRIPTION: Composite: Creates a orange circular shape at (102, 183) with radius 68 then Sets a single red pixel at (55, 56).
; PLAN: r0=102(x), r1=183(y), r2=68(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=55(x), r6=56(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 102
LDI r1, 183
LDI r2, 68
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 55
LDI r6, 56
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
