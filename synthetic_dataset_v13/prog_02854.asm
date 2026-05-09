; DESCRIPTION: Composite: Renders a blue disk with center (278, 57) and radius 54 then Sets a single blue pixel at (8, 220) then Draws a yellow line from (163, 134) to (453, 84).
; PLAN: r0=278(x), r1=57(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=8(x), r6=220(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=163(x1), r11=134(y1), r12=453(x2), r13=84(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 278
LDI r1, 57
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 8
LDI r6, 220
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 163
LDI r11, 134
LDI r12, 453
LDI r13, 84
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
