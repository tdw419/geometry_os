; DESCRIPTION: Composite: Creates a white circular shape at (95, 149) with radius 76 then Sets a single red pixel at (33, 241).
; PLAN: r0=95(x), r1=149(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=33(x), r6=241(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 95
LDI r1, 149
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 33
LDI r6, 241
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
