; DESCRIPTION: Composite: Places a purple dot at position (133, 19) then Renders a blue line between points (234, 201) and (228, 132) then Creates a purple circular shape at (441, 97) with radius 42.
; PLAN: r0=133(x), r1=19(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=234(x1), r6=201(y1), r7=228(x2), r8=132(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=441(x), r11=97(y), r12=42(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 133
LDI r1, 19
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 234
LDI r6, 201
LDI r7, 228
LDI r8, 132
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 441
LDI r11, 97
LDI r12, 42
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
