; DESCRIPTION: Composite: Creates a purple circular shape at (87, 141) with radius 53 then Creates a yellow rectangular region at (428, 55) spanning 51 by 97 pixels then Sets a single white pixel at (13, 185).
; PLAN: r0=87(x), r1=141(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=428(x), r6=55(y), r7=51(width), r8=97(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=13(x), r11=185(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 87
LDI r1, 141
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 428
LDI r6, 55
LDI r7, 51
LDI r8, 97
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 13
LDI r11, 185
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
