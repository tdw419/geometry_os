; DESCRIPTION: Composite: Places a white circle of radius 39 at center (378, 182) then Sets a single blue pixel at (249, 102) then Creates a black rectangular region at (26, 10) spanning 62 by 120 pixels.
; PLAN: r0=378(x), r1=182(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x), r6=102(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=26(x), r11=10(y), r12=62(width), r13=120(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 182
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 102
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 26
LDI r11, 10
LDI r12, 62
LDI r13, 120
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
