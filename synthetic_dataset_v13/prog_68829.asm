; DESCRIPTION: Composite: Draws a cyan circle centered at (303, 188) with radius 58 then Sets a single black pixel at (268, 31).
; PLAN: r0=303(x), r1=188(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=268(x), r6=31(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 303
LDI r1, 188
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 268
LDI r6, 31
LDI r7, 0x000000
PSET r5, r6, r7
HALT
