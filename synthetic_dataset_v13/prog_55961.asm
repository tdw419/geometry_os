; DESCRIPTION: Composite: Places a magenta dot at position (438, 241) then Creates a blue circular shape at (227, 116) with radius 76.
; PLAN: r0=438(x), r1=241(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=227(x), r6=116(y), r7=76(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 438
LDI r1, 241
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 227
LDI r6, 116
LDI r7, 76
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
