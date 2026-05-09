; DESCRIPTION: Composite: Creates a red circular shape at (387, 205) with radius 16 then Sets a single yellow pixel at (414, 7).
; PLAN: r0=387(x), r1=205(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=414(x), r6=7(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 387
LDI r1, 205
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 414
LDI r6, 7
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
