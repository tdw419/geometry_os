; DESCRIPTION: Composite: Creates a orange rectangular region at (274, 72) spanning 94 by 47 pixels then Sets a single yellow pixel at (423, 97) then Creates a purple circular shape at (341, 174) with radius 36.
; PLAN: r0=274(x), r1=72(y), r2=94(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x), r6=97(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=341(x), r11=174(y), r12=36(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 274
LDI r1, 72
LDI r2, 94
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 97
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 341
LDI r11, 174
LDI r12, 36
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
