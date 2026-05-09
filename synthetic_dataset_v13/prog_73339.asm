; DESCRIPTION: Composite: Places a orange dot at position (91, 219) then Places a orange circle of radius 46 at center (316, 106) then Renders a purple line between points (391, 69) and (227, 189).
; PLAN: r0=91(x), r1=219(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=316(x), r6=106(y), r7=46(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=391(x1), r11=69(y1), r12=227(x2), r13=189(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 219
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 316
LDI r6, 106
LDI r7, 46
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 391
LDI r11, 69
LDI r12, 227
LDI r13, 189
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
