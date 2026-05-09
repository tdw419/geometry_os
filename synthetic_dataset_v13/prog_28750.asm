; DESCRIPTION: Composite: Creates a yellow circular shape at (92, 237) with radius 16 then Creates a magenta rectangular region at (229, 11) spanning 94 by 105 pixels then Sets a single blue pixel at (299, 35).
; PLAN: r0=92(x), r1=237(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=229(x), r6=11(y), r7=94(width), r8=105(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=299(x), r11=35(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 92
LDI r1, 237
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 229
LDI r6, 11
LDI r7, 94
LDI r8, 105
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 299
LDI r11, 35
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
