; DESCRIPTION: Composite: Places a green circle of radius 61 at center (89, 81) then Renders a blue line between points (312, 181) and (491, 159) then Places a orange dot at position (176, 242).
; PLAN: r0=89(x), r1=81(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x1), r6=181(y1), r7=491(x2), r8=159(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=176(x), r11=242(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 89
LDI r1, 81
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 181
LDI r7, 491
LDI r8, 159
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 242
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
