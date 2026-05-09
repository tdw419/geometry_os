; DESCRIPTION: Composite: Places a white dot at position (191, 181) then Draws a black circle centered at (108, 100) with radius 46 then Creates a yellow rectangular region at (172, 85) spanning 96 by 11 pixels.
; PLAN: r0=191(x), r1=181(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=108(x), r6=100(y), r7=46(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=172(x), r11=85(y), r12=96(width), r13=11(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 181
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 108
LDI r6, 100
LDI r7, 46
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 172
LDI r11, 85
LDI r12, 96
LDI r13, 11
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
