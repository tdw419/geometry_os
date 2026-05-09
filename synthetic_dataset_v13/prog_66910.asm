; DESCRIPTION: Composite: Places a red circle of radius 19 at center (177, 78) then Sets a single blue pixel at (223, 16) then Creates a black rectangular region at (26, 22) spanning 14 by 89 pixels.
; PLAN: r0=177(x), r1=78(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=223(x), r6=16(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=26(x), r11=22(y), r12=14(width), r13=89(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 177
LDI r1, 78
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 223
LDI r6, 16
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 26
LDI r11, 22
LDI r12, 14
LDI r13, 89
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
