; DESCRIPTION: Composite: Sets a single white pixel at (261, 55) then Creates a white circular shape at (108, 156) with radius 54.
; PLAN: r0=261(x), r1=55(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=108(x), r6=156(y), r7=54(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 261
LDI r1, 55
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 108
LDI r6, 156
LDI r7, 54
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
