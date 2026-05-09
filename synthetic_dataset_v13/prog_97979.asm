; DESCRIPTION: Composite: Places a red line segment connecting (95, 161) to (334, 160) then Sets a single purple pixel at (192, 106) then Places a black circle of radius 22 at center (247, 187).
; PLAN: r0=95(x1), r1=161(y1), r2=334(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=192(x), r6=106(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=247(x), r11=187(y), r12=22(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 95
LDI r1, 161
LDI r2, 334
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 106
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 247
LDI r11, 187
LDI r12, 22
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
