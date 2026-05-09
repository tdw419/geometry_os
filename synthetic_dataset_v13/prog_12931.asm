; DESCRIPTION: Composite: Places a white circle of radius 47 at center (409, 78) then Sets a single black pixel at (104, 90) then Creates a orange rectangular region at (259, 12) spanning 119 by 81 pixels.
; PLAN: r0=409(x), r1=78(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x), r6=90(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=259(x), r11=12(y), r12=119(width), r13=81(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 78
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 90
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 259
LDI r11, 12
LDI r12, 119
LDI r13, 81
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
