; DESCRIPTION: Composite: Creates a green circular shape at (120, 136) with radius 21 then Sets a single orange pixel at (46, 171).
; PLAN: r0=120(x), r1=136(y), r2=21(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=46(x), r6=171(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 120
LDI r1, 136
LDI r2, 21
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 46
LDI r6, 171
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
