; DESCRIPTION: Composite: Draws a black circle centered at (430, 223) with radius 30 then Sets a single yellow pixel at (369, 174) then Places a blue line segment connecting (506, 165) to (62, 68).
; PLAN: r0=430(x), r1=223(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=369(x), r6=174(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=506(x1), r11=165(y1), r12=62(x2), r13=68(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 430
LDI r1, 223
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 369
LDI r6, 174
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 506
LDI r11, 165
LDI r12, 62
LDI r13, 68
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
