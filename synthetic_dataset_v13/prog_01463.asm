; DESCRIPTION: Composite: Renders a yellow line between points (85, 159) and (237, 127) then Places a purple dot at position (93, 145) then Places a magenta circle of radius 24 at center (29, 104).
; PLAN: r0=85(x1), r1=159(y1), r2=237(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=145(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=29(x), r11=104(y), r12=24(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 85
LDI r1, 159
LDI r2, 237
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 145
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 29
LDI r11, 104
LDI r12, 24
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
