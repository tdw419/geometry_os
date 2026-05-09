; DESCRIPTION: Composite: Creates a black rectangular region at (364, 226) spanning 86 by 19 pixels then Sets a single blue pixel at (315, 250) then Renders a yellow disk with center (77, 181) and radius 59.
; PLAN: r0=364(x), r1=226(y), r2=86(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=315(x), r6=250(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=77(x), r11=181(y), r12=59(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 364
LDI r1, 226
LDI r2, 86
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 250
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 77
LDI r11, 181
LDI r12, 59
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
