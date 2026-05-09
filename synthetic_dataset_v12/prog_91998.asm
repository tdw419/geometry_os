; DESCRIPTION: Composite: Creates a blue circular shape at (400, 76) with radius 49 then Places a white dot at position (39, 185) then Draws a purple line from (366, 171) to (347, 178).
; PLAN: r0=400(x), r1=76(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=39(x), r6=185(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=366(x1), r11=171(y1), r12=347(x2), r13=178(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 76
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 39
LDI r6, 185
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 366
LDI r11, 171
LDI r12, 347
LDI r13, 178
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
