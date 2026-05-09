; DESCRIPTION: Composite: Creates a red circular shape at (439, 47) with radius 10 then Places a red dot at position (76, 156).
; PLAN: r0=439(x), r1=47(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=76(x), r6=156(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 439
LDI r1, 47
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 76
LDI r6, 156
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
