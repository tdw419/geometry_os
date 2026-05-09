; DESCRIPTION: Composite: Places a yellow circle of radius 38 at center (288, 204) then Places a magenta line segment connecting (331, 143) to (147, 248) then Places a orange dot at position (175, 65).
; PLAN: r0=288(x), r1=204(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=331(x1), r6=143(y1), r7=147(x2), r8=248(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=175(x), r11=65(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 288
LDI r1, 204
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 331
LDI r6, 143
LDI r7, 147
LDI r8, 248
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 65
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
