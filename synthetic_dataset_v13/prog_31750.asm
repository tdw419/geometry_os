; DESCRIPTION: Composite: Sets a single blue pixel at (476, 182) then Renders a green line between points (406, 198) and (497, 161) then Places a green circle of radius 28 at center (149, 129).
; PLAN: r0=476(x), r1=182(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=406(x1), r6=198(y1), r7=497(x2), r8=161(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=149(x), r11=129(y), r12=28(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 476
LDI r1, 182
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 406
LDI r6, 198
LDI r7, 497
LDI r8, 161
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 149
LDI r11, 129
LDI r12, 28
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
