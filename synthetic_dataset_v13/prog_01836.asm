; DESCRIPTION: Composite: Renders a blue line between points (129, 203) and (428, 173) then Sets a single black pixel at (170, 165) then Draws a magenta circle centered at (432, 137) with radius 32.
; PLAN: r0=129(x1), r1=203(y1), r2=428(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=165(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=432(x), r11=137(y), r12=32(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 129
LDI r1, 203
LDI r2, 428
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 165
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 432
LDI r11, 137
LDI r12, 32
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
