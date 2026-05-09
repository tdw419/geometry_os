; DESCRIPTION: Composite: Draws a cyan line from (71, 220) to (487, 87) then Sets a single red pixel at (357, 227) then Creates a purple circular shape at (107, 175) with radius 34.
; PLAN: r0=71(x1), r1=220(y1), r2=487(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=357(x), r6=227(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=107(x), r11=175(y), r12=34(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 71
LDI r1, 220
LDI r2, 487
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 227
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 107
LDI r11, 175
LDI r12, 34
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
