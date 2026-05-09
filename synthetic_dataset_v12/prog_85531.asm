; DESCRIPTION: Composite: Renders a white line between points (453, 65) and (152, 3) then Sets a single magenta pixel at (353, 14) then Places a purple circle of radius 10 at center (455, 230).
; PLAN: r0=453(x1), r1=65(y1), r2=152(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=353(x), r6=14(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=455(x), r11=230(y), r12=10(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 453
LDI r1, 65
LDI r2, 152
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 14
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 455
LDI r11, 230
LDI r12, 10
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
