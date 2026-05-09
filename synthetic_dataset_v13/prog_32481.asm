; DESCRIPTION: Composite: Renders a magenta line between points (325, 89) and (471, 43) then Places a yellow dot at position (184, 150) then Places a blue circle of radius 68 at center (79, 164).
; PLAN: r0=325(x1), r1=89(y1), r2=471(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=150(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=79(x), r11=164(y), r12=68(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 325
LDI r1, 89
LDI r2, 471
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 150
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 79
LDI r11, 164
LDI r12, 68
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
