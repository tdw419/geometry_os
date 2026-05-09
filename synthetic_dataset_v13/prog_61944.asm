; DESCRIPTION: Composite: Draws a white circle centered at (312, 68) with radius 34 then Sets a single blue pixel at (291, 125).
; PLAN: r0=312(x), r1=68(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=291(x), r6=125(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 312
LDI r1, 68
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 291
LDI r6, 125
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
