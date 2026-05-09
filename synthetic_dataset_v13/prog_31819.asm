; DESCRIPTION: Composite: Renders a purple line between points (390, 85) and (201, 154) then Renders a magenta disk with center (103, 119) and radius 77 then Places a blue dot at position (107, 155).
; PLAN: r0=390(x1), r1=85(y1), r2=201(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=119(y), r7=77(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=107(x), r11=155(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 390
LDI r1, 85
LDI r2, 201
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 119
LDI r7, 77
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 107
LDI r11, 155
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
