; DESCRIPTION: Composite: Draws a blue circle centered at (400, 156) with radius 61 then Sets a single white pixel at (219, 234).
; PLAN: r0=400(x), r1=156(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=219(x), r6=234(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 400
LDI r1, 156
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 219
LDI r6, 234
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
