; DESCRIPTION: Composite: Renders a purple line between points (99, 155) and (337, 35) then Places a black dot at position (499, 162) then Renders a green disk with center (306, 150) and radius 78.
; PLAN: r0=99(x1), r1=155(y1), r2=337(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=499(x), r6=162(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=306(x), r11=150(y), r12=78(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 99
LDI r1, 155
LDI r2, 337
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 499
LDI r6, 162
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 306
LDI r11, 150
LDI r12, 78
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
