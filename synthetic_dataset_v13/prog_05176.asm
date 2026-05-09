; DESCRIPTION: Composite: Renders a green disk with center (360, 99) and radius 55 then Sets a single white pixel at (407, 4) then Renders a orange line between points (237, 49) and (250, 220).
; PLAN: r0=360(x), r1=99(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=407(x), r6=4(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=237(x1), r11=49(y1), r12=250(x2), r13=220(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 99
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 407
LDI r6, 4
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 237
LDI r11, 49
LDI r12, 250
LDI r13, 220
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
