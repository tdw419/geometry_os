; DESCRIPTION: Composite: Creates a white circular shape at (236, 87) with radius 56 then Sets a single red pixel at (80, 34).
; PLAN: r0=236(x), r1=87(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=80(x), r6=34(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 236
LDI r1, 87
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 80
LDI r6, 34
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
