; DESCRIPTION: Composite: Creates a green circular shape at (103, 81) with radius 31 then Sets a single white pixel at (344, 119).
; PLAN: r0=103(x), r1=81(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=344(x), r6=119(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 103
LDI r1, 81
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 344
LDI r6, 119
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
