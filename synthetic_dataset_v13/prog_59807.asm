; DESCRIPTION: Composite: Creates a red circular shape at (376, 56) with radius 10 then Sets a single black pixel at (153, 136) then Creates a blue rectangular region at (196, 79) spanning 105 by 57 pixels.
; PLAN: r0=376(x), r1=56(y), r2=10(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=153(x), r6=136(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=196(x), r11=79(y), r12=105(width), r13=57(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 376
LDI r1, 56
LDI r2, 10
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 153
LDI r6, 136
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 196
LDI r11, 79
LDI r12, 105
LDI r13, 57
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
