; DESCRIPTION: Composite: Sets a single blue pixel at (258, 212) then Draws a black circle centered at (319, 128) with radius 61 then Creates a black rectangular region at (2, 43) spanning 88 by 115 pixels.
; PLAN: r0=258(x), r1=212(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=319(x), r6=128(y), r7=61(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=2(x), r11=43(y), r12=88(width), r13=115(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 258
LDI r1, 212
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 319
LDI r6, 128
LDI r7, 61
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 2
LDI r11, 43
LDI r12, 88
LDI r13, 115
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
