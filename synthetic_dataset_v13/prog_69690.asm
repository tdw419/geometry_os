; DESCRIPTION: Composite: Places a orange line segment connecting (77, 216) to (187, 164) then Renders a black disk with center (347, 164) and radius 77.
; PLAN: r0=77(x1), r1=216(y1), r2=187(x2), r3=164(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=347(x), r6=164(y), r7=77(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 77
LDI r1, 216
LDI r2, 187
LDI r3, 164
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 164
LDI r7, 77
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
