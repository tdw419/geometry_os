; DESCRIPTION: Composite: Places a magenta line segment connecting (175, 220) to (81, 14) then Sets a single blue pixel at (416, 75) then Draws a black circle centered at (282, 126) with radius 25.
; PLAN: r0=175(x1), r1=220(y1), r2=81(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=75(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=282(x), r11=126(y), r12=25(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 175
LDI r1, 220
LDI r2, 81
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 75
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 282
LDI r11, 126
LDI r12, 25
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
