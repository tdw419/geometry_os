; DESCRIPTION: Composite: Draws a blue line from (381, 21) to (208, 34) then Sets a single white pixel at (87, 189) then Creates a white circular shape at (409, 120) with radius 75.
; PLAN: r0=381(x1), r1=21(y1), r2=208(x2), r3=34(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=87(x), r6=189(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=409(x), r11=120(y), r12=75(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 381
LDI r1, 21
LDI r2, 208
LDI r3, 34
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 189
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 409
LDI r11, 120
LDI r12, 75
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
