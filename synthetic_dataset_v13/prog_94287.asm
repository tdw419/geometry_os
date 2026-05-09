; DESCRIPTION: Composite: Renders a yellow disk with center (151, 199) and radius 45 then Places a yellow line segment connecting (428, 136) to (7, 187) then Sets a single red pixel at (435, 45).
; PLAN: r0=151(x), r1=199(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=428(x1), r6=136(y1), r7=7(x2), r8=187(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=435(x), r11=45(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 151
LDI r1, 199
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 428
LDI r6, 136
LDI r7, 7
LDI r8, 187
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 45
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
