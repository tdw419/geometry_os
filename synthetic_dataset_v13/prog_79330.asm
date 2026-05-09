; DESCRIPTION: Composite: Draws a cyan circle centered at (340, 214) with radius 37 then Sets a single blue pixel at (171, 22).
; PLAN: r0=340(x), r1=214(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=171(x), r6=22(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 340
LDI r1, 214
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 171
LDI r6, 22
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
