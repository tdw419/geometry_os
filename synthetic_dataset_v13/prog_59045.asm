; DESCRIPTION: Composite: Renders a green line between points (367, 90) and (431, 2) then Sets a single red pixel at (488, 46) then Renders a white disk with center (364, 119) and radius 38.
; PLAN: r0=367(x1), r1=90(y1), r2=431(x2), r3=2(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=488(x), r6=46(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=364(x), r11=119(y), r12=38(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 367
LDI r1, 90
LDI r2, 431
LDI r3, 2
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 46
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 364
LDI r11, 119
LDI r12, 38
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
