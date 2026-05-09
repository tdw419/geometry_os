; DESCRIPTION: Composite: Creates a orange circular shape at (133, 181) with radius 64 then Sets a single white pixel at (20, 105).
; PLAN: r0=133(x), r1=181(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=105(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 133
LDI r1, 181
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 105
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
