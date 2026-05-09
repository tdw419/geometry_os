; DESCRIPTION: Composite: Places a orange dot at position (24, 198) then Renders a purple line between points (201, 41) and (66, 6) then Renders a white disk with center (120, 172) and radius 29.
; PLAN: r0=24(x), r1=198(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=201(x1), r6=41(y1), r7=66(x2), r8=6(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=120(x), r11=172(y), r12=29(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 24
LDI r1, 198
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 201
LDI r6, 41
LDI r7, 66
LDI r8, 6
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 120
LDI r11, 172
LDI r12, 29
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
