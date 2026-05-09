; DESCRIPTION: Composite: Places a purple line segment connecting (64, 236) to (236, 93) then Places a blue dot at position (129, 148) then Draws a purple circle centered at (441, 159) with radius 47.
; PLAN: r0=64(x1), r1=236(y1), r2=236(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=148(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=441(x), r11=159(y), r12=47(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 64
LDI r1, 236
LDI r2, 236
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 148
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 441
LDI r11, 159
LDI r12, 47
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
