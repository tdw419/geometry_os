; DESCRIPTION: Composite: Places a red line segment connecting (23, 147) to (306, 255) then Renders a yellow disk with center (188, 136) and radius 60 then Sets a single black pixel at (271, 73).
; PLAN: r0=23(x1), r1=147(y1), r2=306(x2), r3=255(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=188(x), r6=136(y), r7=60(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=271(x), r11=73(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 23
LDI r1, 147
LDI r2, 306
LDI r3, 255
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 136
LDI r7, 60
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 271
LDI r11, 73
LDI r12, 0x000000
PSET r10, r11, r12
HALT
