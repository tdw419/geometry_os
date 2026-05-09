; DESCRIPTION: Composite: Places a green dot at position (289, 14) then Creates a red circular shape at (201, 148) with radius 72.
; PLAN: r0=289(x), r1=14(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=201(x), r6=148(y), r7=72(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 289
LDI r1, 14
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 201
LDI r6, 148
LDI r7, 72
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
