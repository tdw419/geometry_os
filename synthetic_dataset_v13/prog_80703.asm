; DESCRIPTION: Composite: Places a black dot at position (131, 88) then Creates a yellow circular shape at (274, 178) with radius 50.
; PLAN: r0=131(x), r1=88(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=274(x), r6=178(y), r7=50(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 131
LDI r1, 88
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 274
LDI r6, 178
LDI r7, 50
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
