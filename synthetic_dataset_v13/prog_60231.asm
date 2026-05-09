; DESCRIPTION: Composite: Places a blue line segment connecting (324, 160) to (91, 164) then Places a blue circle of radius 63 at center (158, 178) then Places a black dot at position (391, 199).
; PLAN: r0=324(x1), r1=160(y1), r2=91(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=158(x), r6=178(y), r7=63(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=391(x), r11=199(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 324
LDI r1, 160
LDI r2, 91
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 178
LDI r7, 63
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 391
LDI r11, 199
LDI r12, 0x000000
PSET r10, r11, r12
HALT
