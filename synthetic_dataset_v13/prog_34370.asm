; DESCRIPTION: Composite: Places a black dot at position (506, 255) then Creates a green circular shape at (316, 91) with radius 60.
; PLAN: r0=506(x), r1=255(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=316(x), r6=91(y), r7=60(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 506
LDI r1, 255
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 316
LDI r6, 91
LDI r7, 60
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
