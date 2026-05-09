; DESCRIPTION: Composite: Draws a blue circle centered at (254, 73) with radius 72 then Sets a single black pixel at (425, 138).
; PLAN: r0=254(x), r1=73(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=425(x), r6=138(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 254
LDI r1, 73
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 425
LDI r6, 138
LDI r7, 0x000000
PSET r5, r6, r7
HALT
