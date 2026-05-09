; DESCRIPTION: Composite: Renders a black disk with center (153, 173) and radius 62 then Sets a single orange pixel at (92, 40).
; PLAN: r0=153(x), r1=173(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=92(x), r6=40(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 153
LDI r1, 173
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 92
LDI r6, 40
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
