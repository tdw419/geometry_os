; DESCRIPTION: Composite: Creates a green circular shape at (88, 105) with radius 72 then Places a green dot at position (166, 114).
; PLAN: r0=88(x), r1=105(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=166(x), r6=114(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 88
LDI r1, 105
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 166
LDI r6, 114
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
