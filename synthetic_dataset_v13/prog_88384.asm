; DESCRIPTION: Composite: Places a red line segment connecting (64, 186) to (260, 67) then Sets a single orange pixel at (205, 105) then Draws a yellow circle centered at (294, 137) with radius 37.
; PLAN: r0=64(x1), r1=186(y1), r2=260(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=105(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=294(x), r11=137(y), r12=37(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 64
LDI r1, 186
LDI r2, 260
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 105
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 294
LDI r11, 137
LDI r12, 37
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
