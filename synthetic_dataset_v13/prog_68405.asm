; DESCRIPTION: Composite: Places a black dot at position (275, 88) then Creates a green circular shape at (274, 40) with radius 32.
; PLAN: r0=275(x), r1=88(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=274(x), r6=40(y), r7=32(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 275
LDI r1, 88
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 274
LDI r6, 40
LDI r7, 32
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
