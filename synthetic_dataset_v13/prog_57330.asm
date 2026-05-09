; DESCRIPTION: Composite: Renders a white line between points (144, 239) and (428, 155) then Places a purple dot at position (78, 120) then Creates a blue circular shape at (381, 184) with radius 45.
; PLAN: r0=144(x1), r1=239(y1), r2=428(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=78(x), r6=120(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=381(x), r11=184(y), r12=45(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 144
LDI r1, 239
LDI r2, 428
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 120
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 381
LDI r11, 184
LDI r12, 45
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
