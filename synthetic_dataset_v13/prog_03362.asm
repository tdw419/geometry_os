; DESCRIPTION: Composite: Places a green line segment connecting (133, 242) to (77, 215) then Sets a single black pixel at (102, 227) then Renders a orange disk with center (288, 171) and radius 36.
; PLAN: r0=133(x1), r1=242(y1), r2=77(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=102(x), r6=227(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=288(x), r11=171(y), r12=36(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 133
LDI r1, 242
LDI r2, 77
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 227
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 288
LDI r11, 171
LDI r12, 36
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
