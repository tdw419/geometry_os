; DESCRIPTION: Composite: Renders a black box of size 89x77 starting at (77, 107) then Sets a single magenta pixel at (378, 191) then Creates a purple circular shape at (129, 82) with radius 69.
; PLAN: r0=77(x), r1=107(y), r2=89(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=378(x), r6=191(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=129(x), r11=82(y), r12=69(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 77
LDI r1, 107
LDI r2, 89
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 191
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 129
LDI r11, 82
LDI r12, 69
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
