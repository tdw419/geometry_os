; DESCRIPTION: Composite: Places a black dot at position (310, 181) then Places a black line segment connecting (176, 148) to (222, 184) then Renders a yellow disk with center (452, 80) and radius 40.
; PLAN: r0=310(x), r1=181(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=176(x1), r6=148(y1), r7=222(x2), r8=184(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=452(x), r11=80(y), r12=40(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 310
LDI r1, 181
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 176
LDI r6, 148
LDI r7, 222
LDI r8, 184
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 452
LDI r11, 80
LDI r12, 40
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
