; DESCRIPTION: Composite: Places a cyan line segment connecting (396, 243) to (416, 189) then Sets a single yellow pixel at (133, 83) then Creates a purple circular shape at (430, 152) with radius 10.
; PLAN: r0=396(x1), r1=243(y1), r2=416(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=133(x), r6=83(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=430(x), r11=152(y), r12=10(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 396
LDI r1, 243
LDI r2, 416
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 83
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 430
LDI r11, 152
LDI r12, 10
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
