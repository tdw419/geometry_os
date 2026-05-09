; DESCRIPTION: Composite: Places a purple dot at position (298, 18) then Draws a black line from (396, 48) to (227, 105) then Creates a blue circular shape at (102, 174) with radius 30.
; PLAN: r0=298(x), r1=18(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=396(x1), r6=48(y1), r7=227(x2), r8=105(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=102(x), r11=174(y), r12=30(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 298
LDI r1, 18
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 396
LDI r6, 48
LDI r7, 227
LDI r8, 105
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 102
LDI r11, 174
LDI r12, 30
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
