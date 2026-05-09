; DESCRIPTION: Composite: Creates a blue circular shape at (112, 60) with radius 49 then Sets a single white pixel at (268, 66).
; PLAN: r0=112(x), r1=60(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=268(x), r6=66(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 112
LDI r1, 60
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 268
LDI r6, 66
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
