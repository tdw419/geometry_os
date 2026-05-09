; DESCRIPTION: Composite: Draws a cyan circle centered at (148, 85) with radius 20 then Sets a single white pixel at (3, 211).
; PLAN: r0=148(x), r1=85(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=3(x), r6=211(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 148
LDI r1, 85
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 3
LDI r6, 211
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
