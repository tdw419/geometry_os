; DESCRIPTION: Composite: Places a green circle of radius 20 at center (172, 163) then Sets a single yellow pixel at (457, 115) then Renders a yellow line between points (223, 112) and (13, 224).
; PLAN: r0=172(x), r1=163(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x), r6=115(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=223(x1), r11=112(y1), r12=13(x2), r13=224(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 172
LDI r1, 163
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 115
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 223
LDI r11, 112
LDI r12, 13
LDI r13, 224
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
