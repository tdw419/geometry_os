; DESCRIPTION: Composite: Draws a yellow circle centered at (140, 177) with radius 78 then Sets a single white pixel at (474, 100).
; PLAN: r0=140(x), r1=177(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=474(x), r6=100(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 140
LDI r1, 177
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 474
LDI r6, 100
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
