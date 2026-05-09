; DESCRIPTION: Composite: Creates a orange circular shape at (412, 171) with radius 63 then Sets a single red pixel at (476, 102).
; PLAN: r0=412(x), r1=171(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=476(x), r6=102(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 412
LDI r1, 171
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 476
LDI r6, 102
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
