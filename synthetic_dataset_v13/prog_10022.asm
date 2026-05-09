; DESCRIPTION: Composite: Sets a single red pixel at (508, 88) then Creates a orange circular shape at (290, 160) with radius 35.
; PLAN: r0=508(x), r1=88(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=290(x), r6=160(y), r7=35(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 508
LDI r1, 88
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 290
LDI r6, 160
LDI r7, 35
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
