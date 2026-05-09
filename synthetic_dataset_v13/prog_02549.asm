; DESCRIPTION: Composite: Sets a single blue pixel at (283, 229) then Creates a magenta circular shape at (224, 88) with radius 48 then Creates a white rectangular region at (0, 89) spanning 39 by 119 pixels.
; PLAN: r0=283(x), r1=229(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=224(x), r6=88(y), r7=48(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=0(x), r11=89(y), r12=39(width), r13=119(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 283
LDI r1, 229
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 224
LDI r6, 88
LDI r7, 48
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 0
LDI r11, 89
LDI r12, 39
LDI r13, 119
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
