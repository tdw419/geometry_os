; DESCRIPTION: Composite: Sets a single orange pixel at (70, 223) then Places a yellow line segment connecting (427, 196) to (431, 92) then Creates a green circular shape at (194, 66) with radius 29.
; PLAN: r0=70(x), r1=223(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=427(x1), r6=196(y1), r7=431(x2), r8=92(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=194(x), r11=66(y), r12=29(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 70
LDI r1, 223
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 427
LDI r6, 196
LDI r7, 431
LDI r8, 92
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 194
LDI r11, 66
LDI r12, 29
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
