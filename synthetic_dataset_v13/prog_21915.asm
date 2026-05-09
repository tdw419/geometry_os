; DESCRIPTION: Composite: Places a red dot at position (58, 142) then Creates a black circular shape at (454, 192) with radius 46 then Creates a red rectangular region at (314, 102) spanning 19 by 51 pixels.
; PLAN: r0=58(x), r1=142(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=454(x), r6=192(y), r7=46(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=314(x), r11=102(y), r12=19(width), r13=51(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 58
LDI r1, 142
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 454
LDI r6, 192
LDI r7, 46
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 314
LDI r11, 102
LDI r12, 19
LDI r13, 51
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
