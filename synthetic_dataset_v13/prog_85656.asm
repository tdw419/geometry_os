; DESCRIPTION: Composite: Creates a cyan circular shape at (108, 173) with radius 51 then Sets a single blue pixel at (171, 33).
; PLAN: r0=108(x), r1=173(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=171(x), r6=33(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 108
LDI r1, 173
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 171
LDI r6, 33
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
