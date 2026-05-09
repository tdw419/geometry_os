; DESCRIPTION: Composite: Creates a green circular shape at (38, 63) with radius 31 then Sets a single white pixel at (476, 223).
; PLAN: r0=38(x), r1=63(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=476(x), r6=223(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 38
LDI r1, 63
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 476
LDI r6, 223
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
