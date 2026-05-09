; DESCRIPTION: Composite: Draws a purple circle centered at (181, 83) with radius 73 then Places a magenta dot at position (278, 210) then Creates a purple rectangular region at (244, 53) spanning 119 by 110 pixels.
; PLAN: r0=181(x), r1=83(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x), r6=210(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=244(x), r11=53(y), r12=119(width), r13=110(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 181
LDI r1, 83
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 210
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 244
LDI r11, 53
LDI r12, 119
LDI r13, 110
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
