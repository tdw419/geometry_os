; DESCRIPTION: Composite: Sets a single white pixel at (370, 117) then Creates a blue circular shape at (88, 173) with radius 77.
; PLAN: r0=370(x), r1=117(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=88(x), r6=173(y), r7=77(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 370
LDI r1, 117
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 88
LDI r6, 173
LDI r7, 77
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
