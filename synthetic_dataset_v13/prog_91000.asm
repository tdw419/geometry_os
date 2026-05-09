; DESCRIPTION: Composite: Places a yellow line segment connecting (499, 174) to (411, 6) then Sets a single red pixel at (5, 100) then Places a blue circle of radius 47 at center (90, 186).
; PLAN: r0=499(x1), r1=174(y1), r2=411(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=5(x), r6=100(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=90(x), r11=186(y), r12=47(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 499
LDI r1, 174
LDI r2, 411
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 100
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 90
LDI r11, 186
LDI r12, 47
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
