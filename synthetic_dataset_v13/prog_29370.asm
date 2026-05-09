; DESCRIPTION: Composite: Creates a purple rectangular region at (325, 27) spanning 61 by 54 pixels then Creates a blue circular shape at (129, 97) with radius 73 then Sets a single purple pixel at (193, 234).
; PLAN: r0=325(x), r1=27(y), r2=61(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x), r6=97(y), r7=73(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=193(x), r11=234(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 325
LDI r1, 27
LDI r2, 61
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 97
LDI r7, 73
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 193
LDI r11, 234
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
