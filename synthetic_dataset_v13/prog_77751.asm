; DESCRIPTION: Composite: Draws a purple circle centered at (128, 54) with radius 33 then Creates a orange rectangular region at (8, 48) spanning 87 by 77 pixels then Sets a single black pixel at (440, 66).
; PLAN: r0=128(x), r1=54(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=8(x), r6=48(y), r7=87(width), r8=77(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=440(x), r11=66(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 128
LDI r1, 54
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 8
LDI r6, 48
LDI r7, 87
LDI r8, 77
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 440
LDI r11, 66
LDI r12, 0x000000
PSET r10, r11, r12
HALT
