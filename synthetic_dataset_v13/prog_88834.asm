; DESCRIPTION: Composite: Draws a green circle centered at (194, 73) with radius 12 then Sets a single white pixel at (69, 117).
; PLAN: r0=194(x), r1=73(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=69(x), r6=117(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 194
LDI r1, 73
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 69
LDI r6, 117
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
