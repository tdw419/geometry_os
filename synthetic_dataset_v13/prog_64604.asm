; DESCRIPTION: Composite: Sets a single white pixel at (375, 50) then Creates a yellow circular shape at (187, 225) with radius 18.
; PLAN: r0=375(x), r1=50(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=187(x), r6=225(y), r7=18(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 375
LDI r1, 50
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 187
LDI r6, 225
LDI r7, 18
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
