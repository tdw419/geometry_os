; DESCRIPTION: Composite: Sets a single green pixel at (229, 53) then Places a purple circle of radius 25 at center (149, 72) then Creates a orange rectangular region at (97, 106) spanning 65 by 72 pixels.
; PLAN: r0=229(x), r1=53(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=149(x), r6=72(y), r7=25(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=97(x), r11=106(y), r12=65(width), r13=72(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 229
LDI r1, 53
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 149
LDI r6, 72
LDI r7, 25
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 97
LDI r11, 106
LDI r12, 65
LDI r13, 72
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
