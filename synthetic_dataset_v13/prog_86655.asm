; DESCRIPTION: Composite: Renders a green line between points (207, 248) and (458, 40) then Places a black dot at position (22, 138) then Creates a purple circular shape at (282, 19) with radius 12.
; PLAN: r0=207(x1), r1=248(y1), r2=458(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=22(x), r6=138(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=282(x), r11=19(y), r12=12(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 207
LDI r1, 248
LDI r2, 458
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 138
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 282
LDI r11, 19
LDI r12, 12
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
