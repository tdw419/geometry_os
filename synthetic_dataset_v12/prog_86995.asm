; DESCRIPTION: Composite: Draws a black line from (133, 233) to (26, 54) then Sets a single black pixel at (450, 116) then Creates a white circular shape at (160, 77) with radius 69.
; PLAN: r0=133(x1), r1=233(y1), r2=26(x2), r3=54(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=450(x), r6=116(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=160(x), r11=77(y), r12=69(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 133
LDI r1, 233
LDI r2, 26
LDI r3, 54
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 116
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 160
LDI r11, 77
LDI r12, 69
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
