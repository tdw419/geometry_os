; DESCRIPTION: Composite: Sets a single orange pixel at (191, 109) then Creates a orange circular shape at (187, 39) with radius 13.
; PLAN: r0=191(x), r1=109(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=187(x), r6=39(y), r7=13(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 191
LDI r1, 109
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 187
LDI r6, 39
LDI r7, 13
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
