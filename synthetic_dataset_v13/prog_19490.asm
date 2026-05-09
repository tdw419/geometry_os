; DESCRIPTION: Composite: Sets a single red pixel at (286, 240) then Creates a black circular shape at (396, 188) with radius 36 then Creates a green rectangular region at (309, 84) spanning 110 by 49 pixels.
; PLAN: r0=286(x), r1=240(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=396(x), r6=188(y), r7=36(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=309(x), r11=84(y), r12=110(width), r13=49(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 286
LDI r1, 240
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 396
LDI r6, 188
LDI r7, 36
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 309
LDI r11, 84
LDI r12, 110
LDI r13, 49
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
