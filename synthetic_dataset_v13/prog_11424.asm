; DESCRIPTION: Composite: Renders a yellow disk with center (225, 116) and radius 29 then Sets a single blue pixel at (396, 62) then Creates a white rectangular region at (299, 108) spanning 110 by 17 pixels.
; PLAN: r0=225(x), r1=116(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x), r6=62(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=299(x), r11=108(y), r12=110(width), r13=17(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 225
LDI r1, 116
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 62
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 299
LDI r11, 108
LDI r12, 110
LDI r13, 17
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
