; DESCRIPTION: Composite: Places a magenta circle of radius 33 at center (462, 112) then Sets a single black pixel at (366, 208) then Draws a red line from (66, 254) to (315, 107).
; PLAN: r0=462(x), r1=112(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=366(x), r6=208(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=66(x1), r11=254(y1), r12=315(x2), r13=107(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 462
LDI r1, 112
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 366
LDI r6, 208
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 66
LDI r11, 254
LDI r12, 315
LDI r13, 107
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
