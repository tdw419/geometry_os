; DESCRIPTION: Composite: Creates a yellow circular shape at (217, 163) with radius 76 then Places a red dot at position (22, 218).
; PLAN: r0=217(x), r1=163(y), r2=76(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=22(x), r6=218(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 217
LDI r1, 163
LDI r2, 76
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 22
LDI r6, 218
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
