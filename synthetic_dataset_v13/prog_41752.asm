; DESCRIPTION: Composite: Sets a single white pixel at (239, 161) then Creates a white circular shape at (221, 34) with radius 30.
; PLAN: r0=239(x), r1=161(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=221(x), r6=34(y), r7=30(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 239
LDI r1, 161
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 221
LDI r6, 34
LDI r7, 30
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
