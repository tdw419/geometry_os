; DESCRIPTION: Composite: Creates a purple circular shape at (321, 155) with radius 80 then Sets a single purple pixel at (456, 130) then Draws a blue line from (221, 248) to (150, 122).
; PLAN: r0=321(x), r1=155(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=456(x), r6=130(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=221(x1), r11=248(y1), r12=150(x2), r13=122(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 155
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 456
LDI r6, 130
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 221
LDI r11, 248
LDI r12, 150
LDI r13, 122
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
