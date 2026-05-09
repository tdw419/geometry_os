; DESCRIPTION: Composite: Creates a purple rectangular region at (360, 3) spanning 20 by 87 pixels then Sets a single black pixel at (299, 252) then Creates a purple circular shape at (244, 179) with radius 71.
; PLAN: r0=360(x), r1=3(y), r2=20(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x), r6=252(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=244(x), r11=179(y), r12=71(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 360
LDI r1, 3
LDI r2, 20
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 252
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 244
LDI r11, 179
LDI r12, 71
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
