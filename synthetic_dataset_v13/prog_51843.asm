; DESCRIPTION: Composite: Sets a single blue pixel at (286, 141) then Renders a orange line between points (8, 86) and (496, 253) then Renders a magenta disk with center (59, 123) and radius 31.
; PLAN: r0=286(x), r1=141(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=8(x1), r6=86(y1), r7=496(x2), r8=253(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=59(x), r11=123(y), r12=31(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 286
LDI r1, 141
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 8
LDI r6, 86
LDI r7, 496
LDI r8, 253
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 59
LDI r11, 123
LDI r12, 31
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
