; DESCRIPTION: Composite: Creates a yellow circular shape at (141, 94) with radius 40 then Sets a single blue pixel at (379, 252) then Creates a green rectangular region at (327, 77) spanning 86 by 105 pixels.
; PLAN: r0=141(x), r1=94(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x), r6=252(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=327(x), r11=77(y), r12=86(width), r13=105(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 141
LDI r1, 94
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 252
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 327
LDI r11, 77
LDI r12, 86
LDI r13, 105
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
