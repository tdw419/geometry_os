; DESCRIPTION: Composite: Places a red circle of radius 68 at center (340, 109) then Places a black dot at position (188, 184) then Creates a black rectangular region at (219, 141) spanning 54 by 66 pixels.
; PLAN: r0=340(x), r1=109(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=188(x), r6=184(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=219(x), r11=141(y), r12=54(width), r13=66(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 109
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 188
LDI r6, 184
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 219
LDI r11, 141
LDI r12, 54
LDI r13, 66
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
