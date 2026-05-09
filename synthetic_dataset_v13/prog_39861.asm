; DESCRIPTION: Composite: Renders a blue disk with center (366, 150) and radius 52 then Sets a single yellow pixel at (241, 255) then Renders a orange line between points (78, 91) and (507, 202).
; PLAN: r0=366(x), r1=150(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=241(x), r6=255(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=78(x1), r11=91(y1), r12=507(x2), r13=202(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 366
LDI r1, 150
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 241
LDI r6, 255
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 78
LDI r11, 91
LDI r12, 507
LDI r13, 202
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
