; DESCRIPTION: Composite: Places a black dot at position (309, 12) then Draws a purple line from (337, 41) to (325, 154) then Renders a black disk with center (232, 137) and radius 37.
; PLAN: r0=309(x), r1=12(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=337(x1), r6=41(y1), r7=325(x2), r8=154(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=232(x), r11=137(y), r12=37(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 309
LDI r1, 12
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 337
LDI r6, 41
LDI r7, 325
LDI r8, 154
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 232
LDI r11, 137
LDI r12, 37
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
