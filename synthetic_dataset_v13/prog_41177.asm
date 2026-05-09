; DESCRIPTION: Composite: Places a magenta line segment connecting (339, 20) to (125, 92) then Sets a single yellow pixel at (443, 223) then Renders a white disk with center (476, 167) and radius 33.
; PLAN: r0=339(x1), r1=20(y1), r2=125(x2), r3=92(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=443(x), r6=223(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=476(x), r11=167(y), r12=33(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 339
LDI r1, 20
LDI r2, 125
LDI r3, 92
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 223
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 476
LDI r11, 167
LDI r12, 33
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
