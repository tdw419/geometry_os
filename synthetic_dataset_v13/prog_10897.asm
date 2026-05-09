; DESCRIPTION: Composite: Draws a black line from (55, 31) to (286, 82) then Creates a purple circular shape at (373, 175) with radius 53 then Sets a single yellow pixel at (57, 149).
; PLAN: r0=55(x1), r1=31(y1), r2=286(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=175(y), r7=53(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=57(x), r11=149(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 55
LDI r1, 31
LDI r2, 286
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 175
LDI r7, 53
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 57
LDI r11, 149
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
