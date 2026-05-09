; DESCRIPTION: Composite: Places a blue line segment connecting (432, 173) to (497, 23) then Creates a black circular shape at (422, 57) with radius 29 then Places a purple dot at position (439, 148).
; PLAN: r0=432(x1), r1=173(y1), r2=497(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=422(x), r6=57(y), r7=29(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=439(x), r11=148(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 432
LDI r1, 173
LDI r2, 497
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 57
LDI r7, 29
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 439
LDI r11, 148
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
