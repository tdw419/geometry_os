; DESCRIPTION: Composite: Draws a yellow circle centered at (347, 149) with radius 72 then Sets a single white pixel at (57, 249) then Renders a blue line between points (490, 220) and (353, 225).
; PLAN: r0=347(x), r1=149(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=57(x), r6=249(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=490(x1), r11=220(y1), r12=353(x2), r13=225(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 149
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 57
LDI r6, 249
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 490
LDI r11, 220
LDI r12, 353
LDI r13, 225
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
