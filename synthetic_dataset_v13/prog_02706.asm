; DESCRIPTION: Composite: Places a green circle of radius 15 at center (483, 234) then Places a white dot at position (312, 132) then Places a yellow line segment connecting (170, 57) to (133, 164).
; PLAN: r0=483(x), r1=234(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x), r6=132(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=170(x1), r11=57(y1), r12=133(x2), r13=164(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 483
LDI r1, 234
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 132
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 170
LDI r11, 57
LDI r12, 133
LDI r13, 164
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
