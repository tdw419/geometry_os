; DESCRIPTION: Composite: Creates a red circular shape at (335, 138) with radius 39 then Sets a single yellow pixel at (249, 182).
; PLAN: r0=335(x), r1=138(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x), r6=182(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 335
LDI r1, 138
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 182
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
