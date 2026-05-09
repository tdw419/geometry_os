; DESCRIPTION: Composite: Creates a purple rectangular region at (331, 76) spanning 83 by 70 pixels then Creates a yellow circular shape at (252, 90) with radius 53 then Sets a single cyan pixel at (122, 2).
; PLAN: r0=331(x), r1=76(y), r2=83(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=252(x), r6=90(y), r7=53(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=122(x), r11=2(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 331
LDI r1, 76
LDI r2, 83
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 90
LDI r7, 53
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 122
LDI r11, 2
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
