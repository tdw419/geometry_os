; DESCRIPTION: Composite: Renders a blue line between points (409, 10) and (201, 106) then Places a green dot at position (115, 170) then Places a yellow circle of radius 15 at center (57, 97).
; PLAN: r0=409(x1), r1=10(y1), r2=201(x2), r3=106(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=170(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=57(x), r11=97(y), r12=15(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 409
LDI r1, 10
LDI r2, 201
LDI r3, 106
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 170
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 57
LDI r11, 97
LDI r12, 15
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
