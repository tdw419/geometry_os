; DESCRIPTION: Composite: Places a black 112x110 rectangle at position (268, 72) then Sets a single blue pixel at (36, 21) then Creates a green circular shape at (457, 112) with radius 21.
; PLAN: r0=268(x), r1=72(y), r2=112(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=36(x), r6=21(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=457(x), r11=112(y), r12=21(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 268
LDI r1, 72
LDI r2, 112
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 21
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 457
LDI r11, 112
LDI r12, 21
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
