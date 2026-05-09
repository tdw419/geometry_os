; DESCRIPTION: Composite: Places a yellow circle of radius 14 at center (96, 125) then Places a black dot at position (251, 201) then Draws a purple line from (4, 150) to (325, 134).
; PLAN: r0=96(x), r1=125(y), r2=14(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x), r6=201(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=4(x1), r11=150(y1), r12=325(x2), r13=134(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 96
LDI r1, 125
LDI r2, 14
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 201
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 4
LDI r11, 150
LDI r12, 325
LDI r13, 134
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
