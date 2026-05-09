; DESCRIPTION: Composite: Places a orange circle of radius 69 at center (124, 151) then Places a blue dot at position (43, 210) then Draws a orange line from (229, 145) to (256, 201).
; PLAN: r0=124(x), r1=151(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=43(x), r6=210(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=229(x1), r11=145(y1), r12=256(x2), r13=201(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 124
LDI r1, 151
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 43
LDI r6, 210
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 229
LDI r11, 145
LDI r12, 256
LDI r13, 201
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
