; DESCRIPTION: Composite: Renders a green disk with center (471, 112) and radius 17 then Sets a single black pixel at (367, 103) then Draws a purple line from (369, 85) to (309, 59).
; PLAN: r0=471(x), r1=112(y), r2=17(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x), r6=103(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=369(x1), r11=85(y1), r12=309(x2), r13=59(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 471
LDI r1, 112
LDI r2, 17
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 103
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 369
LDI r11, 85
LDI r12, 309
LDI r13, 59
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
