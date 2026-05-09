; DESCRIPTION: Composite: Places a green dot at position (254, 123) then Creates a black circular shape at (58, 199) with radius 51 then Creates a white rectangular region at (365, 17) spanning 19 by 91 pixels.
; PLAN: r0=254(x), r1=123(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=58(x), r6=199(y), r7=51(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=365(x), r11=17(y), r12=19(width), r13=91(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 123
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 58
LDI r6, 199
LDI r7, 51
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 365
LDI r11, 17
LDI r12, 19
LDI r13, 91
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
