; DESCRIPTION: Composite: Draws a blue circle centered at (407, 193) with radius 47 then Sets a single green pixel at (229, 187) then Draws a blue line from (140, 66) to (366, 56).
; PLAN: r0=407(x), r1=193(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=229(x), r6=187(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=140(x1), r11=66(y1), r12=366(x2), r13=56(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 407
LDI r1, 193
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 229
LDI r6, 187
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 140
LDI r11, 66
LDI r12, 366
LDI r13, 56
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
