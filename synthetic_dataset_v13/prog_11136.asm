; DESCRIPTION: Composite: Creates a green circular shape at (174, 138) with radius 54 then Sets a single black pixel at (66, 68).
; PLAN: r0=174(x), r1=138(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=66(x), r6=68(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 174
LDI r1, 138
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 66
LDI r6, 68
LDI r7, 0x000000
PSET r5, r6, r7
HALT
