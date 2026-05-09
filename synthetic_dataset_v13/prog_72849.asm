; DESCRIPTION: Composite: Creates a orange circular shape at (344, 102) with radius 64 then Sets a single orange pixel at (184, 92).
; PLAN: r0=344(x), r1=102(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x), r6=92(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 344
LDI r1, 102
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 92
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
