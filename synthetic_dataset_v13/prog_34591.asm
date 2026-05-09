; DESCRIPTION: Composite: Places a green dot at position (251, 15) then Places a purple line segment connecting (489, 162) to (421, 36) then Places a red circle of radius 75 at center (329, 175).
; PLAN: r0=251(x), r1=15(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=489(x1), r6=162(y1), r7=421(x2), r8=36(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=329(x), r11=175(y), r12=75(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 251
LDI r1, 15
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 489
LDI r6, 162
LDI r7, 421
LDI r8, 36
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 329
LDI r11, 175
LDI r12, 75
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
