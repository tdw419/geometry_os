; DESCRIPTION: Composite: Places a orange dot at position (331, 227) then Places a green circle of radius 60 at center (110, 92) then Draws a purple line from (378, 142) to (211, 247).
; PLAN: r0=331(x), r1=227(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=110(x), r6=92(y), r7=60(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=378(x1), r11=142(y1), r12=211(x2), r13=247(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 331
LDI r1, 227
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 110
LDI r6, 92
LDI r7, 60
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 378
LDI r11, 142
LDI r12, 211
LDI r13, 247
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
