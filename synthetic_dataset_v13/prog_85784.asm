; DESCRIPTION: Composite: Places a black line segment connecting (193, 235) to (438, 178) then Sets a single yellow pixel at (38, 198) then Places a orange circle of radius 59 at center (437, 125).
; PLAN: r0=193(x1), r1=235(y1), r2=438(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=198(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=437(x), r11=125(y), r12=59(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 193
LDI r1, 235
LDI r2, 438
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 198
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 437
LDI r11, 125
LDI r12, 59
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
