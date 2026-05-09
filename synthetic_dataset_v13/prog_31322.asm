; DESCRIPTION: Composite: Draws a purple line from (267, 192) to (412, 145) then Places a blue dot at position (154, 95) then Renders a purple disk with center (129, 146) and radius 62.
; PLAN: r0=267(x1), r1=192(y1), r2=412(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=154(x), r6=95(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=129(x), r11=146(y), r12=62(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 267
LDI r1, 192
LDI r2, 412
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 95
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 129
LDI r11, 146
LDI r12, 62
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
