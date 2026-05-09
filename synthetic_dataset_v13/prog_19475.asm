; DESCRIPTION: Composite: Sets a single green pixel at (2, 52) then Creates a black circular shape at (191, 123) with radius 77 then Creates a white rectangular region at (149, 134) spanning 21 by 55 pixels.
; PLAN: r0=2(x), r1=52(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=191(x), r6=123(y), r7=77(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=149(x), r11=134(y), r12=21(width), r13=55(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 2
LDI r1, 52
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 191
LDI r6, 123
LDI r7, 77
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 149
LDI r11, 134
LDI r12, 21
LDI r13, 55
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
