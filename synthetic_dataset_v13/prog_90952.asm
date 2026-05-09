; DESCRIPTION: Composite: Creates a red circular shape at (252, 131) with radius 59 then Sets a single yellow pixel at (60, 11).
; PLAN: r0=252(x), r1=131(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=60(x), r6=11(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 252
LDI r1, 131
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 60
LDI r6, 11
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
