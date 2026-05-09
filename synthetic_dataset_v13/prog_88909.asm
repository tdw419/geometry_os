; DESCRIPTION: Composite: Sets a single black pixel at (53, 193) then Renders a blue line between points (76, 241) and (35, 13) then Renders a black disk with center (269, 99) and radius 55.
; PLAN: r0=53(x), r1=193(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=76(x1), r6=241(y1), r7=35(x2), r8=13(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=269(x), r11=99(y), r12=55(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 53
LDI r1, 193
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 76
LDI r6, 241
LDI r7, 35
LDI r8, 13
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 99
LDI r12, 55
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
