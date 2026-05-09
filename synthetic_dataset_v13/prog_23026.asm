; DESCRIPTION: Composite: Places a white circle of radius 71 at center (383, 101) then Places a green dot at position (311, 154) then Places a black line segment connecting (389, 162) to (472, 4).
; PLAN: r0=383(x), r1=101(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=311(x), r6=154(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=389(x1), r11=162(y1), r12=472(x2), r13=4(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 101
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 311
LDI r6, 154
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 389
LDI r11, 162
LDI r12, 472
LDI r13, 4
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
