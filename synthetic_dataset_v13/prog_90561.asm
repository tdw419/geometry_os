; DESCRIPTION: Composite: Places a orange dot at position (503, 31) then Renders a purple line between points (411, 68) and (386, 17) then Renders a orange disk with center (390, 132) and radius 46.
; PLAN: r0=503(x), r1=31(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=411(x1), r6=68(y1), r7=386(x2), r8=17(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=390(x), r11=132(y), r12=46(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 503
LDI r1, 31
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 411
LDI r6, 68
LDI r7, 386
LDI r8, 17
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 132
LDI r12, 46
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
