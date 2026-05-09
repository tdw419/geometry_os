; DESCRIPTION: Composite: Sets a single blue pixel at (493, 4) then Places a yellow circle of radius 72 at center (78, 115) then Creates a green rectangular region at (14, 222) spanning 75 by 33 pixels.
; PLAN: r0=493(x), r1=4(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=78(x), r6=115(y), r7=72(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=14(x), r11=222(y), r12=75(width), r13=33(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 493
LDI r1, 4
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 78
LDI r6, 115
LDI r7, 72
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 14
LDI r11, 222
LDI r12, 75
LDI r13, 33
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
