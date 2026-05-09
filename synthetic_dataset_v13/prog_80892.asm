; DESCRIPTION: Composite: Creates a red circular shape at (149, 163) with radius 25 then Sets a single white pixel at (317, 238).
; PLAN: r0=149(x), r1=163(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=317(x), r6=238(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 149
LDI r1, 163
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 317
LDI r6, 238
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
