; DESCRIPTION: Composite: Draws a white circle centered at (194, 131) with radius 49 then Sets a single green pixel at (300, 209).
; PLAN: r0=194(x), r1=131(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=300(x), r6=209(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 194
LDI r1, 131
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 300
LDI r6, 209
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
