; DESCRIPTION: Composite: Draws a cyan circle centered at (316, 106) with radius 48 then Sets a single white pixel at (7, 165).
; PLAN: r0=316(x), r1=106(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=7(x), r6=165(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 316
LDI r1, 106
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 7
LDI r6, 165
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
