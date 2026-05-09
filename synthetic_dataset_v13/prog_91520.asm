; DESCRIPTION: Composite: Draws a yellow circle centered at (194, 188) with radius 52 then Places a green dot at position (325, 14) then Places a red line segment connecting (132, 216) to (240, 105).
; PLAN: r0=194(x), r1=188(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=325(x), r6=14(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=132(x1), r11=216(y1), r12=240(x2), r13=105(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 194
LDI r1, 188
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 325
LDI r6, 14
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 132
LDI r11, 216
LDI r12, 240
LDI r13, 105
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
