; DESCRIPTION: Composite: Creates a black circular shape at (107, 177) with radius 15 then Sets a single blue pixel at (203, 22) then Creates a blue rectangular region at (359, 44) spanning 92 by 115 pixels.
; PLAN: r0=107(x), r1=177(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=203(x), r6=22(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=359(x), r11=44(y), r12=92(width), r13=115(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 107
LDI r1, 177
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 203
LDI r6, 22
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 359
LDI r11, 44
LDI r12, 92
LDI r13, 115
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
