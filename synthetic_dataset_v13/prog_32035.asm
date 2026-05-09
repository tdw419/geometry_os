; DESCRIPTION: Composite: Draws a orange circle centered at (49, 222) with radius 26 then Sets a single orange pixel at (337, 50) then Places a magenta line segment connecting (407, 9) to (144, 105).
; PLAN: r0=49(x), r1=222(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=337(x), r6=50(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=407(x1), r11=9(y1), r12=144(x2), r13=105(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 222
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 337
LDI r6, 50
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 407
LDI r11, 9
LDI r12, 144
LDI r13, 105
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
