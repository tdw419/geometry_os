; DESCRIPTION: Composite: Places a purple dot at position (248, 91) then Creates a cyan circular shape at (331, 181) with radius 68 then Creates a orange rectangular region at (236, 64) spanning 85 by 46 pixels.
; PLAN: r0=248(x), r1=91(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=331(x), r6=181(y), r7=68(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=236(x), r11=64(y), r12=85(width), r13=46(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 91
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 331
LDI r6, 181
LDI r7, 68
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 236
LDI r11, 64
LDI r12, 85
LDI r13, 46
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
