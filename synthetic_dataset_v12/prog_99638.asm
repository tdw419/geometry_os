; DESCRIPTION: Composite: Places a green dot at position (331, 48) then Places a yellow circle of radius 79 at center (277, 90) then Places a black line segment connecting (159, 144) to (188, 91).
; PLAN: r0=331(x), r1=48(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=277(x), r6=90(y), r7=79(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=159(x1), r11=144(y1), r12=188(x2), r13=91(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 331
LDI r1, 48
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 277
LDI r6, 90
LDI r7, 79
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 159
LDI r11, 144
LDI r12, 188
LDI r13, 91
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
