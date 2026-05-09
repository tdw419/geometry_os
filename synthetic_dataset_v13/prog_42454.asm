; DESCRIPTION: Composite: Renders a black disk with center (369, 86) and radius 49 then Sets a single magenta pixel at (98, 234) then Creates a purple rectangular region at (336, 30) spanning 105 by 47 pixels.
; PLAN: r0=369(x), r1=86(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x), r6=234(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=336(x), r11=30(y), r12=105(width), r13=47(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 86
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 234
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 336
LDI r11, 30
LDI r12, 105
LDI r13, 47
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
