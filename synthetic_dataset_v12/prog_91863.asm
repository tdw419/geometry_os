; DESCRIPTION: Composite: Creates a black circular shape at (196, 154) with radius 43 then Sets a single blue pixel at (504, 253) then Places a black line segment connecting (495, 203) to (411, 64).
; PLAN: r0=196(x), r1=154(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=504(x), r6=253(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=495(x1), r11=203(y1), r12=411(x2), r13=64(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 154
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 504
LDI r6, 253
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 495
LDI r11, 203
LDI r12, 411
LDI r13, 64
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
