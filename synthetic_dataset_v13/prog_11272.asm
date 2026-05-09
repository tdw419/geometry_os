; DESCRIPTION: Composite: Draws a white circle centered at (253, 177) with radius 71 then Sets a single yellow pixel at (157, 186).
; PLAN: r0=253(x), r1=177(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x), r6=186(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 253
LDI r1, 177
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 186
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
