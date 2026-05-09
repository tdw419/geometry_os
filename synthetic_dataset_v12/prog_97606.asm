; DESCRIPTION: Composite: Renders a magenta line between points (424, 82) and (394, 184) then Sets a single blue pixel at (132, 53) then Creates a yellow circular shape at (311, 68) with radius 62.
; PLAN: r0=424(x1), r1=82(y1), r2=394(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=132(x), r6=53(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=311(x), r11=68(y), r12=62(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 424
LDI r1, 82
LDI r2, 394
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 53
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 311
LDI r11, 68
LDI r12, 62
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
